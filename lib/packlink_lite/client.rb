require 'rest-client'

module PacklinkLite
  class Client
    def get(path, params = nil)
      url = url(path)
      url+= '?' + build_nested_query(params) if params
      request(:get, url, headers)
    end

    def post(path, payload)
      payload = payload.to_json unless payload.is_a?(String)
      request(:post, url(path), payload, headers)
    end

    def delete(path)
      request(:delete, url(path))
    end

    private

    def request(method, *args)
      response = RestClient.send(method, *args)
      parse_response(response)
    rescue RestClient::Exception => e
      message = extract_error_message(e.http_body) || e.message
      raise Error.new(message, e.http_body, e.http_code)
    end

    def extract_error_message(body)
      result = parse_response(body)
      result['message'] || result['messages']
    rescue JSON::ParserError
    end

    def url(path)
      PacklinkLite.url + path
    end

    def parse_response(response)
      JSON.parse(response)
    end

    def headers
      { 'Authorization' => PacklinkLite.config.api_key,
        'Content-Type' => 'application/json' }
    end

    def build_nested_query(value, prefix = nil)
      case value
      when Array
        value.map { |v|
          build_nested_query(v, "#{prefix}[]")
        }.join("&")
      when Hash
        value.map { |k, v|
          build_nested_query(v, prefix ? "#{prefix}[#{escape(k)}]" : escape(k))
        }.reject(&:empty?).join('&')
      when nil
        prefix
      else
        raise ArgumentError, "value must be a Hash" if prefix.nil?
        "#{prefix}=#{escape(value)}"
      end
    end

    def escape(s)
      URI.encode_www_form_component(s)
    end
  end
end

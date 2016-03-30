require 'rest-client'

module PacklinkLite
  class Client
    def get(path, params = nil, options = {})
      url = url(path)
      url+= '?' + build_nested_query(params) if params
      response = request(:get, url, headers)
      process_response(response, options)
    end

    def post(path, payload, options = {})
      payload = payload.to_json unless payload.is_a?(String)
      response = request(:post, url(path), payload, headers)
      process_response(response, options)
    end

    def delete(path, options = {})
      response = request(:delete, url(path))
      process_response(response, options)
    end

    private

    def process_response(response, parse_response: true)
      return response unless parse_response
      parse_response(response)
    end

    def request(method, *args)
      RestClient.send(method, *args)
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
    rescue JSON::ParserError => e
      raise ResponseError.new(e.message, response)
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

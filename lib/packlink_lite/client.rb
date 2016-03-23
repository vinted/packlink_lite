require 'rest-client'

module PacklinkLite
  class Client
    def get(path, params = nil)
      url = url(path)
      url+= '?' + build_nested_query(params) if params
      response = RestClient.get(url, headers)
      handle_response(response)
    end

    def post(path, payload)
      payload = payload.to_json unless payload.is_a?(String)
      response = RestClient.post(url(path), payload, headers)
      handle_response(response)
    end

    def delete(path)
      response = RestClient.delete(url(path))
      handle_response(response)
    end

    private

    def url(path)
      PacklinkLite.url + path
    end

    def handle_response(response)
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

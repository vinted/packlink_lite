module PacklinkLite
  class Error < StandardError
    attr_reader :http_body, :http_code

    def initialize(message, http_body = nil, http_code = nil)
      @message = message
      @http_body = http_body
      @http_code = http_code
    end

    def inspect
      "#{message}: #{http_body}"
    end

    def message
      @message || self.class.to_s
    end

    def to_s
      inspect
    end
  end
end

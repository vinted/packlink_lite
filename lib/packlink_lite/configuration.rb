module PacklinkLite
  class Configuration
    attr_accessor :api_key, :testing, :timeout
    alias_method :testing?, :testing

    def timeout
      @timeout || 30
    end
  end
end

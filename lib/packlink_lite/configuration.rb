module PacklinkLite
  class Configuration
    attr_accessor :api_key, :testing, :timeout
    alias_method :testing?, :testing

    def timeout
      @timeout || 60
    end
  end
end

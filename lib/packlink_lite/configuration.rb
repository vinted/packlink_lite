module PacklinkLite
  class Configuration
    attr_accessor :api_key, :testing
    alias_method :testing?, :testing
  end
end

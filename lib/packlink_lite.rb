require "packlink_lite/version"
require "packlink_lite/configuration"
require "packlink_lite/client"
require "packlink_lite/service"
require "packlink_lite/order"

module PacklinkLite
  PRODUCTION_URL = 'https://api.packlink.com/v1/'
  SANDBOX_URL = 'https://apisandbox.packlink.com/v1/'

  module_function

  def configure
    yield(config)
  end

  def config
    @configuration ||= Configuration.new
  end

  def client
    @client ||= Client.new
  end

  def url
    config.testing? ? SANDBOX_URL : PRODUCTION_URL
  end
end

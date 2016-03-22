$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'packlink_lite'
require 'dotenv'
require 'webmock/rspec'

Dotenv.load
WebMock.disable_net_connect!

RSpec.configure do |config|
  config.before do
    PacklinkLite.configure do |config|
      config.api_key = ENV['PACKLINK_API_KEY']
      config.testing = true
    end
  end
end

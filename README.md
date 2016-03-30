# PacklinkLite

[![Build Status](https://travis-ci.org/laurynas/packlink_lite.svg?branch=master)](https://travis-ci.org/laurynas/packlink_lite)

Packlink.com API client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'packlink_lite'
```

## Configuration

```ruby
PacklinkLite.configure do |config|
  config.api_key = ENV['PACKLINK_API_KEY']
  config.testing = true
end
```

## Usage

### Fetch services list

```ruby
services = PacklinkLite::Service.all(
  from: { country: 'DE', zip: 56457 },
  to: { country: 'DE', zip: 56457 },
  packages: { 0 => { width: 10, height: 10, length: 10, weight: 1 } }
)
```

### Create order

```ruby
order = PacklinkLite::Order.create(order_hash)
```

### Fetch shipment tracking

```ruby
tracking_history = PacklinkLite::TrackingHistory.find(shipment_reference)
```

### Set callback urls

```ruby
PacklinkLite.change_shipment_callback_url(url)
PacklinkLite.change_tracking_callback_url(url)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/laurynas/packlink_lite.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


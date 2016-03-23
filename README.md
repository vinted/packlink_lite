# PacklinkLite

[![Build Status](https://travis-ci.org/laurynas/packlink_lite.svg?branch=master)](https://travis-ci.org/laurynas/packlink_lite)

Packlink.com API client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'packlink_lite'
```

## Usage

### Fetch services list

```ruby
services = PacklinkLite::Services.all(
  from: { country: 'FR', zip: 75001 },
  to: { country: 'FR', zip: 02140 },
  package: { width: 10.1, height: 10, length: 10, weight: 1 }
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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/laurynas/packlink_lite.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


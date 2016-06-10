module PacklinkLite
  class Order
    PATH = 'orders'

    def self.create(payload, options = {})
      PacklinkLite.client.post(PATH, payload, options)
    end
  end
end

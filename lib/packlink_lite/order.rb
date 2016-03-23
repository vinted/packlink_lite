module PacklinkLite
  class Order
    PATH = 'orders'

    def self.create(payload)
      PacklinkLite.client.post(PATH, payload)
    end
  end
end

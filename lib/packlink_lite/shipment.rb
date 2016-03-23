module PacklinkLite
  class Shipment
    PATH = 'shipments'

    def self.all(params = {})
      PacklinkLite.client.get(PATH, params)
    end

    def self.find(reference)
      PacklinkLite.client.get(PATH + '/' + reference)
    end
  end
end

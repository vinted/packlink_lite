module PacklinkLite
  class Shipment
    PATH = 'shipments'

    def self.all(params = {}, options = {})
      PacklinkLite.client.get(PATH, params, options)
    end

    def self.find(reference, options = {})
      PacklinkLite.client.get(PATH + '/' + reference, {}, options)
    end
  end
end

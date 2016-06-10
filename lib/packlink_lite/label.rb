module PacklinkLite
  class Label
    def self.all(shipment_reference, options = {})
      PacklinkLite.client.get("shipments/#{shipment_reference}/labels", {}, options)
    end
  end
end

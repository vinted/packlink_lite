module PacklinkLite
  class Label
    def self.all(shipment_reference)
      PacklinkLite.client.get("shipments/#{shipment_reference}/labels")
    end
  end
end

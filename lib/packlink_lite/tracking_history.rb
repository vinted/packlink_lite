module PacklinkLite
  class TrackingHistory
    def self.find(shipment_reference, options = {})
      PacklinkLite.client.get("shipments/#{shipment_reference}/track", {}, options)
    end
  end
end

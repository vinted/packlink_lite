module PacklinkLite
  class TrackingHistory
    def self.find(shipment_reference)
      PacklinkLite.client.get("shipments/#{shipment_reference}/track")
    end
  end
end

describe PacklinkLite::TrackingHistory do
  describe '.find' do
    subject { described_class.find(shipment_reference) }

    let(:shipment_reference) { 'ES00019388AB' }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')

      stub_api_request(
        :get,
        "https://apisandbox.packlink.com/v1/shipments/#{shipment_reference}/track",
        'spec/fixtures/tracking_history_response.json'
      )
    end

    it 'fetches tracking history' do
      expect(subject).to be_instance_of(Hash)
      expect(subject['history']).to be_instance_of(Array)
    end
  end
end

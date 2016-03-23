describe PacklinkLite::TrackingHistory do
  describe '.find' do
    subject { described_class.find(shipment_reference) }

    let(:shipment_reference) { 'ES00019388AB' }
    let(:response_json) { File.read('spec/fixtures/tracking_history_response.json') }

    before do
      stub_request(:get, "https://apisandbox.packlink.com/v1/shipments/#{shipment_reference}/track")
        .to_return(status: 200, body: response_json)
    end

    it 'fetches tracking history' do
      expect(subject).to be_instance_of(Hash)
      expect(subject['history']).to be_instance_of(Array)
    end
  end
end

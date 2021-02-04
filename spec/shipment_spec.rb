describe PacklinkLite::Shipment do
  describe '.all' do
    subject { described_class.all }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')

      stub_api_request(
        :get,
        'https://apisandbox.packlink.com/v1/shipments',
        'spec/fixtures/shipments_response.json'
      )
    end

    it 'fetches shipments' do
      expect(subject['shipments']).to be_instance_of(Array)
      expect(subject['pagination']).to be_instance_of(Hash)
    end
  end

  describe '.find' do
    subject { described_class.find(reference) }

    let(:reference) { 'DE2015API0000003515' }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')

      stub_api_request(
        :get,
        "https://apisandbox.packlink.com/v1/shipments/#{reference}",
        'spec/fixtures/shipment_response.json'
      )
    end

    it 'fetches shipment' do
      expect(subject).to be_instance_of(Hash)
      expect(subject['reference']).to eq reference
    end
  end
end

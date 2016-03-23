describe PacklinkLite::Shipment do
  describe '.all' do
    subject { described_class.all }

    let(:response_json) { File.read('spec/fixtures/shipments_response.json') }

    before do
      stub_request(:get, "https://apisandbox.packlink.com/v1/shipments")
        .to_return(status: 200, body: response_json)
    end

    it 'fetches shipments' do
      expect(subject['shipments']).to be_instance_of(Array)
      expect(subject['pagination']).to be_instance_of(Hash)
    end
  end

  describe '.find' do
    subject { described_class.find(reference) }

    let(:reference) { 'DE2015API0000003515' }
    let(:response_json) { File.read('spec/fixtures/shipment_response.json') }

    before do
      stub_request(:get, "https://apisandbox.packlink.com/v1/shipments/#{reference}")
        .to_return(status: 200, body: response_json)
    end

    it 'fetches shipment' do
      expect(subject).to be_instance_of(Hash)
      expect(subject['reference']).to eq reference
    end
  end
end

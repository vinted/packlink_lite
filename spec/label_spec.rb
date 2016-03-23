describe PacklinkLite::Label do
  describe '.all' do
    subject { described_class.all(shipment_reference) }

    let(:shipment_reference) { 'ES00019388AB' }
    let(:response_json) { File.read('spec/fixtures/labels_response.json') }

    before do
      stub_request(:get, "https://apisandbox.packlink.com/v1/shipments/#{shipment_reference}/labels")
        .to_return(status: 200, body: response_json)
    end

    it 'fetches labels' do
      expect(subject).to be_instance_of(Array)
      expect(subject.first).to eq 'http://packlink.de/de/purchase/PostVenta/getLabelsByRef?ref=52cfc1a8419a6982476224aec065618795673fe9'
    end
  end
end

describe PacklinkLite::Label do
  describe '.all' do
    subject { described_class.all(shipment_reference) }

    let(:shipment_reference) { 'ES00019388AB' }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')

      stub_api_request(
        :get,
        "https://apisandbox.packlink.com/v1/shipments/#{shipment_reference}/labels",
        'spec/fixtures/labels_response.json'
      )
    end

    it 'fetches labels' do
      expect(subject).to be_instance_of(Array)
      expect(subject.first).to eq 'http://packlink.de/de/purchase/PostVenta/getLabelsByRef?ref=52cfc1a8419a6982476224aec065618795673fe9'
    end
  end
end

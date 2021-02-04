describe PacklinkLite::Order do
  describe '.create' do
    subject { described_class.create(payload) }

    let(:payload) { JSON.parse(request_json) }
    let(:request_json) { File.read('spec/fixtures/order_create_request.json') }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')

      stub_api_request(
        :post,
        'https://apisandbox.packlink.com/v1/orders',
        'spec/fixtures/order_create_response.json'
      )
    end

    it 'creates order' do
      expect(subject).to be_instance_of(Hash)
      expect(subject['order_reference']).to eq 'DE00019732CF'
    end
  end
end

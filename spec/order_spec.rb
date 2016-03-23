describe PacklinkLite::Order do
  describe '.create' do
    subject { described_class.create(payload) }

    let(:payload) { JSON.parse(request_json) }
    let(:request_json) { File.read('spec/fixtures/order_create_request.json') }

    before do
      stub_request(:post, 'https://apisandbox.packlink.com/v1/orders')
        .with(body: payload)
        .to_return(status: 200, body: File.read('spec/fixtures/order_create_response.json'))
    end

    it 'creates order' do
      expect(subject).to be_instance_of(Hash)
      expect(subject['order_reference']).to eq 'DE00019732CF'
    end
  end
end

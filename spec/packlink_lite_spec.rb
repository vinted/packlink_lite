describe PacklinkLite do
  it 'configures' do
    described_class.configure do |config|
      config.api_key = 'test'
    end

    expect(described_class.config.api_key).to eq 'test'
  end

  describe '#url' do
    subject { described_class.url }

    it { is_expected.to eq 'https://apisandbox.packlink.com/v1/' }

    context 'in production mode' do
      before { described_class.config.testing = false }
      it { is_expected.to eq 'https://api.packlink.com/v1/' }
    end
  end

  describe '.change_shipment_callback_url' do
    subject { described_class.change_shipment_callback_url(url) }

    let(:url) { 'test' }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')
    end

    it 'sets url' do
      stub_request(:post, 'https://apisandbox.packlink.com/v1/shipments/callback')
        .with(body: { url: url }.to_json)

      subject
    end
  end

  describe '.change_tracking_callback_url' do
    subject { described_class.change_tracking_callback_url(url) }

    let(:url) { 'test' }

    before do
      allow(PacklinkLite.config).to receive(:api_key).and_return('dummy-api-key')
    end

    it 'sets url' do
      stub_request(:post, 'https://apisandbox.packlink.com/v1/shipments/tracking_callback')
        .with(body: { url: url }.to_json)

      subject
    end
  end
end

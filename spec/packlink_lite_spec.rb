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
end

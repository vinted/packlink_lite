describe PacklinkLite::Client do
  context 'with authorization error' do
    before do
      stub_request(:get, 'https://apisandbox.packlink.com/v1/services')
        .to_return(status: 401, body: response_json)
    end

    let(:response_json) { File.read('spec/fixtures/unauthorized.json') }

    it 'raises error' do
      expect { subject.get('services') }.to raise_error(PacklinkLite::Error, /The server could not verify/)
    end
  end

  context 'with bad request error' do
    before do
      stub_request(:get, 'https://apisandbox.packlink.com/v1/services')
        .to_return(status: 401, body: response_json)
    end

    let(:response_json) { File.read('spec/fixtures/countries_error.json') }

    it 'raises error' do
      expect { subject.get('services') }.to raise_error(PacklinkLite::Error, /Country from and country to are required/)
    end
  end

  context 'with not found error' do
    before do
      stub_request(:get, 'https://apisandbox.packlink.com/v1/services').to_return(status: 404)
    end

    it 'raises error' do
      expect { subject.get('services') }.to raise_error(PacklinkLite::Error)
    end
  end
end

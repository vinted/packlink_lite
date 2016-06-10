describe PacklinkLite::Client do
  context 'when API key is not set' do
    before do
      PacklinkLite.config.api_key = nil
    end

    it 'raises error' do
      expect { subject.get('services') }.to raise_error(PacklinkLite::Error, /API key/)
    end
  end

  context 'when API key is not passed' do
    it 'uses api key from configuration' do
      stub_request(:get, 'https://apisandbox.packlink.com/v1/services')
        .with(headers: { 'Authorization' => PacklinkLite.config.api_key })
        .to_return(body: 'ok')

      subject.get('services')
    end
  end

  context 'when API key is passed' do
    it 'uses api key from configuration' do
      stub_request(:get, 'https://apisandbox.packlink.com/v1/services')
        .with(headers: { 'Authorization' => '123' })
        .to_return(body: 'ok')

      subject.get('services', {}, api_key: '123')
    end
  end

  context 'with authorization error' do
    before do
      stub_api_request(
        :get,
        'https://apisandbox.packlink.com/v1/services',
        'spec/fixtures/unauthorized.json',
        status: 401
      )
    end

    it 'raises error' do
      expect { subject.get('services') }.to raise_error(PacklinkLite::Error, /The server could not verify/)
    end
  end

  context 'with bad request error' do
    before do
      stub_api_request(
        :get,
        'https://apisandbox.packlink.com/v1/services',
        'spec/fixtures/countries_error.json',
        status: 401
      )
    end

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

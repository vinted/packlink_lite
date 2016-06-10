describe PacklinkLite::Service do
  describe '.all' do
    subject { described_class.all(params) }

    let(:params) do
      {
        from: { country: 'DE', zip: 56457 },
        to: { country: 'DE', zip: 56457 },
        packages: { 0 => { width: 10, height: 10, length: 10, weight: 1 } }
      }
    end

    before do
      stub_api_request(
        :get,
        'https://apisandbox.packlink.com/v1/services?from%5Bcountry%5D=DE&from%5Bzip%5D=56457&packages%5B%5D%5Bheight%5D=10&packages%5B%5D%5Blength%5D=10&packages%5B%5D%5Bweight%5D=1&packages%5B%5D%5Bwidth%5D=10&to%5Bcountry%5D=DE&to%5Bzip%5D=56457',
        'spec/fixtures/services_response.json'
      )
    end

    it 'fetches services' do
      expect(subject).to be_instance_of(Array)
      expect(subject[0]['carrier_name']).to eq 'Mondial Relay'
    end
  end
end

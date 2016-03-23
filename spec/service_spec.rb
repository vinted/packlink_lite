describe PacklinkLite::Service do
  describe '.all' do
    subject { described_class.all(params) }

    let(:params) do
      {
        from: { country: 'FR', zip: 75001 },
        to: { country: 'FR', zip: 02140 },
        package: { width: 10.1, height: 10, length: 10, weight: 1 }
      }
    end

    before do
      stub_request(:get, "https://apisandbox.packlink.com/v1/services?from%5Bcountry%5D=FR&from%5Bzip%5D=75001&package%5Bheight%5D=10&package%5Blength%5D=10&package%5Bweight%5D=1&package%5Bwidth%5D=10.1&to%5Bcountry%5D=FR&to%5Bzip%5D=1120").
        to_return(status: 200, body: File.read('spec/responses/services.json'))
    end

    it 'fetches services' do
      expect(subject).to be_instance_of(Array)
      expect(subject[0]['carrier_name']).to eq 'Mondial Relay'
    end
  end
end

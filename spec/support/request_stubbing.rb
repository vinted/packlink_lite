module RequestStubbing
  def stub_api_request(method, url, response_file, status: 200, content_type: 'application/json')
    response_body = File.read(response_file)
    response_headers = { 'Content-Type' => content_type }

    stub_request(method, url)
      .to_return(body: response_body, headers: response_headers, status: status)
  end
end

RSpec.configure do |config|
  config.include RequestStubbing
end

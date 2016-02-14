module RSpec
  module JsonHelpers
    SUPPORTED_HEADERS = {
      json: {
        'Accept'       => 'application/json',
        'Content-Type' => 'application/json'
      },
      html: {
        'Accept'       => 'text/html',
        'Content-Type' => 'text/html'
      }
    }

    def include_headers(format) # e.g. :json
      SUPPORTED_HEADERS[format].each { |k, v| request.headers[k] = v }
    end

    def json
      JSON.parse(response.body)
    end
  end
end
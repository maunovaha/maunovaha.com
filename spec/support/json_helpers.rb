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

    # def be_success_case_json
    #   include(
    #     'status' => 0,
    #     'data'   => Hash
    #   )
    # end

    # def be_failure_case_json(status: :generic_error)
    #   json = {}
    #   json = json.merge({ 'errors' => Hash }) if status == :validation_errors

    #   code = case status
    #          when :validation_errors    then 1
    #          when :generic_error        then 2
    #          when :invalid_pin          then 3
    #          when :account_locked       then 4
    #          when :invalid_user_rights  then 5
    #          when :resource_not_found   then 6
    #          when :cannot_destroy_owner then 7
    #          when :sms_delivery_error   then 8
    #          when :unregisted_device    then 9
    #          when :disabled_device      then 10
    #          when :invalid_session      then 11
    #          else raise "Your status: #{status} not found from be_failure_case_json!"
    #          end

    #   include(json.merge({ 'status' => code }))
    # end
  end
end
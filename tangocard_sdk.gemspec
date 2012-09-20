Gem::Specification.new do |s|
  s.name        = 'tangocard_sdk'
  s.version     = '1.0.5'
  s.date        = %q{2012-09-20}
  s.summary     = "Tango Card Ruby SDK"
  s.description = "Incorporate the innovative Tango Card directly into your reward, loyalty, and engagement applications."
  s.authors     = ["Tango Card"]
  s.email       = 'sdk@tangocard.com'
  s.files = [
    "lib/tangocard-sdk.rb",
    "lib/tangocard_sdk.rb",
    "lib/config/tc_sdk_config.ini",
    "lib/ssl/cacert.pem",
    "lib/tangocard_sdk/tangocard_service_api.rb",
    "lib/tangocard_sdk/common/helper.rb",
    "lib/tangocard_sdk/common/sdk_config.rb",
    "lib/tangocard_sdk/common/tangocard_sdk_exception.rb",
    "lib/tangocard_sdk/request/base_request.rb",
    "lib/tangocard_sdk/request/get_available_balance_request.rb",
    "lib/tangocard_sdk/request/purchase_card_request.rb",
    "lib/tangocard_sdk/response/base_response.rb",
    "lib/tangocard_sdk/response/service_response_enum.rb",
    "lib/tangocard_sdk/response/failure/failure_response.rb",
    "lib/tangocard_sdk/response/failure/insufficient_funds_response.rb",
    "lib/tangocard_sdk/response/failure/insufficient_inventory_response.rb",
    "lib/tangocard_sdk/response/failure/invalid_credentials_response.rb",
    "lib/tangocard_sdk/response/failure/invalid_input_response.rb",
    "lib/tangocard_sdk/response/failure/system_error_response.rb",
    "lib/tangocard_sdk/response/success/get_available_balance_response.rb",
    "lib/tangocard_sdk/response/success/purchase_card_response.rb",
    "lib/tangocard_sdk/response/success/success_response.rb",
    "lib/tangocard_sdk/service/service_proxy.rb",
    "lib/tangocard_sdk/service/tangocard_service_api_enum.rb",
    "lib/tangocard_sdk/service/tangocard_service_exception.rb",
    "LICENSE.md",
    "README.md"
  ]
  s.require_paths = ["lib"]
  s.homepage    =
    'https://www.tangocard.com/extend'
end
#
# service_proxy.rb
#

# 
# Copyright (c) 2012 Tango Card, Inc
# All rights reserved.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions: 
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software. 
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# 
# Ruby Version 1.9
# 
# [category]    TangoCard
# [package]     SDK
# [version]     Id: service_proxy.rb 2012-09-19 15:00:00 PST 
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

require 'json'

module TangoCardSdk
    class ServiceProxy
        # 
        # Base URL
        # [constant] string
        #
        attr_accessor :base_url
        
        # 
        # Controller
        # [constant] string
        #
        attr_accessor :controller
        
        # 
        # Action
        # [constant] string
        #
        attr_accessor :action
        
        # 
        # Full request path
        # [constant] string
        #
        attr_accessor :path

        # 
        # Requesting object
        # [constant] BaseRequest
        #
        attr_accessor :request_object
        
        # 
        # Response object
        # [constant] JSON Object
        #
        attr_accessor :response_json
        
        # 
        # Response object
        # [constant] BaseResponse
        #
        attr_accessor :response_object

        # 
        # Constructor
        #
        # [param] TangoCardSdk::BaseRequest request_object reference
        # 
        # [access] public
        # 
        # [raise] ArgumentError
        #
        def initialize ( requestObject ) 

            if requestObject.nil?
                raise ArgumentError.new("Parameter 'requestObject' is not set.")
            end
            
            begin
                @request_object = requestObject
                @base_url = nil
                service = @request_object.enumTangoCardServiceApi
                
                case service
                    when TangoCardServiceApiEnum::INTEGRATION
                        @base_url = SdkConfig.instance.config_value("tc_sdk_environment_integration_url")
                    when TangoCardServiceApiEnum::PRODUCTION
                        @base_url = SdkConfig.instance.config_value("tc_sdk_environment_production_url")
                    else
                        raise TangoCardSdkException.new( "Unexpected Tango Card Service API request: %s" % [@request_object.enumTangoCardServiceApi.to_s] )
                end
                
                @controller = SdkConfig.instance.config_value("tc_sdk_controller")
                @action = request_object.request_action
                @path = "%s/%s/%s" % [@base_url, @controller, @action]
             
            rescue Exception => e
                raise Exception.new("Failed to initialize proxy: %s" % [e.message])
            end
        end
        
        # Executes request upon Tango Card service
        #
        # [return] BaseResponse   Return responseSuccess upon success, else nil.
        # 
        # [access] public
        #
        def execute_request()
            responseSuccess = nil
            begin
                responseJson = self.post_request()
                if not responseJson.nil?

                    self.throw_on_error(responseJson)

                    if @request_object.is_a? GetAvailableBalanceRequest                        
                        responseSuccess = GetAvailableBalanceResponse.new(responseJson)                
                    elsif @request_object.is_a? PurchaseCardRequest
                        responseSuccess = PurchaseCardResponse.new(responseJson)
                    else
                        raise TangoCardSdkException.new("Requester from TangoCard appears to be invalid: %s" % [@request_object.class.to_s] )
                    end
                else
                    raise TangoCardSdkException.new( "Failed to get response JSON Encoded object." )
                end
            rescue TangoCardServiceException => e
                raise e
            rescue TangoCardSdkException => e
                raise e
            rescue Exception => e
                raise TangoCardSdkException.new( "Failed to process request: %s: %s" % [e.class, e.message] )
            end
            
            return responseSuccess
        end

        protected

        # Map request by encoding JSON paramters.
        # 
        # [return] JSON Object   Return object upon success, else nil.
        # 
        # [access] protected
        #
        def map_request()
          
            requestJsonEncoded = nil
            
            begin
                requestJsonEncoded = @request_object.json_encoded_request
                if requestJsonEncoded.nil? 
                    raise TangoCardSdkException.new( "Failed to map request: %s" % [e.message] )
                end

            rescue TangoCardSdkException => e
                raise e
            rescue Exception => e
                raise TangoCardSdkException.new( "[%s::%s] Unexpected exception: %s" % [File.basename(__FILE__), __LINE__.to_s, e.message] )
            end
            
            return requestJsonEncoded
        end
        
        # POST request to Tango Card service
        #
        # [return] JSON Object upon success, else nil upon failure
        # 
        # [access] protected
        #    
        def post_request()
            if @path.nil?
                raise TangoCardSdkException.new('path is not set.')
            end
            
            responseJsonEncoded = nil
            begin
                # root certificate authority (CA) certificate
                caCertPath = File.dirname(File.dirname(File.dirname(__FILE__))) + "/ssl/cacert.pem"
                if not File.exists?(caCertPath) then
                    raise TangoCardSdkException.new("The CAcerts file is required: '%s'" % [caCertPath] )
                end
                
                requestJsonEncoded = self.map_request()
                if not requestJsonEncoded.nil?
                
                    uri = URI.parse(@path)
                    
                    request = Net::HTTP::Post.new(uri.request_uri)
                    request.body = requestJsonEncoded                    
                    request["Content-Type"] = "application/x-www-form-urlencoded"

                    http = Net::HTTP.new(uri.host, uri.port)
                    http.use_ssl = true
                    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
                    http.ca_file = caCertPath
                    
                    responseHttp = http.request(request)
                    if responseHttp.nil? 
                        raise TangoCardSdkException.new( "Failed to get HTTP response." )
                    end
                    
                    responseJsonEncoded = responseHttp.body
                    if responseJsonEncoded.nil? 
                        raise TangoCardSdkException.new( "Failed to get JSON response body." )
                    end
                else
                    raise TangoCardSdkException.new( "Failed to get request JSON Encoded object." )
                end
            rescue TangoCardSdkException => e
                raise e
            rescue Exception => e
                raise TangoCardSdkException.new( "Failed to post request: %s" % [e.message] )
            end
            
            responseJson = nil
            begin
                # parse the JSON object returned from the service
                responseJson = JSON.parse(responseJsonEncoded)
            rescue Exception => e
                raise TangoCardSdkException.new( "Failed to parse response: %s" % [e.message] )
            end
            
            return responseJson
        end

        
        # Throw TangoCardServiceException if Tango Card service indicates failure.
        #
        # [param] JSON    responseJson from Tango Card service
        # 
        # [return] void
        # 
        # [access] protected
        #
        def throw_on_error(responseJson)

            if responseJson.nil?
                raise TangoCardSdkException.new('Supplied JSON does not appear to be valid.')
            end

            responseType = responseJson['responseType']

            case responseType
                when "SUCCESS"

                when "SYS_ERROR"
                        responseFailure = SystemErrorResponse.new(responseJson)
                        raise TangoCardServiceException.new( ServiceResponseEnum::SYS_ERROR, responseFailure )
                        
                when "INV_INPUT"
                        responseFailure = InvalidInputResponse.new(responseJson)
                        raise TangoCardServiceException.new( ServiceResponseEnum::INV_INPUT, responseFailure )

                when "INV_CREDENTIAL"
                        responseFailure = InvalidCredentialsResponse.new(responseJson)
                        raise TangoCardServiceException.new( ServiceResponseEnum::INV_CREDENTIAL, responseFailure )

                when "INS_INV"
                        responseFailure = InsufficientInventoryResponse.new(responseJson)
                        raise TangoCardServiceException.new( ServiceResponseEnum::INS_INV, responseFailure)

                when "INS_FUNDS"
                        responseFailure = InsufficientFundsResponse.new(responseJson)
                        raise TangoCardServiceException.new( ServiceResponseEnum::INS_FUNDS, responseFailure)

                else
                    raise TangoCardSdkException.new( "Unexpected response type: %s" % [responseType] )
            end 
        end
    end
end
__END__
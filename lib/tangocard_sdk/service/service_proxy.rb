#
# service_proxy.rb
#

#
# 
# � 2012 Tango Card, Inc
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
# @category    TangoCard
# @package     SDK
# @version     Id: service_proxy.rb 2012-09-18 00:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class ServiceProxy
        # 
        # Base URL
        # @var string
        #
        attr_accessor :base_url
        # 
        # Controller
        # @var string
        #
        attr_accessor :controller
        # 
        # Action
        # @var string
        #
        attr_accessor :action
        # 
        # Full request path
        # @var string
        #
        attr_accessor :path
        # 
        # Action request
        # @var JSON Object
        #
        attr_accessor :request_json
        # 
        # Requesting object
        # @var BaseRequest
        #
        attr_accessor :requestObject

        # Constructor
        #
        # @param \TangoCard\Sdk\Request\BaseRequest requestObject reference
        # 
        # @return bool   Return true upon success, else false.
        # 
        # @access public
        # 
        # @throws \InvalidArgumentException
        #
        def initialize ( requestObject ) 

            if ( requestObject.nil? )
                raise Exception.new("Parameter 'requestObject' is not set.")
            end
            
            begin
                @requestObject = requestObject
                
                appConfig = SdkConfig.new()
                
                @base_url = nil
                
                service = requestObject.GetTangoCardServiceApiEnum()
                
                case service
                when TangoCardServiceApiEnum::INTEGRATION
                    @base_url = appConfig.GetConfigValue("tc_sdk_environment_integration_url")
                when TangoCardServiceApiEnum::PRODUCTION
                    @base_url = appConfig.GetConfigValue("tc_sdk_environment_production_url")
                else
                    raise TangoCardSdkException.new( "Unexpected Tango Card Service API request: " + requestObject.GetTangoCardServiceApiEnum() )
                end
                
                @controller = appConfig.GetConfigValue("tc_sdk_controller")
                @action = requestObject.getRequestAction()
                @path = sprintf("%s/%s/%s", @base_url, @controller, @action) 
             
            rescue Exception => e
                raise Exception.new("Failed to initialize proxy: " + e.message())
            end
        end

        # Map request by encoding JSON paramters.
        # 
        # @return bool   Return true upon success, else false.
        # 
        # @access protected
        #
        def MapRequest()
            isSuccess = false
            begin
                requestJsonEncoded = nil
                if ( @requestObject.GetJsonEncodedRequest(requestJsonEncoded) && !requestJsonEncoded.nil? )
                    @request_json = requestJsonEncoded
                    isSuccess = true
                end

            rescue Exception => e
                raise TangoCardSdkException.new( "Failed to map request. " + e.message() )
            end
            return isSuccess
        end
        
        # POST request to Tango Card service
        #
        # @param JSON &responseJsonEncoded reference
        # 
        # @return bool   Return true upon success, else false.
        # 
        # @access public
        #    
        def PostRequest(responseJsonEncoded)
            if (@path.nil?)
                raise TangoCardSdkException.new('path is not set.')
            end
            
            isSuccess = false
            
            responseJsonEncoded = nil
            
            begin
                # root certificate authority (CA) certificate
                caCertPath = File.dirname(File.dirname(File.dirname(File.dirname(__FILE__)))) + "/ssl/cacert.pem"
                unless File.exists?(caCertPath) then
                    raise TangoCardSdkException.new('The CAcerts file is required: ' + caCertPath )
                end
                
                if ( self.MapRequest() )
                    uri = URI.parse(@path)
                    
                    request = Net::HTTP::Post.new(@path)
                    request.body = @request_json
                    
                    request["Content-Type"] = "application/x-www-form-urlencoded"

                    http = Net::HTTP.new(uri.host, uri.port)
                    http.use_ssl = true
                    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
                    http.ca_file = caCertPath
                    response = http.request(request)

                    # parse the JSON object returned from the service
                    responseJsonEncoded = JSON.parse(response.body)

                    isSuccess = true
                end     
            rescue Exception => e
                raise TangoCardSdkException.new( "Failed to post request. " + e.message() )
            end
            
            return isSuccess
        end
        
        # Executes request upon Tango Card service
        #
        # @param BaseResponse &responseSuccess reference
        # 
        # @return bool   Return true upon success, else false.
        # 
        # @access public
        #
        def ExecuteRequest(&responseSuccess)
            isSuccess = false
            responseJsonEncoded = nil
            begin
                if (self.PostRequest(responseJsonEncoded)) 
                    responseJson = JSON.parse(responseJsonEncoded)
                    
                    ServiceProxy::ThrowOnError(responseJson)
                    
                    if ( @requestObject.is_a? GetAvailableBalanceRequest)
                        responseSuccess = GetAvailableBalanceResponse.new(responseJson['response'])
                    elsif ( @requestObject.is_a? PurchaseCardRequest )
                        responseSuccess = PurchaseCardResponse.new(responseJson['response'])
                    else
                        raise TangoCardSdkException.new('requester from TangoCard appears to be invalid: ' + @requestObject.class )
                    end
                    
                    isSuccess = true
                end
            rescue Exception => e
                raise TangoCardSdkException.new( "Failed to process request. " + e.message() )
            end
            return isSuccess
        end
        
        # Throw TangoCardServiceException if Tango Card service indicates failure.
        #
        # @param JSON    responseJson from Tango Card service
        # 
        # @return void
        # 
        # @access protected
        #
        def ThrowOnError(responseJson)
            if (responseJson.nil?)
                raise TangoCardSdkException.new('Supplied JSON does not appear to be valid.')
            end
            
            case responseJson['responseType']
                when "SUCCESS"

                when "SYS_ERROR"
                        responseFailure = SystemErrorResponse.new(responseJson['response'])
                        raise TangoCardServiceException.new( ServiceResponseEnum::SYS_ERROR, responseFailure )
                        
                when "INV_INPUT"
                        responseFailure = InvalidInputResponse.new(responseJson['response'])
                        raise TangoCardServiceException.new( ServiceResponseEnum::INV_INPUT, responseFailure )

                when "INV_CREDENTIAL"
                        responseFailure = InvalidCredentialsResponse.new(responseJson['response'])
                        raise TangoCardServiceException.new( ServiceResponseEnum::INV_CREDENTIAL, responseFailure )

                when "INS_INV"
                        responseFailure = InsufficientInventoryResponse.new(responseJson['response'])
                        raise TangoCardServiceException.new( ServiceResponseEnum::INS_INV, responseFailure)

                when "INS_FUNDS"
                        responseFailure = InsufficientFundsResponse.new(responseJson['response'])
                        raise TangoCardServiceException.new( ServiceResponseEnum::INS_FUNDS, responseFailure)

                else
                    raise TangoCardSdkException.new('responseType from TangoCard appears to be invalid.')
            end 
        end
    end
end
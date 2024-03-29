#
# base_request.rb
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
# [version]     base_request.rb 2012-10-02 15:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class BaseRequest
        attr_accessor :username
        attr_accessor :password
        attr_accessor :enumTangoCardServiceApi

        # 
        # Get controller action for this request.
        # 
        # @return string
        #
        def request_action() 
        end

        # 
        # Get JSON mapped and encoded request body.
        # 
        # [param] object $requestJsonEncoded
        #
        def json_encoded_request() 
        end
    
        #
        # Construct a new abstract request object.
        # 
        # [param] TangoCardSdk::TangoCardServiceApiEnum  enumTangoCardServiceApi Selection of which Tango Card Service API environment
        # [param] string                                          username Tango Card Service access username
        # [param] string                                          password Tango Card Service access password
        # 
        # @raises ArgumentError One of the supplied arguments was 
        #        not in the expected state.
        #        
        # [access] public
        #
        def initialize ( 
                enumTangoCardServiceApi, 
                username, 
                password 
            )
            
            @enumTangoCardServiceApi = TangoCardServiceApiEnum::UNDEFINED
            
            # -----------------------------------------------------------------
            # validate inputs
            # -----------------------------------------------------------------
            # isProductionMode
            if ( !TangoCardServiceApiEnum::is_valid(enumTangoCardServiceApi) )
                raise TangoCardSdkException.new("Parameter 'enumTangoCardServiceApi' must be TangoCardServiceApiEnum.")
            end
            # username
            if username.nil? 
                raise ArgumentError.new("Parameter 'username' is not defined.")
            elsif not username.is_a?(String)
                raise ArgumentError.new("Parameter 'username' must be a string.")
            elsif username.empty?
                raise ArgumentError.new("Parameter 'username' must not be an empty string.")
            end 
            # password
            if password.nil? 
                raise ArgumentError.new("Parameter 'password' is not defined.")
            elsif not password.is_a?(String)
                raise ArgumentError.new("Parameter 'password' must be a string.")
            elsif password.empty?
                raise ArgumentError.new("Parameter 'password' must not be an empty string.")
            end
                   
            @enumTangoCardServiceApi = enumTangoCardServiceApi
            @username = username
            @password = password
        end
        
        # 
        # Execute request
        # 
        # @return BaseResponse Object upon success, else nill
        #
        def execute()
            responseSuccess = nil
            begin
                proxy = ServiceProxy.new(self)
                responseSuccess = proxy.execute_request()
            rescue Exception => e
                raise e
            end
            return responseSuccess
        end
    end
end
__END__
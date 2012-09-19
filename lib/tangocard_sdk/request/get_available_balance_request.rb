#
# get_available_balance_request.rb
#
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
# @version     Id: get_available_balance_request.rb 2012-09-17 09:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 
 
module TangoCardSdk
    class GetAvailableBalanceRequest < BaseRequest
        #
        # Set up a new GetAvailableBalance request.
        #
        # @param TangoCardServiceApiEnum   enumTangoCardServiceApi Selection of which Tango Card Service API environment
        # @param string username Tango Card Service access username
        # @param string password Tango Card Service access password
        #
        def initialize( 
                enumTangoCardServiceApi, 
                username, 
                password 
            ) 
            super enumTangoCardServiceApi, username, password 
        end
        
        #
        # @see BaseRequest::getRequestAction()
        #
        def request_action()
            super 
            return "GetAvailableBalance"
        end

        #
        # 
        # JSON representation of a GetAvailableBalance Request
        # 
        # @param string &requestJsonEncoded
        # 
        # @return True upon success, else False
        #
        # @see BaseRequest::getJsonEncodedRequest()
        #
        def json_encoded_request()
            super 
            requestJsonEncoded = nil
            
            
            
            begin
            
                request = {
                    'username'  => @username,
                    'password'  => @password
                }
                
                # encode the request as a JSON object
                requestJsonEncoded = JSON.generate(request)
                
            rescue Exception => e
                raise TangoCardSdkException.new("[%s::%s] Failed encoding request: %s" % [File.basename(__FILE__), __LINE__.to_s, e.message] )
            end
            
            return requestJsonEncoded
        end
    end
end
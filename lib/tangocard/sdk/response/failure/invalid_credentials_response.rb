#
# invalid_credentials_response.rb
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
# [version]     Id: invalid_credentials_response.rb 2012-09-19 15:00:00 PST 
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class InvalidCredentialsResponse < FailureResponse
        #
        # [property]
        #
        attr_accessor :message_credentials
        
        # 
        # Constructor
        #
        # Construct a new InvalidCredentials failure type.
        # [param] object responseJson The parsed (JSON) object returned from the 
        #       Tango Card services.
        #
        def initialize(responseJson)
            @message_credentials = responseJson['response']['message']
        end
        
        #
        # Get the detailed error message.
        # [return] string A message from the Tango Card services indicating 
        #        what it thinks the problem is.
        #
        def message()
            if ( @message_credentials == "TCP:PNPA:3" )
                return "Provided user credentials are not valid."
            end
            return @message_credentials
        end
    end
end
#
# insufficient_funds_response.rb
#

#
# 
# © 2012 Tango Card, Inc
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
# @version     Id: insufficient_funds_response.rb 2012-09-18 00:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class InsufficientFundsResponse < FailureResponse
        #
        # @ignore
        #
        attr_accessor :availableBalance

        #
        # @ignore
        #
        attr_accessor :orderCost

        #
        # Construct a new InsufficientFunds failure type.
        # @param object responseJson The parsed (JSON) object returned from the 
        #       Tango Card services.
        #
        def initialize(responseJson)
            @availableBalance = responseJson['response']['availableBalance']
            @orderCost        = responseJson['response']['orderCost']
        end

        #
        # Get error message for this failure response.
        # @return string
        #    
        def Message()
            return "Available Balance: %s, Order Cost: %s" % [@availableBalance, @orderCost]
        end
    end
end
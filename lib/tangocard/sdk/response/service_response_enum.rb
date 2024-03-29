#
# service_response_enum.rb
#

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
# [version]     service_response_enum.rb 2012-10-02 15:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class ServiceResponseEnum

        #  
        #  Undefined response
        # [constant] int
        # 
        UNDEFINED = 0

        #  
        #  Success.
        # [constant] int
        # 
        SUCCESS = 1

        #  
        #  Failure - Insufficient Funds.
        # [constant] int
        # 
        INS_FUNDS = 2
        
        #  
        #  Failure - Invalid Credentials 
        # [constant] int
        # 
        INV_CREDENTIAL = 3
        
        #  
        #  Failure - Invalid Input 
        # [constant] int
        # 
        INV_INPUT = 4
        
        #  
        #  Failure - Insufficient Inventory
        # [constant] int
        # 
        INS_INV = 5

        #  
        #  Failure - Service System Error
        # [constant] int
        # 
        SYS_ERROR = 6
        
        # 
        # Hash of Enum to String
        # 
        ENUM_TO_STRING  = {
                ServiceResponseEnum::UNDEFINED => "UNDEFINED",
                ServiceResponseEnum::SUCCESS => "SUCCESS",
                ServiceResponseEnum::INS_FUNDS => "INS_FUNDS",
                ServiceResponseEnum::INV_CREDENTIAL => "INV_CREDENTIAL",
                ServiceResponseEnum::INV_INPUT => "INV_INPUT",
                ServiceResponseEnum::INS_INV => "INS_INV",
                ServiceResponseEnum::SYS_ERROR => "SYS_ERROR"
            }
        
        # 
        # Hash of String to Enum
        # 
        STRING_TO_ENUM = {
                "UNDEFINED" => ServiceResponseEnum::UNDEFINED,
                "SUCCESS" => ServiceResponseEnum::SUCCESS,
                "INS_FUNDS" => ServiceResponseEnum::INS_FUNDS,
                "INV_CREDENTIAL" => ServiceResponseEnum::INV_CREDENTIAL,
                "INV_INPUT" => ServiceResponseEnum::INV_INPUT,
                "INS_INV" => ServiceResponseEnum::INS_INV,
                "SYS_ERROR" => ServiceResponseEnum::SYS_ERROR
            }

        # 
        # Determine if enum is a valid response type
        # [param] ServiceResponseEnum enumerations   enumServiceType
        #
        def self.is_valid(enumResponseType)
            return ServiceResponseEnum::ENUM_TO_STRING.has_key?( enumResponseType )
        end
        
        # 
        # 
        #
        def self.to_s(enumResponseType)

            if ( ServiceResponseEnum::ENUM_TO_STRING.has_key?( enumResponseType ) )
                return ServiceResponseEnum::ENUM_TO_STRING[enumResponseType]
            end
            
            raise TangoCardSdkException.new("Unexpected enumeration: " + enumResponseType)
        end
        
        # 
        # 
        #
        def self.to_enum(strResponseType)

            if ( ServiceResponseEnum::STRING_TO_ENUM.has_key?( strResponseType ) )
                return ServiceResponseEnum::STRING_TO_ENUM[strResponseType]
            end
            
            raise TangoCardSdkException.new("Unexpected enumeration: " + strResponseType)
        end
    end
end
__END__
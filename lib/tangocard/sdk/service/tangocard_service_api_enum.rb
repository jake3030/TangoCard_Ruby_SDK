#
# tangocard_service_api_enum.rb
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
# [version]     tangocard_service_api_enum.rb 2012-10-02 15:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
#
#

module TangoCardSdk
  class TangoCardServiceApiEnum

    #
    #  Undefined service
    # [constant] int
    #
    UNDEFINED = 0

    #
    #  Integration Tango Card Service API.
    # [constant] int
    #
    INTEGRATION = 1

    #
    #  Production Tango Card Service API.
    # [constant] int
    #
    PRODUCTION = 2

    #
    # TangoCardServiceApiEnum to String
    # [constant] array
    #
    API_ENVIRONMENTS = {
      UNDEFINED => "TEST",
      INTEGRATION => "INTEGRATION",
      PRODUCTION => "PRODUCTION"
    }

    #
    # String to TangoCardServiceApiEnum
    # [constant] array
    #
    STRING_TO_ENUM = {
      "TEST" => TangoCardServiceApiEnum::UNDEFINED,
      "INTEGRATION" => TangoCardServiceApiEnum::INTEGRATION,
      "PRODUCTION" => TangoCardServiceApiEnum::PRODUCTION
    }

    #
    # Determine if enum is a valid service api environment type
    # [param] TangoCardServiceApiEnum enumerations   enumServiceType
    #
    def self.is_valid(enumServiceType)
      return TangoCardServiceApiEnum::API_ENVIRONMENTS.has_key?( enumServiceType )
    end

    #
    # String value of response type.
    # [param] TangoCardServiceApiEnum enumServiceType
    # [return] string
    # [raise] TangoCardSdkException
    #
    def self.to_s(enumServiceType)
      if ( TangoCardServiceApiEnum::ENUM_TO_STRING.has_key?( enumServiceType ) )
        return TangoCardServiceApiEnum::ENUM_TO_STRING[enumServiceType]
      end

      raise TangoCardSdkException.new("Unexpected enumeration: " + enumServiceType.to_s())
    end

    #
    # Enum value of response type.
    # [param] string strServiceType
    # [raise] TangoCardSdkException
    #
    def self.to_enum(strServiceType)
      if ( TangoCardServiceApiEnum::STRING_TO_ENUM.has_key?( strServiceType ) )
        return TangoCardServiceApiEnum::STRING_TO_ENUM[strServiceType]
      end

      raise TangoCardSdkException.new("Unexpected enumeration: " + strServiceType)
    end
  end
end
__END__
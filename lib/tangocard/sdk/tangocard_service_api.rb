#
# tangocard_service_api.rb
#
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
# [category]    TangoCard
# [package]     SDK
# [version]     Id: tangocard_service_api.rb 2012-09-27 12:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
#
#

#
#
# Tango Card Service API access class
#
#
module TangoCardSdk
  class TangoCardServiceApi

    # Return current Ruby SDK version
    #
    # [return] string tc_sdk_version
    def self.version
      return TangoCardSdk::VERSION
    end

    #
    # Get the available Tango Card account balance for provided authentication (username and password)
    #
    # [param] TangoCardSdk::TangoCardServiceApiEnum enumTangoCardServiceApi
    # [param] string username The username to access User's registered Tango Card account
    # [param] string password The password to access User's registered Tango Card account
    #
    # [return] TangoCardSdk::GetAvailableBalanceResponse responseGetAvailableBalance
    #
    # [raise] TangoCardServiceException
    # [raise] TangoCardSdkException
    # [raise] ArgumentError
    #
    def self.get_available_balance(
      enumTangoCardServiceApi,
      username,
      password
      )

      if Helper.is_null_or_empty(username)
        raise ArgumentError.new("Parameter 'username' is not defined.")
      end
      if Helper.is_null_or_empty(password)
        raise ArgumentError.new("Parameter 'password' is not defined.")
      end

      responseGetAvailableBalance = nil
      begin
        # set up the request
        requestGetAvailableBalance = GetAvailableBalanceRequest.new(
        enumTangoCardServiceApi,
        username.strip,
        password
        )

        if requestGetAvailableBalance.nil?
          raise TangoCardSdkException.new( "Failure to define request" )
        end

        # make the request
        responseGetAvailableBalance = requestGetAvailableBalance.execute()

      rescue TangoCardServiceException => e
        raise e
      rescue TangoCardSdkException => e
        raise e
      rescue ArgumentError => e
        raise e
      rescue Exception => e
        raise TangoCardSdkException.new("Unexpected: %s: %s" % [e.class, e.message])
      end

      return responseGetAvailableBalance
    end

    #
    # Based upon available funds within authenticated user's Tango Card account,
    # purchase a gift card for a specific recipient. How it is delivered is determined
    # by how parameter 'tcSend' is set; if 'true', then the Tango Card Service will email
    # a digital gift card to recipient's provided email address 'recipientEmail'; else
    # user of this SDK is responsible.
    #
    # Upon successful purchase, Tango Card Service will respond with confirmation information.
    #
    # [param] TangoCardSdk::TangoCardServiceApiEnum enumTangoCardServiceApi
    # [param] string username The username to access User's registered Tango Card account
    # [param] string password The password to access User's registered Tango Card account
    # [param] string cardSku The SKU of the card to purchase.
    # [param] int    cardValue The value of the card to buy in cents (example 500 = $5.00).
    # [param] bool   tcSend Determines if Tango Card Service will send an email with gift card information to recipient. Email gift card and return the card's details (true), or just return the card's details (false).
    # [param] string recipientName The name of the recipient. Only necessary if tcSend = true. If tcSend = false, then this input will be ignored.
    # [param] string recipientEmail The email address of the recipient. Only necessary if tcSend = true. If tcSend = false, then this input will be ignored.
    # [param] string giftMessage The gift message to send to the recipient. Only necessary if tcSend = true. If tcSend = false, this input will be ignored.
    # [param] string giftFrom The name of the person giving the gift. Optional if tcSend = true. If tcSend = false, then this input will be ignored.
    # [param] string companyIdentifier The Company identifier for which Email Template to use when sending Gift Card. Optional if tcSend = true. If tcSend = false, then this input will be ignored.
    #
    # [return] TangoCardSdk::PurchaseCardResponse Returns responsePurchaseCard upon success, else nil.
    #
    # [raise] TangoCardServiceException
    # [raise] TangoCardSdkException
    # [raise] ArgumentError
    #
    def self.purchase_card(
      enumTangoCardServiceApi,
      username,
      password,
      cardSku,
      cardValue,
      tcSend,
      recipientName,
      recipientEmail,
      giftMessage,
      giftFrom,
      companyIdentifier
      )
      responsePurchaseCard = nil

      if Helper.is_null_or_empty(username)
        raise ArgumentError.new("Parameter 'username' is not defined.")
      end
      if Helper.is_null_or_empty(password)
        raise ArgumentError.new("Parameter 'password' is not defined.")
      end
      if Helper.is_null_or_empty(cardSku)
        raise ArgumentError.new("Parameter 'cardSku' is not defined.")
      end
      if cardValue.nil?
        raise ArgumentError.new("Parameter 'cardValue' is not defined.")
      end
      if not cardValue.is_a?(Integer)
        raise ArgumentError.new("Parameter 'cardValue' is not an integer.")
      end
      if tcSend.nil?
        raise ArgumentError.new("Parameter 'tcSend' is not defined.")
      end
      if not tcSend.is_a?(Boolean)
        raise ArgumentError.new("Parameter 'tcSend' is not a boolean.")
      end

      begin
        # set up the request
        requestPurchaseCard = PurchaseCardRequest.new(
        enumTangoCardServiceApi,
        username.strip,
        password,
        cardSku.strip,
        cardValue,
        tcSend,
        Helper.is_null_or_empty(recipientName)      ? nil : recipientName.strip,
        Helper.is_null_or_empty(recipientEmail)     ? nil : recipientEmail.strip,
        Helper.is_null_or_empty(giftMessage)        ? nil : Helper.nl_to_br(giftMessage.strip),
        Helper.is_null_or_empty(giftFrom)           ? nil : giftFrom.strip,
        Helper.is_null_or_empty(companyIdentifier)  ? nil : companyIdentifier.strip
        )

        if requestPurchaseCard.nil?
          raise TangoCardSdkException.new( "Failure to define request" )
        end

        responsePurchaseCard = requestPurchaseCard.execute()
      rescue TangoCardServiceException => e
        raise e
      rescue TangoCardSdkException => e
        raise e
      rescue ArgumentError => e
        raise e
      rescue Exception => e
        raise TangoCardSdkException.new("Unexpected: %s: %s" % [e.class, e.message])
      end

      return responsePurchaseCard
    end
  end
end
__END__
#
# TangoCardServiceApi.rb
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
# @category    TangoCard
# @package     SDK
# @version     Id: TangoCardServiceApi.php 2012-09-18 18:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http:#www.tangocard.com)
# 
# 

#
# 
# Tango Card Service API access class
#
#
module TangoCardSdk
  class TangoCardServiceApi
  
      #
      # 
      # Enter description here ...
      # @param TangoCard_Sdk_Service_TangoCardServiceApiEnum enumTangoCardServiceApi
      # @param string username
      # @param string password
      # @param TangoCard_Sdk_Response_Success_GetAvailableBalanceResponse responseGetAvailableBalance
      # 
      # @return boolean Returns true upon success, else false.
      # 
      # @throws TangoCardServiceException
      # @throws TangoCardSdkException
      # @throws InvalidArgumentException
      # 
      #
      def self.GetAvailableBalance(
          enumTangoCardServiceApi,
          username,
          password,
          responseGetAvailableBalance
      )
        begin
          # set up the request
          requestGetAvailableBalance = GetAvailableBalanceRequest.new(
              enumTangoCardServiceApi,
              username, 
              password
              )
              
          # make the request
          return requestGetAvailableBalance.execute(responseGetAvailableBalance)
        rescue Exception => e
          raise Exception.new("Unexpected: " + e.message())
        end
      end
      
      #
      # 
      # Enter description here ...
      # @param TangoCard_Sdk_Service_TangoCardServiceApiEnum enumTangoCardServiceApi
      # @param string username
      # @param string password
      # @param string cardSku
      # @param string cardValue
      # @param boolean tcSend
      # @param string recipientName
      # @param string recipientEmail
      # @param string giftMessage
      # @param string giftFrom
      # @param string companyIdentifier
      # @param TangoCard_Sdk_Response_Success_PurchaseCardResponse responsePurchaseCard
      # 
      # @return boolean Returns true upon success, else false.
      # 
      # @throws TangoCardServiceException
      # @throws TangoCardSdkException
      # @throws InvalidArgumentException
      #
      def self.PurchaseCard(
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
          companyIdentifier,
          responsePurchaseCard
      )
          # set up the request
          requestPurchaseCard = PurchaseCardRequest.new(
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
          
          # make the request
          return requestPurchaseCard.execute(responsePurchaseCard)
      end
  end
end
#
# tangocard_failures_example.rb, Example code using Tango Card SDK forcing 
# failures and then collecting responses.
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
# @package     Examples
# @version     Id: tangocard_failures_example.rb 2012-09-18 18:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
#  

$:.unshift File.dirname(__FILE__)

require 'singleton'
require 'inifile'
require '../lib/tangocard_sdk.rb'

module TangoCardSdkExamples
    class TangoCard_Failures_Example
        
        def self.run(config_vars)
            p "=============================="
            p "= Tango Card PHP SDK Example ="
            p "=   with Failures            ="
            p "=============================="
            
            
            self.example_getavailablebalance_invalidcredentials(config_vars)
            
            self.example_purchasecard_insufficientfunds(config_vars)
            
            
            p "=============================="
            p "=   The End                  ="
            p "=============================="
        end
        
        #
        # 
        # Tests failure response condition for InvalidCredentials
        #
        def self.example_getavailablebalance_invalidcredentials(config_vars)

            app_tango_card_service_api = config_vars['app_tango_card_service_api']
            if app_tango_card_service_api.nil? || app_tango_card_service_api.empty?
                throw RuntimeError.new( "Unexpected config condition" )
            end
            
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum::to_enum(app_tango_card_service_api)
        
            app_username = "burt@example.com"
            app_password = "password"

            begin
                p "======== Get Available Balance with Invalid Credentials ========"
        
                responseGetAvailableBalanceUpdate = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                        enumTangoCardServiceApi,
                        app_username, 
                        app_password
                    ) 

                unless responseGetAvailableBalanceUpdate.nil?
                    p "=== Expected failure ==="
                end
            rescue TangoCardSdk::TangoCardServiceException => e
                p "=== Tango Card Service Failure ==="
                p "Failure response type: %s" % [e.responseType]
                p "Failure response:      %s" % [e.message]
            rescue TangoCardSdk::TangoCardSdkException => e
                p "=== Tango Card SDK Failure ==="
                p e.message
                p e.backtrace
            rescue Exception => e
                p "=== Unexpected Error ==="
                p e.class
                p e.message
                p e.backtrace
            end
        
            p "===== End Get Available Balance with Invalid Credentials ===="
        end
        
        #
        # 
        # Enter description here ...
        # @throws \RuntimeException
        #
        def self.example_purchasecard_insufficientfunds(config_vars)
            cardValueTangoCardCents = 100 # 1.00 dollars
            
            app_card_sku = config_vars['app_card_sku']
                        
            app_tango_card_service_api = config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
        
            username = "empty@tangocard.com"
            password = "password"
        
            begin
                p "======== Purchase Card with Insufficient Funds ========"

                responsePurchaseCard_NoDelivery = TangoCardSdk::TangoCardServiceApi.purchase_card(
                      enumTangoCardServiceApi,
                      username, 
                      password,
                      app_card_sku,                      # cardSku
                      cardValueTangoCardCents,           # cardValue
                      false,                             # tcSend 
                      nil,                               # recipientName
                      nil,                               # recipientEmail
                      nil,                               # giftMessage
                      nil,                               # giftFrom
                      "Tango Card Ruby SDK Example"      # companyIdentifier
                    )
                    
                unless responsePurchaseCard_NoDelivery.nil?
                    p "=== Expected failure ==="
                end
            rescue TangoCardSdk::TangoCardServiceException => e
                p "=== Tango Card Service Failure ==="
                p "Failure response type: %s" % [e.responseType]
                p "Failure response:      %s" % [e.message]
                
                if e.responseType == TangoCardSdk::ServiceResponseEnum.to_s(TangoCardSdk::ServiceResponseEnum::INS_FUNDS)
                    p "Available Balance: %s" % [TangocardExamples::currencify(e.response().availableBalance.to_f/100)]
                    p "Order Cost       : %s" % [TangocardExamples::currencify(e.response().orderCost.to_f/100)]
                end
            rescue TangoCardSdk::TangoCardSdkException => e
                p "=== Tango Card SDK Failure ==="
                p e.message
                p e.backtrace
            rescue Exception => e
                p "=== Unexpected Error ==="
                p e.class
                p e.message
                p e.backtrace
            end
        
            p "======== End Purchase Card with Insufficient Funds ========"
        end
    end
end
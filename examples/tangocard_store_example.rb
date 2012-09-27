#
# tangocard_store_example.rb, Example code using Tango Card SDK to get available 
# balance and purchase card.
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
# [package]     Examples
# [version]     Id: tangocard_store_example.rb 2012-09-18 18:00:00 PST 
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

#
# This is a full example of how to check the available balance for a user.
#

$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'tangocard_sdk'

require 'singleton'
require 'inifile'

module TangoCardSdkExamples
    class TangoCard_Store_Example

        def self.run(config_vars)

            puts "\n=============================="
            puts "= Tango Card Ruby SDK Example ="
            puts "=============================="
                
            begin  

                app_username            = config_vars['app_username']
                app_password            = config_vars['app_password']
                app_card_sku            = config_vars['app_card_sku']
                app_card_value          = config_vars['app_card_value']
                app_recipient_email     = config_vars['app_recipient_email']

                app_tango_card_service_api = config_vars['app_tango_card_service_api']      
                if app_tango_card_service_api.nil? || app_tango_card_service_api.empty?
                    throw RuntimeError.new( "Unexpected config condition" )
                end
                
                cardValueTangoCardCents = Integer(app_card_value)
                enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum::to_enum(app_tango_card_service_api)
                
                responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                    enumTangoCardServiceApi,
                    app_username, 
                    app_password
                    )
                 
                if not responseGetAvailableBalance.nil?
                    # we have a response from the server, lets see what we got (and do something with it)
                    if responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse
                        puts "\n\tSuccess - GetAvailableBalance - Initial"
                        tango_cents_available_balance = responseGetAvailableBalance.availableBalance
                        puts "\t'%s': Available balance: %s." % [app_username, TangocardExamples::currencify(tango_cents_available_balance.to_f/100)]
                    else
                        raise RuntimeError.new('Unexpected response.')
                    end
                else
                    raise RuntimeError.new('Unexpected response.')
                end
                
                giftMessage = "Example: Hello from Tango Card Ruby SDK:\nTango Card\nPhone: 1-877-55-TANGO\n\r601 Union Street, Suite 4200\r\nSeattle, WA\r98101"

                responsePurchaseCard_Delivery = TangoCardSdk::TangoCardServiceApi.purchase_card(
                        enumTangoCardServiceApi,
                        app_username, 
                        app_password,
                        app_card_sku,                                                                   # cardSku
                        cardValueTangoCardCents,                                                        # cardValue in cents (example 500 = $5.00
                        true,                                                                           # tcSend 
                        "Sally Customer",                                                               # recipientName
                        app_recipient_email,                                                            # recipientEmail
                        giftMessage,                                                                    # giftMessage
                        "Bill Support"                                                                  # giftFrom
                    )
   
                if not responsePurchaseCard_Delivery.nil?
                    # we have a response from the server, lets see what we got (and do something with it)
                    if responsePurchaseCard_Delivery.is_a? TangoCardSdk::PurchaseCardResponse
                        puts "\n\tSuccess - PurchaseCard Confirmation with Email Delivery"
                        puts "\tRecipient Email:   '%s'" % [app_recipient_email]
                        puts "\tGift Card SKU:     '%s'" % [app_card_sku]
                        puts "\tGift Card Value:    %s (cents)" % [cardValueTangoCardCents]
                        puts "\tReference Order ID: %s" % [responsePurchaseCard_Delivery.referenceOrderId.to_s]
                        puts "\tCard Token:         %s" % [responsePurchaseCard_Delivery.cardToken.to_s]
                        puts "\tCard Number:        %s" % [responsePurchaseCard_Delivery.cardNumber.to_s]
                        puts "\tCard Pin:           %s" % [responsePurchaseCard_Delivery.cardPin.to_s]
                    else
                        raise RuntimeError.new('Unexpected response.')
                    end
                else
                    raise RuntimeError.new('Unexpected response.')
                end

                responsePurchaseCard_NoDelivery = TangoCardSdk::TangoCardServiceApi.purchase_card(
                        enumTangoCardServiceApi,
                        app_username, 
                        app_password,
                        app_card_sku,                              # cardSku
                        cardValueTangoCardCents,                   # cardValue
                        false,                                     # tcSend 
                        nil,                                       # recipientName
                        nil,                                       # recipientEmail
                        nil,                                       # giftMessage
                        nil                                        # giftFrom 
                    )
                if not responsePurchaseCard_NoDelivery.nil?
                    # we have a response from the server, lets see what we got (and do something with it)
                    if responsePurchaseCard_NoDelivery.is_a? TangoCardSdk::PurchaseCardResponse
                        puts "\n\tSuccess - PurchaseCard Confirmation without Email Delivery"
                        puts "\tGift Card SKU:     '%s'" % [app_card_sku]
                        puts "\tGift Card Value:    %s (cents)" % [cardValueTangoCardCents]
                        puts "\tReference Order ID: %s" % [responsePurchaseCard_NoDelivery.referenceOrderId.to_s]
                        puts "\tCard Token:         %s" % [responsePurchaseCard_NoDelivery.cardToken.to_s]
                        puts "\tCard Number:        %s" % [responsePurchaseCard_NoDelivery.cardNumber.to_s]
                        puts "\tCard Pin:           %s" % [responsePurchaseCard_NoDelivery.cardPin.to_s]
                    else
                        raise RuntimeError.new('Unexpected response.')
                    end
                else
                    raise RuntimeError.new('Unexpected response.')
                end
                
                responseGetAvailableBalanceUpdate = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                        enumTangoCardServiceApi,
                        app_username, 
                        app_password
                    ) 
                if not responseGetAvailableBalanceUpdate.nil?
                    # we have a response from the server, lets see what we got (and do something with it)
                    if responseGetAvailableBalanceUpdate.is_a? TangoCardSdk::GetAvailableBalanceResponse
                        puts "\n\tSuccess - GetAvailableBalance - Concluding"
                        tango_cents_available_balance = responseGetAvailableBalanceUpdate.availableBalance
                        puts "\t'%s': Available balance: %s." % [app_username, TangocardExamples::currencify(tango_cents_available_balance.to_f/100)]
                    else
                        raise RuntimeError.new('Unexpected response.')
                    end 
                else
                    raise RuntimeError.new('Unexpected response.')
                end
            rescue TangoCardSdk::TangoCardServiceException => e
                puts "TangoCardServiceException: %s" % [e.message]
            rescue TangoCardSdk::TangoCardSdkException => e
                puts "TangoCardSdkException: %s" % [e.message]
            rescue ArgumentError => e
                puts "Invalid arguments: %s" % [e.message]
            rescue ScriptError => e
                puts "Unexpected Value: %s" % [e.message]
                p e.backtrace
            rescue RuntimeError => e
                puts "Runtime Exception: %s" % [e.message]
                p e.backtrace
            rescue Exception => e
                puts "Unexpected Exception: %s: %s" % [e.class, e.message]
                p e.backtrace
            end

            puts "\n=============================="
            puts "=   The End                  ="
            puts "=============================="
        
        end
        
    end
end
__END__
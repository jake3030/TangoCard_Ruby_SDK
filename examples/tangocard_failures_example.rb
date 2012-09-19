
#
# TangoCard_Failures_Example.rb, Example code using Tango Card SDK forcing 
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
# @version     Id: TangoCard_Failures_Example.php 2012-09-18 18:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http:#www.tangocard.com)
# 
#  

$:.unshift File.dirname(__FILE__)

require 'singleton'
require 'inifile'
require '../lib/tangocard_sdk.rb'

module TangoCardSdkExample
    class TangoCard_Failures_Example
        include Singleton
        
        attr_reader :config_vars
        
        def initialize()
          self.read_config()
        end
        
        def read_config()
          @config_vars = nil
          begin
            config_file = "../config/app_config.ini"
            puts "config_file: " + config_file
            unless File.file?(config_file)
              raise Exception.new( "Missing config file: " + config_file )
            end
            config_ini = IniFile.new(:filename => config_file, :comment => '#', :parameter => '=')
            @config_vars = config_ini['TANGOCARD']
          rescue Exception => e
            raise e
          end
        end
        
        def config_value(key)
          if !@config_vars.nil?
              return @config_vars[key]
          else
              raise Exception.new( "Undefined configuation variables." )
          end
        end
        
        def run()
          puts   "=============================="
          puts   "= Tango Card PHP SDK Example ="
          puts   "=   with Failures            ="
          puts   "=============================="
              
          self.Example_GetAvailableBalance_InvalidCredentials()
          self.Example_PurchaseCard_InsufficientFunds()
          
          puts  "=============================="
          puts  "=   The End                  ="
          puts  "=============================="
        end
        
        #
        # 
        # Tests failure response condition for InvalidCredentials
        #
        def Example_GetAvailableBalance_InvalidCredentials()
                    
            # app_username           = @config_vars['app_username']
            # app_password           = @config_vars['app_password']
            # app_card_sku           = @config_vars['app_card_sku']
                        
            app_tango_card_service_api = @config_vars['app_tango_card_service_api'].to_s
            puts "app_tango_card_service_api: " + app_tango_card_service_api
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum::to_enum(app_tango_card_service_api)
        
            username = "burt@example.com"
            password = "password"
        
            begin
            
                puts "======== Get Available Balance with Invalid Credentials ========"
        
                responseGetAvailableBalance = nil
                if ( TangoCardSdk::TangoCardServiceApi.GetAvailableBalance(
                            enumTangoCardServiceApi,
                            username, 
                            password,
                            responseGetAvailableBalance
                            )
                    )  
                    puts "=== Expected failure ==="
                end
            rescue TangoCardSdk::TangoCardServiceException => e
                puts "=== Tango Card Service Failure ==="
                puts "Failure response type: " + e.responseType()
                puts "Failure response:      " + e.response()
            rescue TangoCardSdk::TangoCardSdkException => e
                puts "=== Tango Card SDK Failure ==="
                puts e.message()
            rescue Exception => e
                puts "=== Unexpected Error ==="
                puts e.message()
            end
        
            puts "===== End Get Available Balance with Invalid Credentials ===="
        end
        
        #
        # 
        # Enter description here ...
        # @throws \RuntimeException
        #
        def Example_PurchaseCard_InsufficientFunds()
            cardValueTangoCardCents = 100 # 1.00 dollars
            
          # app_username           = @config_vars['app_username']
          # app_password           = @config_vars['app_password']
          app_card_sku           = @config_vars['app_card_sku']
                        
            app_tango_card_service_api = @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
        
            username = "empty@tangocard.com"
            password = "password"
        
            begin
                puts "======== Purchase Card with Insufficient Funds ========"

                responsePurchaseCard_NoDelivery = nil
                if ( TangoCardSdk::TangoCardServiceApi.PurchaseCard(
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
                        "Tango Card PHP SDK Example",      # companyIdentifier
                        responsePurchaseCard_NoDelivery    # response
                        )
                    )
                    puts "=== Expected failure ==="
                end
            rescue TangoCardSdk::TangoCardServiceException => e
                puts "=== Tango Card Service Failure ==="
                puts "Failure response type: " + e.responseType()
                puts "Failure response:      " + e.response()
                
                if ( e.responseType() == TangoCardSdk::ServiceResponseEnum.to_s(TangoCardSdk::ServiceResponseEnum::INS_FUNDS) ) 
                    puts "Available Balance: " + e.response().availableBalance()
                    puts "Order Cost       : " + e.response().orderCost()
                end
            rescue TangoCardSdk::TangoCardSdkException => e
                puts "=== Tango Card SDK Failure ==="
                puts e.message()
            rescue Exception => e
                puts "=== Unexpected Error ==="
                puts e.message()
            end
        
            puts "======== End Purchase Card with Insufficient Funds ========"
        end
    end
end

TangoCardSdkExample::TangoCard_Failures_Example.instance.run()


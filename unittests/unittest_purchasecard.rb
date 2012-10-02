#
# unittest_purchasecard.rb
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
# [version]     Id: unittest_purchasecard.rb 2012-09-19 15:00:00 PST 
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'tangocard_sdk'
require 'test/unit'

module TangoCardSdkUnitTest
    class UnitTest_PurchaseCard < Test::Unit::TestCase
      
        attr_reader :config_vars
        
        def setup
            @config_vars = nil
            begin
                config_file = File.dirname(File.dirname(__FILE__)) + "/config/app_config.ini"
                if not File.file?(config_file)
                    raise Exception.new( "TangocardExample: Missing config file: '%s'" % [config_file] )
                end
                config_ini = IniFile.new(:filename => config_file, :comment => '#', :parameter => '=')
                @config_vars = config_ini['TANGOCARD']
            rescue Exception => e
                raise Exception.new( "TangocardExample: %s" % [e.message] )
            end
        end
         
        def teardown
            ## Nothing really
        end

        #
        # 
        # Test access to application configuration file.
        #
        def test_AppConfig()
            assert_not_nil @config_vars
               
            app_tango_card_service_api =  @config_vars['app_tango_card_service_api']
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert( TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi) )   
            
            app_card_sku =  @config_vars['app_card_sku']        
            assert_equal("tango-card", app_card_sku)
            
            assert_not_nil  @config_vars['app_username']    # username
            assert_not_nil  @config_vars['app_password']    # password
        end    
        
        # 
        # Unit Test for puchasing the Tango Card and requesting
        # the Tango Card Service to send digital card to provided
        # email address.
        #
        def test_PurchaseCard_with_Delivery()
        
            app_username           =  @config_vars['app_username']
            app_password           =  @config_vars['app_password']
            app_card_sku           =  @config_vars['app_card_sku']
                    
            app_tango_card_service_api =  @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert( TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi) )   
                      
            cardValueTangoCardCents = 100 # 1.00 dollars
            tango_cents_available_balance = 0
            tango_cents_updated_balance = 0
        
            responseGetAvailableBalance = nil
            begin
                responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                        enumTangoCardServiceApi,
                        app_username, 
                        app_password
                    )
            rescue Exception => e
                flunk e.message
            end

            assert_not_nil responseGetAvailableBalance
            assert( responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse )
            
            tango_cents_available_balance = responseGetAvailableBalance.availableBalance
            assert  0 <= tango_cents_available_balance
            
            begin    
                responsePurchaseCard = TangoCardSdk::TangoCardServiceApi.purchase_card(
                        enumTangoCardServiceApi,
                        app_username, 
                        app_password,
                        app_card_sku,                           # cardSku
                        cardValueTangoCardCents,                # cardValue
                        true,                                   # tcSend 
                        "Sally Example",                        # recipientName
                        "sally@example.com",                    # recipientEmail
                        "Hello from Tango Card Ruby SDK:\nTango Card\nPhone: 1-877-55-TANGO\n601 Union Street, Suite 4200\nSeattle, WA 98101",                       # giftMessage
                        "Bill Example",                         # giftFrom
                        nil                                     # companyIdentifier (default is Tango Card email template)
                    )
            rescue Exception => e
                flunk e.message
            end

            assert_not_nil responsePurchaseCard
            assert( responsePurchaseCard.is_a? TangoCardSdk::PurchaseCardResponse )
          
            responseGetAvailableBalance = nil
            begin
              responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                    enumTangoCardServiceApi,
                    app_username, 
                    app_password
                )
            rescue Exception => e
                flunk e.message
            end
                
            assert_not_nil responseGetAvailableBalance
            assert( responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse )
            
            tango_cents_updated_balance = responseGetAvailableBalance.availableBalance
            assert 0 <= tango_cents_updated_balance
                        
            assert_not_equal( tango_cents_available_balance, tango_cents_updated_balance)
            tango_cents_expected_balance = tango_cents_available_balance - cardValueTangoCardCents
            assert_equal( tango_cents_expected_balance, tango_cents_updated_balance)
        end
        
        # 
        # Unit Test for puchasing the Tango Card and not requesting
        # the Tango Card Service to send digital card.
        #
        def test_PurchaseCard_noSend()
        
            app_username           =  @config_vars['app_username']
            app_password           =  @config_vars['app_password']
            app_card_sku           =  @config_vars['app_card_sku']
                    
            app_tango_card_service_api =  @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert( TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi) )   
            
            cardValueTangoCardCents = 100 # 1.00 dollars
            tango_cents_available_balance = 0
            tango_cents_updated_balance = 0
        
            responseGetAvailableBalance = nil
            begin
              responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                    enumTangoCardServiceApi,
                    app_username, 
                    app_password
                )
            rescue Exception => e
                flunk e.message
            end
               
            assert_not_nil responseGetAvailableBalance
            assert( responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse )
            
            tango_cents_available_balance = responseGetAvailableBalance.availableBalance
            assert 0 <= tango_cents_available_balance
            
            responsePurchaseCard = nil
            begin    
              responsePurchaseCard = TangoCardSdk::TangoCardServiceApi.purchase_card(
                    enumTangoCardServiceApi,
                    app_username, 
                    app_password,
                    app_card_sku,                           # cardSku
                    cardValueTangoCardCents,                # cardValue
                    false,                                  # tcSend 
                    nil,                                    # recipientName
                    nil,                                    # recipientEmail
                    nil,                                    # giftMessage
                    nil,                                    # giftFrom
                    nil                                     # companyIdentifier (default is Tango Card email template)
                )
            rescue Exception => e
                flunk e.message
            end
                
            assert_not_nil responsePurchaseCard
            assert( responsePurchaseCard.is_a? TangoCardSdk::PurchaseCardResponse )
            
            responseGetAvailableBalance = nil
            begin
              responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                                enumTangoCardServiceApi,
                                app_username, 
                                app_password
                                )
            rescue Exception => e
                flunk e.message
            end

            assert_not_nil responseGetAvailableBalance
            assert( responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse )

            tango_cents_updated_balance = responseGetAvailableBalance.availableBalance
            assert 0 <= tango_cents_updated_balance

            assert_not_equal( tango_cents_available_balance, tango_cents_updated_balance)
            tango_cents_expected_balance = tango_cents_available_balance - cardValueTangoCardCents
            assert_equal( tango_cents_expected_balance, tango_cents_updated_balance )
        end

        # 
        # Unit test to assure failure when trying to purchase a card
        # with invalid authentication credentials
        #
        def test_PurchaseCard_InvalidCredentials()
        
            username = "burt@example.com" 
            password = "password"
            
            app_card_sku           =  @config_vars['app_card_sku']
                    
            app_tango_card_service_api =  @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert( TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi) )   
                     
            cardValueTangoCardCents = 100 # 1.00 dollars

            responsePurchaseCard = nil
            begin    
                responsePurchaseCard = TangoCardSdk::TangoCardServiceApi.purchase_card(
                        enumTangoCardServiceApi,
                        username, 
                        password,
                        app_card_sku,                           # cardSku
                        cardValueTangoCardCents,                # cardValue
                        false,                                  # tcSend 
                        nil,                                    # recipientName
                        nil,                                    # recipientEmail
                        nil,                                    # giftMessage
                        nil,                                    # giftFrom
                        nil                                     # companyIdentifier (default is Tango Card email template)
                    )
                
                flunk "Failed to throw TangoCardServiceException"
        
            rescue TangoCardSdk::TangoCardServiceException => e
                assert "INV_CREDENTIAL" == e.responseType
                message = e.message
                assert_not_nil message
            rescue Exception => e
                flunk e.message
            end
            
            assert_nil responsePurchaseCard
        end
        
        # 
        # Unit test to assure failure when trying to purchase a card
        # from an account with insufficient funds.
        #
        def test_PurchaseCard_InsufficientFunds()
        
            username = "empty@tangocard.com"
            password = "password" 
        
            app_card_sku           =  @config_vars['app_card_sku'] 
                    
            app_tango_card_service_api =  @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert( TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi) )   
            
            cardValueTangoCardCents = 100 # 1.00 dollars

            begin    
                responsePurchaseCard = TangoCardSdk::TangoCardServiceApi.purchase_card(
                        enumTangoCardServiceApi,
                        username, 
                        password,
                        app_card_sku,                           # cardSku
                        cardValueTangoCardCents,                # cardValue
                        false,                                  # tcSend 
                        nil,                                    # recipientName
                        nil,                                    # recipientEmail
                        nil,                                    # giftMessage
                        nil,                                    # giftFrom
                        nil                                     # companyIdentifier (default is Tango Card email template)
                    )

                flunk "Failed to throw TangoCardServiceException"

            rescue TangoCardSdk::TangoCardServiceException => e
                assert "INS_FUNDS" == e.responseType
                message = e.message
                assert_not_nil message
            rescue Exception => e
                flunk e.message
            end
            
            assert_nil responsePurchaseCard
        end

        # 
        # Unit test to assure failure when purchasing a gift card
        # with an invalid card sku.
        #
        def test_PurchaseCard_InvalidInput_Sku()

            app_username           =  @config_vars['app_username']
            app_password           =  @config_vars['app_password']
                    
            app_tango_card_service_api =  @config_vars['app_tango_card_service_api']
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi)
             
            cardValueTangoCardCents = 100 # 1.00 dollars
            
            responsePurchaseCard = nil
            begin    
                responsePurchaseCard = TangoCardSdk::TangoCardServiceApi.purchase_card(
                    enumTangoCardServiceApi,
                        app_username, 
                        app_password,
                        "mango-card",                           # cardSku
                        cardValueTangoCardCents,                # cardValue
                        false,                                  # tcSend 
                        nil,                                    # recipientName
                        nil,                                    # recipientEmail
                        nil,                                    # giftMessage
                        nil,                                    # giftFrom
                        nil                                     # companyIdentifier (default is Tango Card email template)
                    )

                flunk "Failed to throw TangoCardServiceException"

            rescue TangoCardSdk::TangoCardServiceException => e
                assert "INV_INPUT" == e.responseType  
                message = e.message
                assert_not_nil message
            rescue Exception => e
                flunk e.message
            end

            assert_nil responsePurchaseCard
        end

    end
end
__END__
#
# unittest_getavailablebalance.rb
#

# 
# (c) 2012 Tango Card, Inc
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
# @version     Id: unittest_getavailablebalance.rb 2012-09-19 15:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'tangocard_sdk'
require 'test/unit'

module TangoCardSdkUnitTest
    class UnitTest_GetAvailableBalance < Test::Unit::TestCase

        attr_reader :config_vars
        
        def setup
            @config_vars = nil
            begin
                config_file = "../config/app_config.ini"
                unless File.file?(config_file)
                    raise Exception.new( "Missing config file: %s" % [config_file] )
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
            
            app_tango_card_service_api = @config_vars['app_tango_card_service_api'] 
            enumTangoCardServiceApi = nil 
            
            begin    
                enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            rescue Exception => e
                flunk e.message
            end
            
            assert( TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi) )
            app_card_sku = @config_vars['app_card_sku']
            assert_equal "tango-card", app_card_sku  
            
            assert_not_nil @config_vars['app_username']    # username
            assert_not_nil @config_vars['app_password']    # password
        end
        
        #
        # 
        # Test GetAvailableBalance using AppConfig settings
        #
        def test_GetAvailableBalance()
        
            app_username           = @config_vars['app_username']
            app_password           = @config_vars['app_password']
            
            app_tango_card_service_api = @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum.to_enum(app_tango_card_service_api)
            assert( TangoCardSdk::TangoCardServiceApiEnum::is_valid(enumTangoCardServiceApi) )
                
            responseGetAvailableBalance = nil
            begin    
                responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                    enumTangoCardServiceApi,
                    app_username, 
                    app_password
                  )
            rescue Exception => e
                flunk "%s: %s" % [e.class, e.message]
            end
        
            assert_not_nil responseGetAvailableBalance
            assert( responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse )
            
            tango_cents_available_balance = responseGetAvailableBalance.availableBalance
            assert  0 <= tango_cents_available_balance  
        end
        
        #
        # 
        # Enter description here ...
        #
        def test_GetAvailableBalance_InvalidCredentials()
        
            username = "burt@example.com"
            password = "password"     
                
            app_tango_card_service_api = @config_vars['app_tango_card_service_api']      
            enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum::to_enum(app_tango_card_service_api)
            assert TangoCardSdk::TangoCardServiceApiEnum.is_valid(enumTangoCardServiceApi)
                
            responseGetAvailableBalance = nil
            begin    
              responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                                enumTangoCardServiceApi,
                                username, 
                                password
                                )
                
                flunk "Failed to throw TangoCardServiceException"
            rescue TangoCardSdk::TangoCardServiceException => e
                assert( "INV_CREDENTIAL" == e.responseType )
            rescue Exception => e
                flunk "%s: %s" % [e.class, e.message]
            end
        
            assert_nil responseGetAvailableBalance
        end

    end
end







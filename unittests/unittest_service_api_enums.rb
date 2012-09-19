#
# unittest_sdk_config.rb
#

#
# 
# � 2012 Tango Card, Inc
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
# @version     $Id: unittest_sdk_config.rb 2012-09-19 15:00:00 PST $
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

$:.unshift File.dirname(__FILE__)

require 'test/unit'
require '../lib/tangocard_sdk.rb'

module TangoCardSdkUnitTest

    class TestTangoCardServiceApiEnum < Test::Unit::TestCase
        def test_SUCCESS
            act = TangoCardSdk::TangoCardServiceApiEnum.to_s( TangoCardSdk::TangoCardServiceApiEnum::INTEGRATION )
            assert_equal( "INTEGRATION", act )
            
            act = TangoCardSdk::TangoCardServiceApiEnum.to_enum( "INTEGRATION" )
            assert_equal( TangoCardSdk::TangoCardServiceApiEnum::INTEGRATION, act )
        end
        
        def test_SYS_ERROR
            act = TangoCardSdk::TangoCardServiceApiEnum.to_s( TangoCardSdk::TangoCardServiceApiEnum::PRODUCTION )
            assert_equal( "PRODUCTION", act )
            
            act = TangoCardSdk::TangoCardServiceApiEnum.to_enum( "PRODUCTION" )
            assert_equal( TangoCardSdk::TangoCardServiceApiEnum::PRODUCTION, act )
        end
        
        def test_GARBAGE
            assert_raise TangoCardSdk::TangoCardSdkException do
                act = TangoCardSdk::TangoCardServiceApiEnum.to_enum( "GARBAGE" )
            end
        end
    end
end
#
# unittest_service_response_enums.rb
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
# [version]     unittest_service_response_enums.rb 2012-20-19 15:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'tangocard_sdk'
require 'test/unit'

module TangoCardSdkUnitTest

    class UnitTest_ServiceResponseEnum < Test::Unit::TestCase
        def test_SUCCESS
            act = TangoCardSdk::ServiceResponseEnum.to_s( TangoCardSdk::ServiceResponseEnum::SUCCESS )
            assert_equal( "SUCCESS", act )
            
            act = TangoCardSdk::ServiceResponseEnum.to_enum( "SUCCESS" )
            assert_equal( TangoCardSdk::ServiceResponseEnum::SUCCESS, act )
        end
        
        def test_SYS_ERROR
            act = TangoCardSdk::ServiceResponseEnum.to_s( TangoCardSdk::ServiceResponseEnum::SYS_ERROR )
            assert_equal( "SYS_ERROR", act )
            
            act = TangoCardSdk::ServiceResponseEnum.to_enum( "SYS_ERROR" )
            assert_equal( TangoCardSdk::ServiceResponseEnum::SYS_ERROR, act )
        end
        
        def test_GARBAGE
            assert_raise TangoCardSdk::TangoCardSdkException do
                TangoCardSdk::ServiceResponseEnum.to_enum( "GARBAGE" )
            end
        end
    end
end
__END__
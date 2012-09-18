#
# unittest_sdk_config.rb
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
# @version     $Id: unittest_sdk_config.rb 2012-09-18 00:00:00 PST $
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

require 'test/unit'
require '../lib/tangocard_sdk.rb'

module TangoCardSdk
    class TestServiceResponseEnum < Test::Unit::TestCase
    
        def test_tc_integration_url
            s = SdkConfig.new()
            url = s.GetConfigValue("tc_sdk_environment_integration_url")
            assert_equal( url, "https://int.tangocard.com" )
        end
        
        def test_tc_production_url
            s = SdkConfig.new()
            url = s.GetConfigValue("tc_sdk_environment_production_url")
            assert_equal( url, "https://api.tangocard.com" )
        end
    end
end
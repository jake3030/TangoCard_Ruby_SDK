#
# tangocard_sdk.rb
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
# [version]     tangocard_sdk.rb 2012-09-20 15:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
#
#

# The SDK initialization enters here. Loads all needed libraries and files. Inspects
# the current runtime to see if Rails is present. If it is, we inject our helper into
# ActiveSupport.

require 'cgi'
require 'net/https'
require 'uri'
require 'rubygems'
require 'json'
require 'openssl'
require 'date'
require 'singleton'
# require 'inifile'

$:.unshift File.dirname(__FILE__)

require "tangocard/sdk/tangocard_service_api"
require "tangocard/sdk/common/helper"
require "tangocard/sdk/common/sdk_config"
require "tangocard/sdk/common/tangocard_sdk_exception"
require "tangocard/sdk/request/base_request"
require "tangocard/sdk/request/get_available_balance_request"
require "tangocard/sdk/request/purchase_card_request"
require "tangocard/sdk/response/base_response"
require "tangocard/sdk/response/service_response_enum"
require "tangocard/sdk/response/failure/failure_response"
require "tangocard/sdk/response/failure/insufficient_funds_response"
require "tangocard/sdk/response/failure/insufficient_inventory_response"
require "tangocard/sdk/response/failure/invalid_credentials_response"
require "tangocard/sdk/response/failure/invalid_input_response"
require "tangocard/sdk/response/failure/system_error_response"
require "tangocard/sdk/response/success/success_response"
require "tangocard/sdk/response/success/get_available_balance_response"
require "tangocard/sdk/response/success/purchase_card_response"
require "tangocard/sdk/service/service_proxy"
require "tangocard/sdk/service/tangocard_service_api_enum"
require "tangocard/sdk/service/tangocard_service_exception"

__END__

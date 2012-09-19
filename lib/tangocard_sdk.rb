#
# tangocard_sdk.rb
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
# @version     $Id: tangocard_sdk.rb 2012-09-18 00:00:00 PST $
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
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
require 'bigdecimal'
require 'date'
require 'singleton'
require 'inifile'

$:.unshift File.dirname(__FILE__)

require "tangocard_sdk/tangocard_service_api"
require "tangocard_sdk/common/helper"
require "tangocard_sdk/common/sdk_config"
require "tangocard_sdk/common/tangocard_sdk_exception"
require "tangocard_sdk/request/base_request"
require "tangocard_sdk/request/get_available_balance_request"
require "tangocard_sdk/request/purchase_card_request"
require "tangocard_sdk/response/base_response"
require "tangocard_sdk/response/service_response_enum"
require "tangocard_sdk/response/failure/failure_response"
require "tangocard_sdk/response/failure/insufficient_funds_response"
require "tangocard_sdk/response/failure/insufficient_inventory_response"
require "tangocard_sdk/response/failure/invalid_credentials_response"
require "tangocard_sdk/response/failure/invalid_input_response"
require "tangocard_sdk/response/failure/system_error_response"
require "tangocard_sdk/response/success/success_response"
require "tangocard_sdk/response/success/get_available_balance_response"
require "tangocard_sdk/response/success/purchase_card_response"
require "tangocard_sdk/service/service_proxy"
require "tangocard_sdk/service/tangocard_service_api_enum"
require "tangocard_sdk/service/tangocard_service_exception"


# Load our Rails plugin

if defined?(Rails)
  if defined?(Rails::Railtie)
    module AuthorizeNet
      class Railtie < Rails::Railtie
        initializer "tangocard_sdk.load_path_initialize" do |app|
          %w{ models controllers helpers }.each do |dir|
            path = File.join(File.dirname(__FILE__), 'app', dir)
            $LOAD_PATH << path
            ActiveSupport::Dependencies.autoload_paths << path
            ActiveSupport::Dependencies.autoload_once_paths.delete(path)
          end
        end
      end
    end
  else
    %w{ models controllers helpers }.each do |dir|
      path = File.join(File.dirname(__FILE__), 'app', dir)
      $LOAD_PATH << path
      ActiveSupport::Dependencies.load_paths << path
      ActiveSupport::Dependencies.load_once_paths.delete(path)
    end
  end
end

#
# sdk_config.rb
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
# [version]     sdk_config.rb 2012-10-02 15:00:00 PST
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
#
#
# encoding: UTF-8

require 'singleton'
# require 'inifile'

module TangoCardSdk
  class SdkConfig
    include Singleton

    attr_reader :config_vars
    attr_reader :config_status

    #
    # Constructor
    #
    def initialize()
      self.read_config()
    end

    #
    # Read SDK configuration file
    #

    def read_config
      @config_vars = nil
      begin
        config_file = File.read(File.dirname(File.dirname(__FILE__)) + "/../config/tc_sdk_config.json")
        if config_file.empty?
          raise TangoCardSdkException.new( "Missing config file. '%s'" % [config_file] )
        end
        config_ini = JSON.parse(config_file)
        @config_vars = config_ini
      rescue Exception => e
        raise e
      end
    end


    def old_read_config
      @config_vars = nil
      begin
        config_file = File.dirname(File.dirname(File.dirname(__FILE__))) + "/config/tc_sdk_config.ini"
        if not File.file?(config_file)
          raise TangoCardSdkException.new( "Missing config file. '%s'" % [config_file] )
        end
        config_ini = IniFile.new(:filename => config_file, :comment => '#', :parameter => '=')
        @config_vars = config_ini['TANGOCARD']
      rescue Exception => e
        raise e
      end
    end

    def config_value(key)
      if not @config_vars.nil?
        return @config_vars[key]
      else
        raise TangoCardSdkException.new( "Undefined configuation variables." )
      end
    end
  end
end
__END__
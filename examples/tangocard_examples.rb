#
# tangocard_examples.rb, Example code using Tango Card SDK
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
# [version]     Id: tangocard_examples.rb 2012-09-18 18:00:00 PST 
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
#  

$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'tangocard_sdk'

require 'singleton'
require 'inifile'

require 'tangocard_store_example.rb'
require 'tangocard_failures_example.rb'

module TangoCardSdkExamples
    class TangocardExamples
        include Singleton

        attr_reader :config_vars
        attr_reader :config_vars

        #
        # Constructior
        #
        def initialize()
            self.read_config()
        end

        #
        # Read provided example app_config.ini file for test configuration settings
        #
        def read_config()
            @config_vars = nil
            begin
                @config_file = File.dirname(File.dirname(__FILE__)) + "/config/app_config.ini"
                if not File.file?(@config_file)
                    raise Exception.new( "TangocardExample: Missing config file: '%s'" % [@config_file] )
                end
                config_ini = IniFile.new(:filename => @config_file, :comment => '#', :parameter => '=')
                @config_vars = config_ini['TANGOCARD']
            rescue Exception => e
                raise e
            end
        end

        #
        # Run examples
        #
        def run()
            if @config_vars.nil?
                raise Exception.new( "Undefined configuation variables." )
            end

            begin
                puts "=== Begin Examples ==="
                puts "\tTango Card Ruby SDK version: '%s'" % [TangoCardSdk::TangoCardServiceApi.version]
                puts "\tExample App Config File: '%s'" % [@config_file]
                TangoCard_Store_Example.run(@config_vars)
                TangoCard_Failures_Example.run(@config_vars)
              puts "=== End Examples ==="
            rescue Exception => e
                puts "=== Unexpected Error ==="
                puts e.message
                puts e.backtrace
            end
        end
        
        # takes a number and options hash and outputs a string in any currency format
        def self.currencify(number, options={})
            # :currency_before => false p the currency symbol after the number
            # default format: $12,345,678.90
            options = {:currency_symbol => "$", :delimiter => ",", :decimal_symbol => ".", :currency_before => true, :no_decimal => false}.merge(options)

            # split integer and fractional parts 
            int, frac = ("%.2f" % number).split('.')
            # insert the delimiters
            int.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{options[:delimiter]}")

            if options[:no_decimal]
                frac_part = ""
            else
                frac_part = options[:decimal_symbol] + frac
            end
            
            if options[:currency_before]
                options[:currency_symbol] + int + frac_part
            else
                int + frac_part + options[:currency_symbol]
            end
        end
    end
end

TangoCardSdkExamples::TangocardExamples.instance.run()
__END__
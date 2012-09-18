#
# sdk_config.rb
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
# @version     $Id: sdk_config.rb 2012-09-18 00:00:00 PST $
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class SdkConfig
        attr_accessor :config_vars
        
        def initialize()
            config_file = File.dirname(File.dirname(File.dirname(__FILE__))) + "/config/tc_sdk_config.ini"
            @config_vars = get_vars(config_file)
        end
        
        def get_vars(conf_file)
            #Here we define a couple of things
            #First is the regular expression that we use to 
            #get rid of whitespace and the array characters.
            line_sub = Regexp.new(/\s+|"|\[|\]/)

            temp = Array.new
            vars=Hash.new

            #Check and make sure that the file exists
            unless File.exists?(conf_file) then
              raise "The specified configuration file doesn't exist!"	
            end
            IO.foreach(conf_file) do |line|
                #discard comment lines
                if line.match(/^#/)
                    next
                elsif
                    #discard a blank line
                    line.match(/^$/)
                    next
                else
                    #Snag variable and throw it into the varhash
                    temp[0],temp[1] = line.to_s.scan(/^.*$/).to_s.split('=')

                    #Match our regular expression and substitute
                    temp.collect! do |val|
                        val.gsub(line_sub, "")
                    end
                    #Add the variables to our hash
                    vars[temp[0]] = temp[1]
                end
            end
            #And return them
            return vars
        end


        
        def GetConfigValue(key)
            return @config_vars[key]
        end
    end
end
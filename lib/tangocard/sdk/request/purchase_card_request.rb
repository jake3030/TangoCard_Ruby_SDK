#
# purchase_card_request.rb
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
# [version]     Id: purchase_card_request.rb 2012-09-19 15:00:00 PST 
# [copyright]   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class PurchaseCardRequest < BaseRequest
        #
        # [property]
        #
        attr_accessor :card_sku
        
        #
        # [property]
        #
        attr_accessor :card_value
        
        #
        # [property]
        #
        attr_accessor :tc_send
        
        #
        # [property]
        #
        attr_accessor :recipient_name
        
        #
        # [property]
        #
        attr_accessor :recipient_email
        
        #
        # [property]
        #
        attr_accessor :gift_message
        
        #
        # [property]
        #
        attr_accessor :gift_from
        
        #
        # Set up a new PurchaseCard request.
        # 
        # [param] TangoCardSdk::TangoCardServiceApiEnum     enumTangoCardServiceApi Selection of which Tango Card Service API environment
        # [param] string                                    username Tango Card Service access username
        # [param] string                                    password Tango Card Service access password
        # [param] string                                    cardSku The SKU of the card to purchase.
        # [param] int                                       cardValue The value of the card to buy in cents (example 500 = $5.00).
        # [param] bool   tcSend Whether TangoCard is to send the card to the 
        #       recipient (true), or return the card's details (false).
        # [param] string recipientName The name of the recipient. Only 
        #       necessary if tcSend = true. If tcSend = false, input will be 
        #       ignored.
        # [param] string recipientEmail The email address of the recipient. 
        #       Only necessary if tcSend = true. If tcSend = false, input will 
        #       be ignored.
        # [param] string giftMessage The gift message to send to the recipient. 
        #       Only necessary if tcSend = true. If tcSend = false, input will 
        #       be ignored.
        # [param] string giftFrom The name of the person giving the gift. Only 
        #       necessary if tcSend = true. If tcSend = false, input will be 
        #       ignored.
        #       
        # [raise] ArgumentError
        #
        def initialize (
                enumTangoCardServiceApi,
                username,
                password,
                cardSku, 
                cardValue, 
                tcSend, 
                recipientName = nil, 
                recipientEmail = nil, 
                giftMessage = nil, 
                giftFrom = nil
            )
        
            # parent construct
            super enumTangoCardServiceApi, username, password 
            
            # -----------------------------------------------------------------
            # validate inputs
            # ----------------------------------------------------------------- 
         
            # cardSku
            if not cardSku.is_a?(String)
                raise ArgumentError.new("Parameter 'cardSku' must be a string.")
            elsif cardSku.length < 1
                raise ArgumentError.new("Parameter 'cardSku' must have a length greater than zero.")
            elsif cardSku.length > 255
                raise ArgumentError.new("Parameter 'cardSku' must have a length less than 255.")
            end
            
            # cardValue
            if not cardValue.is_a?(Integer)
                raise ArgumentError.new("Parameter 'cardValue' must be an integer.")
            elsif cardValue < 1
                raise ArgumentError.new("Parameter 'cardValue' must have a value which is greater than or equal to 1.")
            end   
            
            # tcSend
            if tcSend.nil?
                raise ArgumentError.new("Parameter 'tcSend' must be a boolean: '%s'" % [tcSend.to_s] )
            elsif not tcSend.is_a?(Boolean)
                raise ArgumentError.new("Parameter 'tcSend' must be a boolean: '%s'" % [tcSend.to_s] )
            end
            
            # all of the inputs that are conditional on tcSend
            if (tcSend)
                # recipientName
                if recipientName.nil?
                    raise ArgumentError.new("Parameter 'recipientName' must be present (not nil) if tcSend is set to true.")
                elsif not recipientName.is_a?(String)
                    raise ArgumentError.new("Parameter 'recipientName' must be a string.")
                elsif recipientName.length < 1
                    raise ArgumentError.new("Parameter 'recipientName' must have a length greater than zero.")
                elsif recipientName.length > 255
                    raise ArgumentError.new("Parameter 'recipientName' must have a length less than 256.")
                end
                
                # recipientEmail
                if recipientEmail.nil?
                    raise ArgumentError.new("Parameter 'recipientEmail' must be present (not nil) if tcSend is set to true.")
                elsif not recipientEmail.is_a?(String)
                    raise ArgumentError.new("Parameter 'recipientEmail' must be a string.")
                elsif recipientEmail.length < 3
                    raise ArgumentError.new("Parameter 'recipientEmail' must have a length greater than two.")
                elsif recipientEmail.length > 255
                    raise ArgumentError.new("Parameter 'recipientEmail' must have a length less than 256.")
                end
                
                # giftFrom
                if giftFrom.nil?
                    raise ArgumentError.new("Parameter 'giftFrom' must be present (not nil) if tcSend is set to true.")
                elsif not giftFrom.is_a?(String)
                    raise ArgumentError.new("Parameter 'giftFrom' must be a string.")
                elsif giftFrom.length < 1
                    raise ArgumentError.new("Parameter 'giftFrom' must have a length greater than zero.")
                elsif giftFrom.length > 255
                    raise ArgumentError.new("Parameter 'giftFrom' must have a length less than 256.")
                end
                
                # giftMessage [Optional]
                if not giftMessage.nil?
                    if not giftMessage.is_a?(String)
                        raise ArgumentError.new("Parameter 'giftMessage' must be a string.")
                    elsif giftMessage.length < 1
                        raise ArgumentError.new("Parameter 'giftMessage' must have a length greater than zero.")
                    elsif giftMessage.length > 255
                        raise ArgumentError.new("Parameter 'giftMessage' must have a length less than 256.")
                    end
                end
            end
            
            # -----------------------------------------------------------------
            # save inputs
            # -----------------------------------------------------------------

            @card_sku   = cardSku
            @card_value = cardValue
            @tc_send    = tcSend
            if tcSend 
                @recipient_name  = recipientName 
                @recipient_email = recipientEmail
                @gift_from       = giftFrom
                if not giftMessage.nil? && !giftMessage.empty? 
                    @gift_message    = giftMessage
                end
            end
        end
        
        #
        # @see BaseRequest::getRequestAction()
        #
        def request_action()
            super 
            return "PurchaseCard"
        end
        
        #
        # 
        # JSON representation of a PurchaseCard Request
        # 
        # [param] string &requestJsonEncoded
        # 
        # [return] True upon success, else False
        #
        # @see BaseRequest::getJsonEncodedRequest()
        #
        def json_encoded_request()
            super 
            requestJsonEncoded = nil
            begin

                request = Hash.new
                request['username' ] = @username 
                request['password' ] = @password 
                request['cardSku'  ] = @card_sku
                request['cardValue'] = @card_value
                request['tcSend'   ] = @tc_send
                
                if (@tc_send)
                    request['recipientName' ] = @recipient_name
                    request['recipientEmail'] = @recipient_email
                    request['giftFrom'      ] = @gift_from
                    if ( !@gift_message.nil? && !@gift_message.empty? )
                        request['giftMessage'] = @gift_message
                    end
                end
                
                # encode the request as a JSON object
                requestJsonEncoded = JSON.generate(request)
            
            rescue Exception => e
                raise TangoCardSdkException.new("[%s::%s] Failed encoding request: %s" % [File.basename(__FILE__), __LINE__.to_s, e.message] )
            end
            
            return requestJsonEncoded
        end
    end
end
__END__
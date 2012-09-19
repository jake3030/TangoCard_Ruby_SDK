#
# purchase_card_request.rb
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
# @version     Id: purchase_card_request.rb 2012-09-19 15:00:00 PST 
# @copyright   Copyright (c) 2012, Tango Card (http://www.tangocard.com)
# 
# 

module TangoCardSdk
    class PurchaseCardRequest < BaseRequest
        #
        # @ignore
        #
        attr_accessor :card_sku
        
        #
        # @ignore
        #
        attr_accessor :card_value
        
        #
        # @ignore
        #
        attr_accessor :tc_send
        
        #
        # @ignore
        #
        attr_accessor :recipient_name
        
        #
        # @ignore
        #
        attr_accessor :recipient_email
        
        #
        # @ignore
        #
        attr_accessor :gift_message
        
        #
        # @ignore
        #
        attr_accessor :gift_from
      
        #
        # @ignore
        #
        attr_accessor :company_identifier
        
        #
        # Set up a new PurchaseCard request.
        # 
        # @param \TangoCard\Sdk\Service\TangoCardServiceApiEnum   enumTangoCardServiceApi Selection of which Tango Card Service API environment
        # @param string username Tango Card Service access username
        # @param string password Tango Card Service access password
        # @param string cardSku The SKU of the card to purchase. See {@link 
        #       GetAvailableCards} for possible SKUs.
        # @param int    cardValue The value of the card to buy (lowest-common-
        #       denominator, 5.00 = 500). See {@link GetCardInventory} for 
        #       available values.
        # @param bool   tcSend Whether TangoCard is to send the card to the 
        #       recipient (true), or return the card's details (false).
        # @param string recipientName The name of the recipient. Only 
        #       necessary if tcSend = true. If tcSend = false, input will be 
        #       ignored.
        # @param string recipientEmail The email address of the recipient. 
        #       Only necessary if tcSend = true. If tcSend = false, input will 
        #       be ignored.
        # @param string giftMessage The gift message to send to the recipient. 
        #       Only necessary if tcSend = true. If tcSend = false, input will 
        #       be ignored.
        # @param string giftFrom The name of the person giving the gift. Only 
        #       necessary if tcSend = true. If tcSend = false, input will be 
        #       ignored.
        # @param string companyIdentifier The name of the parent company providing 
        #       this gift. Optional if tcSend = true. If tcSend = false, then this input 
        #       ignored.
        #       
        # @throws \InvalidArgumentException One of the supplied arguments was 
        #        not in the expected state.
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
                giftFrom = nil,
                companyIdentifier = nil
            )
        
            # parent construct
            super enumTangoCardServiceApi, username, password 
            
            # -----------------------------------------------------------------
            # validate inputs
            # ----------------------------------------------------------------- 
         
            # cardSku
            if !cardSku.is_a?(String)
                raise ArgumentError.new("Parameter 'cardSku' must be a string.")
            elsif cardSku.length < 1
                raise ArgumentError.new("Parameter 'cardSku' must have a length greater than zero.")
            elsif cardSku.length > 255
                raise ArgumentError.new("Parameter 'cardSku' must have a length less than 255.")
            end
            
            # cardValue
            if !cardValue.is_a?(Integer)
                raise ArgumentError.new("Parameter 'cardValue' must be an integer.")
            elsif cardValue < 1
                raise ArgumentError.new("Parameter 'cardValue' must have a value which is greater than or equal to 1.")
            end   
            
            # tcSend
            if !tcSend.is_a?(FalseClass) && !tcSend.is_a?(TrueClass)
                raise ArgumentError.new("Parameter 'tcSend' must be a boolean.")
            end
            
            # all of the inputs that are conditional on tcSend
            if (tcSend)
                # recipientName
                if recipientName.nil?
                    raise ArgumentError.new("Parameter 'recipientName' must be present (not nil) if tcSend is set to true.")
                elsif !recipientName.is_a?(String)
                    raise ArgumentError.new("Parameter 'recipientName' must be a string.")
                elsif recipientName.length < 1
                    raise ArgumentError.new("Parameter 'recipientName' must have a length greater than zero.")
                elsif recipientName.length > 255
                    raise ArgumentError.new("Parameter 'recipientName' must have a length less than 256.")
                end
                
                # recipientEmail
                if recipientEmail.nil?
                    raise ArgumentError.new("Parameter 'recipientEmail' must be present (not nil) if tcSend is set to true.")
                elsif !recipientEmail.is_a?(String)
                    raise ArgumentError.new("Parameter 'recipientEmail' must be a string.")
                elsif recipientEmail.length < 3
                    raise ArgumentError.new("Parameter 'recipientEmail' must have a length greater than two.")
                elsif recipientEmail.length > 255
                    raise ArgumentError.new("Parameter 'recipientEmail' must have a length less than 256.")
                end
                
                # giftFrom
                if giftFrom.nil?
                    raise ArgumentError.new("Parameter 'giftFrom' must be present (not nil) if tcSend is set to true.")
                elsif !giftFrom.is_a?(String)
                    raise ArgumentError.new("Parameter 'giftFrom' must be a string.")
                elsif giftFrom.length < 1
                    raise ArgumentError.new("Parameter 'giftFrom' must have a length greater than zero.")
                elsif giftFrom.length > 255
                    raise ArgumentError.new("Parameter 'giftFrom' must have a length less than 256.")
                end
                
                # giftMessage
                if !giftMessage.nil?
                    if !giftMessage.is_a?(String)
                        raise ArgumentError.new("Parameter 'giftMessage' must be a string.")
                    elsif giftMessage.length < 1
                        raise ArgumentError.new("Parameter 'giftMessage' must have a length greater than zero.")
                    elsif giftMessage.length > 255
                        raise ArgumentError.new("Parameter 'giftMessage' must have a length less than 256.")
                    end
                end
            end
            
            # companyIdentifier
            if !companyIdentifier.nil?
                if !companyIdentifier.is_a?(String)
                    raise ArgumentError.new("Parameter 'companyIdentifier' must be a string.")
                elsif companyIdentifier.length < 1
                    raise ArgumentError.new("Parameter 'companyIdentifier' must have a length greater than zero.")
                elsif companyIdentifier.length > 255
                    raise ArgumentError.new("Parameter 'companyIdentifier' must have a length less than 256.")
                end
            end
            
            # -----------------------------------------------------------------
            # save inputs
            # -----------------------------------------------------------------

            @card_sku   = cardSku
            @card_value = cardValue
            @tc_send    = tcSend
            if (tcSend)
                @recipient_name  = recipientName 
                @recipient_email = recipientEmail
                @gift_from       = giftFrom
                if ( !giftMessage.nil? && !giftMessage.empty? )
                    @gift_message    = giftMessage
                end
            end
            if ( !companyIdentifier.nil? && !companyIdentifier.empty? )
                @company_identifier = companyIdentifier
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
        # @param string &requestJsonEncoded
        # 
        # @return True upon success, else False
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
                
                if ( !@company_identifier.nil? && !@company_identifier.empty? )
                    request['companyIdentifier'] = @company_identifier
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
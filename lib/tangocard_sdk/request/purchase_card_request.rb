#
# purchase_card_request.rb
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
# @version     Id: purchase_card_request.rb 2012-09-18 00:00:00 PST 
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
                giftFrom = nil
            )
        
            # parent construct
            super(enumTangoCardServiceApi, username, password)
            
            # -----------------------------------------------------------------
            # validate inputs
            # ----------------------------------------------------------------- 
         
            # cardSku
            if (!is_string(cardSku))
                raise Exception.new("Parameter 'cardSku' must be a string.")
            end
            if (strlen(cardSku) < 1)
                raise Exception.new("Parameter 'cardSku' must have a length greater than zero.")
            end
            if (strlen(cardSku) > 255)
                raise Exception.new("Parameter 'cardSku' must have a length less than 255.")
            end
            
            # cardValue
            if (!is_int(cardValue))
                raise Exception.new("Parameter 'cardValue' must be an integer.")
            end
            if (cardValue < 1)
                raise Exception.new("Parameter 'cardValue' must have a value which is greater than or equal to 1.")
            end   
            
            # tcSend
            if (!is_bool(tcSend))
                raise Exception.new("Parameter 'tcSend' must be a boolean.")
            end
            
            # all of the inputs that are conditional on tcSend
            if (tcSend)
                # recipientName
                if (is_nil(recipientName))
                    raise Exception.new("Parameter 'recipientName' must be present (not nil) if tcSend is set to true.")
                end
                if (!is_string(recipientName))
                    raise Exception.new("Parameter 'recipientName' must be a string.")
                end 
                if (strlen(recipientName) < 1)
                    raise Exception.new("Parameter 'recipientName' must have a length greater than zero.")
                end
                if (strlen(recipientName) > 255)
                    raise Exception.new("Parameter 'recipientName' must have a length less than 256.")
                end
                # recipientEmail
                if (is_nil(recipientEmail))
                    raise Exception.new("Parameter 'recipientEmail' must be present (not nil) if tcSend is set to true.")
                end
                if (!is_string(recipientEmail))
                    raise Exception.new("Parameter 'recipientEmail' must be a string.")
                end 
                if (strlen(recipientEmail) < 3)
                    raise Exception.new("Parameter 'recipientEmail' must have a length greater than two.")
                end
                if (strlen(recipientEmail) > 255)
                    raise Exception.new("Parameter 'recipientEmail' must have a length less than 256.")
                end
                # giftFrom
                if (is_nil(giftFrom))
                    raise Exception.new("Parameter 'giftFrom' must be present (not nil) if tcSend is set to true.")
                end
                if (!is_string(giftFrom))
                    raise Exception.new("Parameter 'giftFrom' must be a string.")
                end 
                if (strlen(giftFrom) < 1)
                    raise Exception.new("Parameter 'giftFrom' must have a length greater than zero.")
                end
                if (strlen(giftFrom) > 255)
                    raise Exception.new("Parameter 'giftFrom' must have a length less than 256.")
                end
                # giftMessage
                if ( !giftMessage.nil? && !giftMessage.empty? )
                    if (strlen(giftMessage) > 255)
                        raise Exception.new("Parameter 'giftMessage' must have a length less than 256.")
                    end
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
        end
            
        #
        # 
        # Execute request
        # 
        # @param \TangoCard\Sdk\Response\Success\PurchaseCardResponse response
        # 
        # @return True upon success, else False
        # 
        # @see BaseRequest::execute()
        #
        def execute(&response) 
            return super::execute(response)
        end
        
        #
        # @see BaseRequest::getRequestAction()
        #
        def getRequestAction()
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
        def getJsonEncodedRequest(&requestJsonEncoded)
            isSuccess = true
            requestJsonEncoded = nil
            begin
                request = Array.new
                
                request['username' ] = parent::getUsername()
                request['password' ] = parent::getPassword()
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
                isSuccess = true
            
            rescue Exception => e
                raise e
            end
            
            return isSuccess
        end
    end
end
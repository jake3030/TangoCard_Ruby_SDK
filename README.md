<h1>Tango Card Ruby SDK</h1>
<h3>Incorporate the innovative Tango Card directly into your reward, loyalty, and engagement applications.</h3>
===

# Table of Contents #
<ul>
    <li><a href="#introduction">Introduction</a>
        <ul>
            <li><a href="#tango_card_sdks">Tango Card SDKs</a></li>
            <li><a href="#tango_card_service_api">Tango Card Service API</a></li>
            <li><a href="#incorporate_tango_card">Incorporate the Tango Card</a></li>
            <li><a href="#open_account">Open Tango Card Account</a>
                <ul>
                    <li><a href="#open_account_register">Register</a></li>
                    <li><a href="#open_account_login">Login</a></li>
                    <li><a href="#open_account_add_funds">Add Funds</a></li>
                </ul>
            </li>
            <li><a href="#start_using">Start Using</a>
                <ul>
                    <li><a href="#start_using_purchase">Purchase and Distribution of Gift Cards</a></li>
                    <li><a href="#start_using_gift_cards">The Tango Card and other Retailer Brand Gift Cards</a></li>
                </ul>
            </li>
            <li><a href="#sdk_support">Tango Card SDKs Support</a></li>
            <li><a href="#contact_us">Contact Us</a></li>
        </ul>
    </li>
    <li><a href="#sdk_overview">Tango Card SDK Overview</a></li>
    <li><a href="#sdk_requirements">Tango Card SDK Requirements</a></li>
    <li><a href="#tango_card_service_api_requests">Tango Card Service API Requests</a>
        <ul>
            <li><a href="#tango_card_service_api_endpoints">Tango Card Service API Endpoints</a></li>
            <li><a href="#tango_card_service_api_security">Tango Card Service API Security</a></li>
        </ul>
    </li>
    <li><a href="#tango_card_sdk_methods">Tango Card SDK Methods</a>
        <ul>
            <li><a href="#get_available_balance">Get Available Balance</a></li>
            <li><a href="#purchase_card">Purchase Card</a></li>
        </ul>
    </li>
    <li><a href="#tango_card_error_handling">Tango Card Error Handling</a>
        <ul>
            <li><a href="#service_failure_responses">Service Failure Responses</a></li>
            <li><a href="#sdk_error_responses">SDK Error Responses</a></li>
            <li><a href="#handling_errors">Handling Errors</a></li>
        </ul>
    </li>
    <li><a href="#sdk_contents">SDK Contents</a>
        <ul>
            <li><a href="#lib">lib</a></li>
            <li><a href="#configuration_files">configuration files</a></li>
            <li><a href="#examples">examples</a></li>        
            <li><a href="#unittests">unittests</a></li>
        </ul>
    </li>
    <li><a href="#sdk_development_environment">SDK Development Environment</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#production_deployment">Production Deployment</a></li>
</ul>

<a name="introduction"></a>
# Introduction #

<a name="tango_card_sdk"></a>
## Tango Card SDK ##
Tango Card's SDK is flexible, secure, and straightforward. It allows any server to purchase the Tango Card and is intended for users requiring high volume transactions and processes.

<a name="tango_card_service_api"></a>
## Tango Card Service API ##
For those developers who wish to develop directly with our Tango Card API endpoints and do not wish to use our available SDKs or need more detail of how our API is defined, the following document is available:
<ul>
    <li><a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a></li>
</ul>

<a name="incorporate_tango_card"></a>
## Incorporate the Tango Card ##
The Tango Card SDKs, through the <a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>, allows you to incorporate the innovative Tango Card directly into your reward, loyalty, and engagement applications. 

Tango Card is the “exactly what you want” gift card and allows the recipient to use their value exactly how they want – they can select a premier gift card, they can divide their value among Brands, they can use some today and save the rest for another day. They can also donate to a non-profit organization. 

Tango Card value can be used via the web or from almost any mobile device. There are no fees or expiration dates of any kind. It’s great for the recipient, and even better for you because it is an entire gift card program delivered in one card allowing you to focus on your core business. 

Tango Card solutions are already used by Microsoft Bing, FedEx, Extole, Plink, beintoo, Lead Valu, Getty Images, and many others.

<a name="open_account"></a>
## Open Tango Card Account ##

In order to use the Tango Card SDKs, it is required to open and fund a Tango Card account on https://www.tangocard.com

<a name="open_account_register"></a>
### Register ###

First, register to open a Tango Card account: <a href="https://www.tangocard.com/user/register" target="_blank">Register</a> 

The provided 'username (email address)' and 'password' will be the same as what will be used for authenticating usage of the Tango Card SDKs' methods.

<a name="open_account_login"></a>
### Login ###

Second, to verify availability of your production account by using login: <a href="https://www.tangocard.com/user/login" target="_blank">Login</a>

<a name="open_account_add_funds"></a>
### Add Funds ###

Third, in order to purchase the Tango Card through the Tango Card SDKs, there must be funds within your Tango Card account.

Fund your account here either by 'wire transfer', 'check', or 'credit card': <a href="https://www.tangocard.com/user/addfunds" target="_blank">Add Funds</a>

<a name="start_using"></a>
## Start Using ##

After opening and funding your Tango Card account, then you are ready to begin using the Tango Card SDK to access your account.

<a name="start_using_purchase"></a>
### Purchase and Distribution of Gift Cards ###
Through the Tango Card SDKs you can purchase Tango Card gift cards with your choice of delivery:
<ul>
    <li>Have Tango Card service send gift cards directly to recipients via email which will include live gift card codes.</li>
    <li>You take the returned live gift card codes for you to customize and redistribute.</li>
</ul>

<a name="start_using_gift_cards"></a>
### The Tango Card and other Retailer Brand Gift Cards ###

The API is optimized for ordering the Tango Card, which has SKU of ```"tango-card"```.

If you have questions about potentially incorporating other brands or digital goods in your program please contact us at general@tangocard.com.

<a name="sdk_support"></a>
## Tango Card SDKs Support ##
If you have any questions with the Tango Card SDKs, please contact us at sdk@tangocard.com.

<a name="contact_us"></a>
## Contact Us ##
To learn more about Tango Card integration solutions, call 1.877.55.TANGO.

<a name="sdk_overview"></a>
# Tango Card SDK Overview #

The Tango Card Ruby SDK is a wrapper around the Tango Card Service API. environments. As such, it has two primary types of objects, Requests and Responses; which are handled by a wrapper class `TangoCardSdk::TangoCardServiceApi`.

The wrapper class `TangoCardSdk::TangoCardServiceApi` currently handles the following static methods:
<dl>
    <dt>bool GetAvailableBalance()</dt>
    <dd>- Gather the currently available balance for provided user within their www.tangocard.com account.</dd>

    <dt>bool PurchaseCard()</dt>
    <dd>- Purchase a gift card using funds from user's www.tangocard.com account.</dd>
</dl>

![Tango Card Service Api](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocardserviceapi.png "Tango Card Service API")

<a name="sdk_requirements"></a>
# Tango Card Ruby SDK Requirements #

<ul>
    <li><a href="http://www.ruby-lang.org/en/downloads/" target="_blank">Ruby 1.9.3</a></li>
    <li><code>gem install</code>
        <ul>
            <li><a href="http://rubygems.org/gems/inifile" target="_blank"><code>inifile</code></a></li>
        </ul>
    </li>
</ul>

## Tango Card Ruby SDK Gem Install ##

Use [RubyGem](http://rubygems.org/) to install Tango Card Ruby SDK Gem file:

```Test

    > gem install tangocard_sdk-[current version].gem

```


<a name="tango_card_service_api_requests"></a>
# Tango Card Service API Requests #

With the <a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>, every request has a corresponding success-case response object. There are also several failure-case response objects which are shared between calls. The specifics of the request and response objects will be described in <a href="#tango_card_sdk_methods">Tango Card SDK Methods</a>.

<a name="tango_card_service_api_endpoints"></a>
## Tango Card Service API Endpoints ##

Available are two endpoints that provide the <a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>, as defined by `TangoCard::TangoCardServiceApiEnum` :
<dl>
    <dt><code>INTEGRATION</code></dt> 
    <dd>
        <ul>
            <li>Expected to be used for development and testing purposes.</li>
            <li><b>Important:</b> Purchases from this endpoint will: 
                <ul>
                    <li>Use funds from our test account.</li>
                    <li>Send real emails (with fake codes), so only use recipient email addresses you control for testing purposes.</li>
                </ul>
            </li>
            <li>Secure Endpoint URL: <code>https://int.tangocard.com/Version2</code></li>
            <li>Login to use our testing account through this endpoint is:
                <dl>
                    <dt>Username:</dt>
                    <dd>third_party_int@tangocard.com</dd>
                    <dt>Password:</dt>
                    <dd>integrateme</dd>
                </dl>
            </li>
        </ul>
    </dd>
    <dt><code>PRODUCTION</code></dt>
    <dd>
        <ul>
            <li>Performs actual card purchase requests.</li>
            <li><b>Important:</b> Purchases from this endpoint will: 
                <ul>
                    <li>Use funds from <b>your Tango Card account</b>!</li>
                    <li>Send real emails (with live codes), only use recipient email addresses you wish to deliver to.</li>
                </ul>
            </li>
            <li>Endpoint URL: <code>https://api.tangocard.com/Version2</code></li>
            <li>Login to use your production account through this endpoint is:
                <dl>
                    <dt>Username:</dt>
                    <dd>Your Tango Card account's username (email address)</dd>
                    <dt>Password:</dt>
                    <dd>Your Tango Card account's password</dd>
                </dl>
            </li>
        </ul>
    </dd>
</dl>

<a name="tango_card_service_api_security"></a>
## Tango Card Service API Security ##

<a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a> Requests are performed using secure HTTP POST via <a href="http://en.wikipedia.org/wiki/Transport_Layer_Security" target="_blank">"TLS/SSL"</a>.

The use of SSL allows for securely transmitting data and prevents <a href="http://en.wikipedia.org/wiki/Man-in-the-middle_attack" target="_blank">man-in-the-middle attacks</a>.

The lack of sessions and the inability to communicate with the API over HTTP prevents <a href="http://en.wikipedia.org/wiki/Session_hijacking" target="_blank">session hijacking</a> and <a href="http://en.wikipedia.org/wiki/Cross-site_request_forgery" target="_blank">cross-site request forgery</a>.

<a name="tango_card_sdk_methods"></a>
# Tango Card SDK Methods #

<a name="get_available_balance"></a>
## Get Available Balance ##

![Tango Card Service API - GetAvailableBalance()](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocardserviceapi_getavailablebalance.png "Tango Card Service API - GetAvailableBalance()")

This request is defined by `class TangoCardSdk::GetAvailableBalanceRequest`:

```ruby
require 'rubygems'
require 'tangocard_sdk'

    # ... #

    app_tango_card_service_api = TangoCardSdk::TangoCardServiceApiEnum::INTEGRATION
    username = "burt@example.com"
    password = "password"
    
    responseGetAvailableBalance = TangoCardSdk::TangoCardServiceApi.get_available_balance(
        app_tango_card_service_api,
        username, 
        password
        )
     
    if !responseGetAvailableBalance.nil?
        # we have a response from the server, lets see what we got (and do something with it)
        if responseGetAvailableBalance.is_a? TangoCardSdk::GetAvailableBalanceResponse
            p "Success - GetAvailableBalance - Initial"
            tango_cents_available_balance = responseGetAvailableBalance.availableBalance
            p "I have an available balance of %s dollars." % [TangocardExamples::currencify(tango_cents_available_balance.to_f/100)]
        else
            raise RuntimeError.new('Unexpected response.')
        end
    else
        raise RuntimeError.new('Unexpected response.')
    end
    
    # ... #

__END__
```

Assuming success, the `out` parameter `response` will be an instance of `TangoCardSdk::GetAvailableBalanceResponse`.

### Method TangoCardSdk::TangoCardServiceApi.get_available_balance() ###

#### Parameters ####
<dl>
  <dt>TangoCardServiceApiEnum enumTangoCardServiceApi</dt>
  <dd>- <code>INTEGRATION</code> or <code>PRODUCTION</code></dd>
  
  <dt>string username</dt>
  <dd>- User email address, and the SDK Integration test username is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_username</code></dd>

  <dt>string password</dt>
  <dd>- User password, and the SDK Integration test password is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_password</code></dd>
</dl>

### `TangoCardSdk::GetAvailableBalanceResponse` Properties ###

<dl>
  <dt>int getAvailableBalance</dt>
  <dd>- Returns available balance of username's account in cents: 100 is $1.00 dollar.</dd>
</dl>

<a name="purchase_card"></a>
## Purchase Card ##

![Tango Card Service API - PurchaseCard()](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocardserviceapi_purchasecard.png "Tango Card Service API - PurchaseCard()")

This request is defined by `class TangoCardSdk::PurchaseCardRequest`:

```ruby
require 'rubygems'
require 'tangocard_sdk'

    # ... #
    
    app_tango_card_service_api = TangoCardSdk::TangoCardServiceApiEnum::INTEGRATION
    username = "burt@example.com"
    password = "password"
    card_sku = "tango-card";
    cardValueTangoCardCents = 100; // $1.00 dollars
    
    responsePurchaseCard_Delivery = TangoCardSdk::TangoCardServiceApi.purchase_card(
            app_tango_card_service_api,
            username, 
            password,
            card_sku,                               # cardSku
            cardValueTangoCardCents,                # cardValue
            true,                                   # tcSend 
            "Sally Example",                        # recipientName
            "sally@example.com",                    # recipientEmail
            "Happy Birthday",                       # giftMessage
            "Bill Example"                          # giftFrom
        )

    if !responsePurchaseCard_Delivery.nil?
        # we have a response from the server, lets see what we got (and do something with it)
        if responsePurchaseCard_Delivery.is_a? TangoCardSdk::PurchaseCardResponse
            p "Success - PurchaseCard - Delivery"
            p "Reference Order ID: %s" % [responsePurchaseCard_Delivery.referenceOrderId.to_s]
            p "Card Token:         %s" % [responsePurchaseCard_Delivery.cardToken.to_s]
            p "Card Number:        %s" % [responsePurchaseCard_Delivery.cardNumber.to_s]
            p "Card Pin:           %s" % [responsePurchaseCard_Delivery.cardPin.to_s]
        else
            raise RuntimeError.new('Unexpected response.')
        end
    else
        raise RuntimeError.new('Unexpected response.')
    end
    
    # ... #

__END__
```

Assuming success, the `out` parameter `response` will be an instance of `TangoCardSdk::PurchaseCardResponse`.

### Method TangoCardSdk::TangoCardServiceApi.PurchaseCard() ###

#### Parameters ###
<dl>
  <dt>TangoCardServiceApiEnum enumTangoCardServiceApi</dt>
  <dd>- <code>INTEGRATION</code> or <code>PRODUCTION</code></dd>

  <dt>string username</dt>
  <dd>- User email address, and a SDK Integration test username is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_username</code></dd>

  <dt>string password</dt>
  <dd>- User password, and a SDK Integration test password is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_password</code></dd>

  <dt>string cardSku</dt>
  <dd>- Card brand request, and the Tango Card brand's card sku *tango-card* is defined in configuration file <code>config\app_config.ini</code> within <code>app_card_sku</code></dd>

  <dt>int cardValue</dt>
  <dd>- Card value in cents; a value of 100 (cent) is $1.00 dollar card. Minimum value is 1 (cent).</dd>

  <dt>boolean tcSend</dt>
  <dd>- Tango Card Service delivers by Email requested card. Set to <code>true</code> for email delivery, and <code>false</code> for no delivery.</dd>

  <dt>string recipientName</dt>
  <dd>- Full name of recipient receiving gift card. Set this parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>string recipientEmail</dt>
  <dd>- Valid email address of recipient receiving gift card. Set this parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>string giftMessage</dt>
  <dd>- [Optional] Gift message to be applied to gift card's email. Set this optional parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) or null if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>string giftFrom</dt>
  <dd>- Full name of giver of gift card. Set this parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>
</dl>

### `TangoCardSdk::PurchaseCardResponse` Properties ###

<dl>
  <dt>String getReferenceOrderId</dt>
  <dd>- Confirmation number of purchase.</dd>
  
  <dt>String getCardToken</dt>
  <dd>- Card reference to the aforementioned purchase.</dd>
  
  <dt>String getCardNumber</dt>
  <dd>- Card number provided to the recipient to be used at redemption upon the www.tangocard.com site.</dd>
  
  <dt>String getCardPin</dt>
  <dd>- Card pin provided to the recipient used to validate provided Card number a redemption upon the www.tangocard.com site.</dd>
</dl>

<a name="tango_card_error_handling"></a>
# Tango Card Error Handling #

The Tango Card Service API SDK handles its errors by throwing the following exceptions:

* Custom `TangoCardSdk::TangoCardServiceException` is thrown when the `Tango Card Service API` return a `Failure Response` for a given `Request`.
* Custom `TangoCardSdk::TangoCardSdkException` is thrown when the Tango Card SDK has detected an error within its code, regardless of any given Request.
* Standard `\InvalidArgumentException` is thrown due to parameter entry errors.

![Tango Card SDK Exceptions](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocard_sdk_exceptions.png "Tango Card SDK Exceptions")

<a name="service_failure_responses"></a>
## Service Failure Responses ##

A service will return the following failure responses as enumerated by `TangoCardSdk::ServiceResponseEnum`:

<table>
    <tr><th>Failure</th><th>Failure Reponse Type</th><th>Failure Response Object</th></tr>
    <tr><td>Insufficient Funds</td><td><code>INS_FUNDS</code></td><td><code>TangoCardSdk::InsufficientFundsResponse</code></td></tr>
    <tr><td>Insufficient Inventory</td><td><code>INS_INV</code></td><td><code>TangoCardSdk::InsufficientInventoryResponse</code></td></tr> 
    <tr><td>Invalid Credentials</td><td><code>INV_CREDENTIAL</code></td><td><code>TangoCardSdk::InvalidCredentialsResponse</code></td></tr> 
    <tr><td>Invalid Input</td><td><code>INV_INPUT</code></td><td><code>TangoCardSdk::InvalidInputResponse</code></td></tr>
    <tr><td>System Failure</td><td><code>SYS_ERROR</code></td><td><code>TangoCardSdk::SystemFailureResponse</code></td></tr>
</table>

Each of the aforementioned `Failure Responses` contains details as to the reason that the `Tango Card Service API` did not perform provided `Request`.

![Tango Card SDK Service Response Failures](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocard_sdk_service_failure_response.png "Tango Card SDK Service Response Failures")

The details of these service failure responses are embedded and thrown within `TangoCardSdk::TangoCardServiceException`

### Expected Failure Responses for Specific Requests ###

Using this SDK, when a request fails because of failure response from the Tango Card Service API, then <code>TangoCardSdk::TangoCardServiceException</code> is thrown.

The exception has two properties that define what was failure response from the Tango Card Service API:
* `Failure Response Type` held within this property <code>TangoCardSdk::TangoCardServiceException.responseType</code>.
* `failure Response Object` held within this property <code>TangoCardSdk::TangoCardServiceException.response</code> whose parent class is <code>TangoCardSdk::FailureResponse</code>.

<table>
    <tr><th>Request</th><th>Possible Failure Responses</th></tr>
    <tr>
        <td><code>TangoCardSdk::GetAvailableBalanceRequest</code></td>
        <td>
            <table>
                <tr><th>Failure Reponse Type</th><th>Failure Response</th></tr>
                <tr><td><code>INV_CREDENTIAL</code></td><td><code>TangoCardSdk::InvalidCredentialsResponse</code></td></tr> 
                <tr><td><code>SYS_ERROR</code></td><td><code>TangoCardSdk::SystemFailureResponse</code></td></tr>
            </table>
        </td>
    </tr>
    <tr>
        <td><code>TangoCardSdk::PurchaseCardRequest</code></td>
        <td>
            <table>
                <tr><th>Failure Reponse Type</th><th>Failure Response</th></tr>
                <tr><td><code>INS_FUNDS</code></td><td><code>TangoCardSdk::InsufficientFundsResponse</code></td></tr>
                <tr><td><code>INS_INV</code></td><td><code>TangoCardSdk::InsufficientInventoryResponse</code></td></tr> 
                <tr><td><code>INV_CREDENTIAL</code></td><td><code>TangoCardSdk::InvalidCredentialsResponse</code></td></tr> 
                <tr><td><code>INV_INPUT</code></td><td><code>TangoCardSdk::InvalidInputResponse</code></td></tr>
                <tr><td><code>SYS_ERROR</code></td><td><code>TangoCardSdk::SystemFailureResponse</code></td></tr>
            </table>
        </td>
    </tr>
</table>

<a name="sdk_error_responses"></a>
## SDK Error Responses ##

This SDK throws it own custom exception `TangoCardSdk::TangoCardSdkException` when detecting errors that pertain to itself.

![Tango Card SDK Error Detection](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocard_sdk_error_detected.png "Tango Card SDK Error Detection")

<a name="handling_errors"></a>
## Handling Errors ##

Wrap every Tango Card request call within a try/catch block, followed by first catching `TangoCardSdk::TangoCardServiceException`, then by `TangoCardSdk::TangoCardSdkException`, and finally by standard `Exception`.

```ruby

require 'rubygems'
require 'tangocard_sdk'

    # ... #
    
    enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum::INTEGRATION
    app_username = "burt@example.com"
    app_password = "password"
    
    begin
        puts "\n======== Get Available Balance with Invalid Credentials ========"

        responseGetAvailableBalanceUpdate = TangoCardSdk::TangoCardServiceApi.get_available_balance(
                enumTangoCardServiceApi,
                app_username, 
                app_password
            ) 

        if not responseGetAvailableBalanceUpdate.nil?
            puts "\n\t=== Expected failure ==="
        end
    rescue TangoCardSdk::TangoCardServiceException => e
        puts "\n\t=== Tango Card Service Failure ==="
        puts "\t\tFailure response type: %s" % [e.responseType]
        puts "\t\tFailure response:      %s" % [e.message]
    rescue TangoCardSdk::TangoCardSdkException => e
        puts "\n\t=== Tango Card SDK Failure ==="
        puts "\t\t" + e.message
        puts "\t\t" + e.backtrace
    rescue Exception => e
        puts "\n\t=== Unexpected Error ==="
        puts "\t\t" + e.class
        puts "\t\t" + e.message
        puts "\t\t" + e.backtrace
    end
    
    # ... #
    
__END__
```

<a name="sdk_contents"></a>
# SDK Contents #
This section details the provided sources of this SDK.

<a name="lib"></a>
## lib ##
This is the heart of the SDK which contains the sources, and here is a listing of its directories:

* lib\tangocard-sdk.rb
* lib\tangocard_sdk.rb
* lib\config\tc_sdk_config.ini
* lib\ssl\cacert.pem
* lib\tangocard_sdk\tangocard_service_api.rb
* lib\tangocard_sdk\common\helper.rb
* lib\tangocard_sdk\common\sdk_config.rb
* lib\tangocard_sdk\common\tangocard_sdk_exception.rb
* lib\tangocard_sdk\request\base_request.rb
* lib\tangocard_sdk\request\get_available_balance_request.rb
* lib\tangocard_sdk\request\purchase_card_request.rb
* lib\tangocard_sdk\response\base_response.rb
* lib\tangocard_sdk\response\service_response_enum.rb
* lib\tangocard_sdk\response\failure\failure_response.rb
* lib\tangocard_sdk\response\failure\insufficient_funds_response.rb
* lib\tangocard_sdk\response\failure\insufficient_inventory_response.rb
* lib\tangocard_sdk\response\failure\invalid_credentials_response.rb
* lib\tangocard_sdk\response\failure\invalid_input_response.rb
* lib\tangocard_sdk\response\failure\system_error_response.rb
* lib\tangocard_sdk\response\success\get_available_balance_response.rb
* lib\tangocard_sdk\response\success\purchase_card_response.rb
* lib\tangocard_sdk\response\success\success_response.rb
* lib\tangocard_sdk\service\service_proxy.rb
* lib\tangocard_sdk\service\tangocard_service_api_enum.rb
* lib\tangocard_sdk\service\tangocard_service_exception.rb

<a name="configuration_files"></a>
## configuration files ##

There a several configuration and certification files that are referenced by either the provide application examples, unittests, and SDK itself.

<dl>
    <dt>config\app_config.ini</dt>
    <dd>- Application configuration file for `\examples` and `\unittests`</dd>
    
    <dt>lib\TangoCard\config\tc_sdk_config.ini</dt>
    <dd>- SDK configuration file referenced by `TangoCardSdk::SdkConfig` within file `\lib\tangocard_sdk\common\sdk_config.rb`. <b>DO NOT MODIFY</b> contents of this configuration file `tc_sdk_config.ini`.</dd>
    
    <dt>lib\TangoCard\ssl\cacert.pem</dt>
    <dd>- The root-CA certificates for the Tango Card prodcution and integration endpoints (issued by Thawte), so that machines that do not have them will still be able to make use of the SDK. This is file referenced by `TangoCardSdk::ServiceProxy` within file `\lib\tangocard_sdk\service\service_proxy.rb`.</dd>
</dl>


<a name="examples"></a>
## examples ##

The examples sub-directory contains full "start to finish" examples of all of the supported methods. This includes catching all of the possible failure modes, etc. 

### tangocard_store_example.rb ###

This is a complete example of requesting available balance and purchasing Tango Cards.

1. Request latest available balance
2. Purchase $1.00 Tango Card for Email Delivery
3. Purchase $1.00 Tango Card without Email Delivery
4. Request updated available balance

#### Command Line ####

This example is intended to be run from the command line:
```Text
    > ruby -w examples/tangocard_examples.rb
```

#### Example Command Line Run ####

```Text
    ==============================
    = Tango Card PHP SDK Example =
    ==============================

        Success - GetAvailableBalance - Initial
                I have an available balance of $8,734,906.42 dollars.

        Success - PurchaseCard - Delivery
                Reference Order ID: 112-09213849-20
                Card Token:         505b86cd7bcbf4.58389421
                Card Number:        7001-4040-0104-5484-212
                Card Pin:           387463

        Success - PurchaseCard - No Delivery
                Reference Order ID: 112-09213850-20
                Card Token:         505b86ce44be40.34850325
                Card Number:        7001-1040-0105-2384-313
                Card Pin:           835609

        Success - GetAvailableBalance - Concluding
                I have an available balance of $8,734,904.42 dollars.

    ==============================
    =   The End                  =
    ==============================
```

### tangocard_failures_example.rb ###

Example of how the SDK handles various failure responses, such as:
* Insufficient Funds
* Invalid Credentials
* Invalid Input

#### Command Line ####

This example is intended to be run from the command line:

```Text
    > ruby -w examples/tangocard_examples.rb
```

#### Example Command Line Run ####

```Text
    ==============================
    = Tango Card PHP SDK Example =
    =   with Failures            =
    ==============================

    ======== Get Available Balance with Invalid Credentials ========

        === Tango Card Service Failure ===
                Failure response type: INV_CREDENTIAL
                Failure response:      Provided user credentials are not valid.

    ===== End Get Available Balance with Invalid Credentials ====

    ======== Purchase Card with Insufficient Funds ========

        === Tango Card Service Failure ===
                Failure response type: INS_FUNDS
                Failure response:      Available Balance: 0, Order Cost: 100
                Available Balance: $0.00
                Order Cost       : $1.00

    ======== End Purchase Card with Insufficient Funds ========

    ==============================
    =   The End                  =
    ==============================
```
<a name="unittests"></a>
## unittests ##

The SDK's unittests have been written to use [Test::Unit::TestCase](http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing).

* `unittests\unittest_getavailablebalance.rb`
* `unittests\unittest_purchasecard.rb`
* `unittests\unittest_sdk_config.rb`
* `unittests\unittest_service_api_enums.rb`
* `unittests\unittest_service_response_enums.rb`

### Running Ruby Unit Tests ###

Installation of [Test::Unit::TestCase](http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing) is required to run these from command-line.

#### unittests\unittest_getavailablebalance.rb ####

```Text
    > ruby -w unittests\unittest_getavailabl ebalance.rb
    Run options:

    # Running tests:

    ...

    Finished tests in 2.684154s, 1.1177 tests/s, 4.4707 assertions/s.

    3 tests, 12 assertions, 0 failures, 0 errors, 0 skips
```

#### unittests\unittest_purchasecard.rb ####

```Text
    > ruby -w unittests\unittest_purchasecar d.rb
    Run options:

    # Running tests:

    ......

    Finished tests in 9.651552s, 0.6217 tests/s, 4.0408 assertions/s.

    6 tests, 39 assertions, 0 failures, 0 errors, 0 skips
```

<a name="sdk_development_environment"></a>
# SDK Development Environment #

This Ruby SDK project was built using:

* [eclipse Juno](http://www.eclipse.org/juno/)
* [Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/)
* [Dynamic Languages Toolkit – Ruby Development Tools](http://www.eclipse.org/dltk/)

<a name="license"></a>
# License #

The Tango Card Ruby SDK is free to use, given some restrictions. Please see the LICENSE file for details.

<a name="production_deployment"></a>
# Production Deployment #

When you're ready to go live, email [sales@tangocard.com](mailto:sales@tangocard.com). We'll get you set up with a contract and everything else you need, including linking your account so that transactions served via your integration will draw down on your Tango Card account. 

<h1>Tango Card Ruby SDK</h1>
<h3>Incorporate the innovative Tango Card directly into your reward, loyalty, and engagement applications.</h3>
<h4>Update: 2012-10-03</h4>
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
        </ul>
    </li>
    <li><a href="#puchasing_options">Understanding Gift Card Purchasing Options</a>
        <ul>
            <li><a href="#puchasing_options_distribution">Distribution of Gift Cards</a></li>
            <li><a href="#puchasing_options_skus">The Tango Card and other Retailer Brand Gift Cards</a></li>
            <li><a href="#puchasing_options_denominations">Gift Card Denominations</a></li>
            <li><a href="#puchasing_options_templates">The Tango Card and custom Company Email Templates</a></li>
        </ul>
    </li>
    <li><a href="#sdk_support">Tango Card SDKs and Service API Support</a>
        <ul>
            <li><a href="#sdk_support_resolve">Resolving Issues</a>
                <ul>
                    <li><a href="#sdk_support_resolve_fiddler_2">Fiddler 2</a></li>
                    <li><a href="#sdk_support_resolve_jquery_diagnostic_tool">Tango Card Diagnostic Tool</a></li>
                </ul>
            </li>
        </ul>
    </li>
    <li><a href="#sdk_overview">SDK Overview</a></li>
    <li><a href="#sdk_requirements">SDK Requirements</a>
        <ul>
            <li><a href="#sdk_requirements_environment">Gem Environment Requirements</a></li>
            <li><a href="#sdk_requirements_install">Gem Installation</a></li>
        </ul>
    </li>
    <li><a href="#tango_card_service_api_requests">Tango Card Service API Requests</a>
        <ul>
            <li><a href="#tango_card_service_api_endpoints">Tango Card Service API Endpoints</a></li>
            <li><a href="#tango_card_service_api_security">Tango Card Service API Security</a></li>
        </ul>
    </li>
    <li><a href="#sdk_methods">SDK Methods</a>
        <ul>
            <li><a href="#get_available_balance">Get Available Balance</a></li>
            <li><a href="#purchase_card">Purchase Card</a></li>
        </ul>
    </li>
    <li><a href="#sdk_error_handling">SDK Error Handling</a>
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
            <li><a href="#examples">examples</a>
                <ul>
                    <li><a href="#examples_config">Example Configuration</a></li>
                    <li><a href="#examples_success">Success Requests</a></li>
                    <li><a href="#examples_failures">Failure Requests</a></li>
                </ul>
            </li>
            <li><a href="#unittests">unittests</a></li>
        </ul>
    </li>
    <li><a href="#sdk_development_environment">SDK Development Environment</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact_us">Contact Us</a></li>
</ul>

<a name="introduction"></a>
# Introduction #

<a name="tango_card_sdks"></a>
## Tango Card SDKs ##
The `Tango Card Service API` provides a flexible, secure, and straight forward solution for integrating into reward, loyalty, and engagement applications for purchasing the Tango Card from their funded Tango Card account on https://www.tangocard.com. 

There are several `Tango Card SDKs` currently available that use the `Tango Card Service API`:
<ul>
    <li><a href="https://github.com/tangocarddev/TangoCard_DotNet_SDK" target="_blank">Tango Card C#/.Net 4.0 SDK</a></li>
    <li><a href="https://github.com/tangocarddev/TangoCard_PHP_SDK" target="_blank">Tango Card PHP SDK</a></li>
    <li><a href="https://github.com/tangocarddev/TangoCard_Java_SDK" target="_blank">Tango Card Java SDK</a></li>
    <li><a href="https://github.com/tangocarddev/TangoCard_Ruby_SDK" target="_blank">Tango Card Ruby SDK</a></li>
    <li><a href="https://github.com/tangocarddev/TangoCard_jQuery_Plugin" target="_blank">Tango Card jQuery Plugin</a></li>
</ul>

<a name="tango_card_service_api"></a>
## Tango Card Service API ##
For those developers who wish to develop directly with our `Tango Card Service API` endpoints and do not wish to use our available SDKs or need more detail of how our API is defined, the following document is available:
<ul>
    <li><a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a></li>
</ul>

<a name="incorporate_tango_card"></a>
## Incorporate the Tango Card ##
The Tango Card SDKs, through our <a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>, allows you to incorporate the innovative Tango Card directly into your reward, loyalty, and engagement applications.

Tango Card is the "exactly what you want" gift card and allows the recipient to use their value exactly how they want - they can select a premier gift card, they can divide their value among Brands, they can use some today and save the rest for another day. They can also donate to a non-profit organization. 

Tango Card value can be used via the web or from almost any mobile device. There are no fees or expiration dates of any kind. It's great for the recipient, and even better for you because it is an entire gift card program delivered in one card allowing you to focus on your core business. 

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

<a name="puchasing_options"></a>
# Understanding Gift Card Purchasing Options #

After opening and funding your Tango Card account, then you are ready to begin using the Tango Card Service API to access your account for getting available balance and for purchasing gift cards.

When you are ready to purchase a card, the Tango Card Service API has several options:

<dl>
    <dt>
    <a name="puchasing_options_distribution"></a>
    Distribution of Digital Gift Cards - parameter <code>tcSend</code> - boolean - <b>required</b></dt>
    <dd>
        Through the Tango Card Service API you can purchase Tango Card gift cards with your choice of delivery:
        <ul>
            <li><code>tcSend = true</code> - Have Tango Card service send gift cards directly to recipients via email which will include live gift card codes.</li>
            <li><code>tcSend = false</code> - You take the returned live gift card codes for you to customize and redistribute.</li>
        </ul>
    </dd>
    
    <dt>
    <a name="puchasing_options_skus"></a>
    The Tango Card and other Retailer Brand Gift Cards SKUs - parameter <code>cardSKU</code> - string - <b>required</b></dt>
    <dd>The API is optimized for ordering the Tango Card, which is SKU <code>"tango-card"</code>.

    <br>If you have questions about potentially incorporating other brands or digital goods in your program, then please do contact us at <a href="mailto:sdk@tangocard.com?Subject=Tango Card Ruby SDK Question">sdk@tangocard.com</a>.
    </dd>
    
    <dt>
    <a name="puchasing_options_denominations"></a>
    Gift Card Denominations - parameter <code>cardValue</code> - integer - <b>required</b></dt>
    <dd>Each gift card SKU has it own allowed set of denominations that can to assigned to parameter <code>cardValue</code>.
    <br/>For SKU <code>"tango-card"</code>, the available denomination in cents is between <code>1</code> ($0.01) to <code>100000</code> ($1000.00).
    <br/>To find out about other available denominations for potentially incorporating other SKUs that can be assigned to parameter <code>cardValue</code>, then please do contact us at <a href="mailto:sdk@tangocard.com?Subject=Tango Card Ruby SDK Question">sdk@tangocard.com</a>.
    </dd>
    
    <dt>
    <a name="puchasing_options_templates"></a>
    The Tango Card and custom Company Email Templates - parameter <code>companyIdentifier</code> - string - <b>optional</b></dt>
    <dd>If you choose to have the Tango Card Service API send digital gift cards by setting <code>tcSend</code> to <code>true</code>, then by default the gift card information within a Tango Card email template.
    <br>If you prefer to have the Tango Card Service API send the gift card information with a custom email template (with your own branding), then please do contact us at <a href="mailto:sdk@tangocard.com?Subject=Tango Card Ruby SDK Question">sdk@tangocard.com</a>.
    </dd>
</dl>

<a name="sdk_support"></a>
# Tango Card Ruby SDK and Service API Support #
If you have any questions with the Tango Card Ruby SDK or our Service API, please contact us at <a href="mailto:sdk@tangocard.com?Subject=Tango Card Ruby SDK Question">sdk@tangocard.com</a>.

If you have any issues using this SDK, such as bugs or change requests, then please do <a href="https://github.com/tangocarddev/TangoCard_Ruby_SDK/issues?state=open" target="_blank">Open Issue</a> in this repository.

<a name="sdk_support_resolve"></a>
## Resolving Issues ##

To expidite any issues you might be experiencing with our `Tango Card Service API` or our `Tango Card SDKs`, gather as much information by using the following two resolution approaches, and include the results when you contact us through <a href="mailto:sdk@tangocard.com?Subject=Tango Card C#/.NET 4.0 SDK Question">sdk@tangocard.com</a>.

<a name="sdk_support_resolve_fiddler_2"></a>
### Resolving Issues using Fiddler 2 ###

The best way to resolve any issues that pertain to using our Tango Card SDKs or our Tango Card Service API is by using this freely available tool <a href="http://www.fiddler2.com/fiddler2/" target="_blank">`Fiddler 2 - Web Debugging Proxy`</a>, and providing us with the raw request and response bodies using its `Inspectors` tab feature.

Using `Fiddler 2` will provide us with the most complete detail and the fastest response from Tango Card by understanding if there is an issue on how a request was presented to our service, or if it is an issue with our service on how we replied to your request.

#### Fiddler 2 Example - Raw Request from Client - Get Available Balance ####

```Text
POST https://int.tangocard.com/Version2/GetAvailableBalance HTTP/1.1
Accept: application/json, text/javascript, */*; q=0.01
Accept-Language: en-us
Content-Type: application/json; charset=UTF-8
Accept-Encoding: gzip, deflate
User-Agent: Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)
Host: int.tangocard.com
Content-Length: 69
Connection: Keep-Alive
Cache-Control: no-cache
 
{"username":"third_party_int@tangocard.com","password":"integrateme"}
```
 
#### Fiddler 2 Example - Raw Response from Service - Get Available Balance ####

```Text
HTTP/1.1 200 OK
Date: Wed, 26 Sep 2012 04:30:36 GMT
Server: Apache/2.2.22 (Ubuntu)
X-Powered-By: PHP/5.3.10-1ubuntu3.3
Access-Control-Allow-Origin: *
Content-Length: 68
Connection: close
Content-Type: application/json
 
{"responseType":"SUCCESS","response":{"availableBalance":873431432}}
```

<a name="sdk_support_resolve_jquery_diagnostic_tool"></a>
### Resolving Issues using Tango Card Diagnostic Tool ###

Within our <a href="https://github.com/tangocarddev/TangoCard_jQuery_Plugin" target="_blank"><code>Tango Card jQuery Plugin</code></a>, there is diagnostic tool which communicates with `Tango Card Service API` through <a href="http://api.jquery.com/jQuery.ajax/" target="_blank"><code>jQuery.ajax()</code></a> calls. It is useful for making raw calls to our service.

<a name="sdk_overview"></a>
# SDK Overview #

The Tango Card Ruby SDK is a wrapper around the <a href="https://github.com/tangocarddev/General/blob/dev/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>.

As such, it has two primary types of objects, Requests and Responses; which are handled by a wrapper class `TangoCardSdk::TangoCardServiceApi`.

The wrapper class `TangoCardSdk::TangoCardServiceApi` currently handles the following static methods:
<dl>
    <dt>bool GetAvailableBalance()</dt>
    <dd>- Gather the currently available balance for provided user within their www.tangocard.com account.</dd>

    <dt>bool PurchaseCard()</dt>
    <dd>- Purchase a gift card using funds from user's www.tangocard.com account.</dd>
</dl>

![Tango Card Service Api](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocardserviceapi.png "Tango Card Service API")

<a name="sdk_requirements"></a>
# SDK Requirements #

The provided built RubyGem file labeled `tangocard_sdk-<current-version>.gem` has been tested within both `Ruby 1.9.3` and `Ruby 1.8.7`.

Using this build requires RubyGem installs of <code>json</code> and <code>inifile</code>.

<a name="sdk_requirements_environment"></a>
## Gem Environment Requirements ##

<ul>
    <li><a href="http://www.ruby-lang.org/en/downloads/" target="_blank">Ruby 1.9.3</a></li>
    <li><a href="http://rubyinstaller.org/downloads/" target="_blank">Development Kit (DevKit)</a>
        <ul>
            <li>Required for installing <code>json</code> and <code>inifile</code> gems.
            <li><a href="http://socrateos.blogspot.com/2011/03/installing-ruby-devkit-for-windows.html" target="_blank">Installing Ruby DevKit for Windows</li>
        </ul>
    </li>
    <li><code>gem install json</code></li>
    <li><code>gem install inifile</code></li>
    <li><b><code>gem install tangocard_sdk-[current version].gem</code></b></li>
</ul>

<a name="sdk_requirements_install"></a>
## Gem Installation ##

Use [RubyGem](http://rubygems.org/) to install Tango Card Ruby SDK Gem file `tangocard_sdk-[current version].gem`. To assure that you install the correct `tangocard_sdk` gem, uninstall all existing instances within your local ruby environment. Here is an example recommended installation:

```Text
    > gem uninstall -Iax tangocard_sdk
    Successfully uninstalled tangocard_sdk-1.0.10
    
    > gem install tangocard_sdk-1.0.10.gem
    Successfully installed tangocard_sdk-1.0.10
    
    > gem query -n "tangocard_sdk"
    *** LOCAL GEMS ***
    tangocard_sdk (1.0.10)
```

<a name="tango_card_service_api_requests"></a>
# Tango Card Service API Requests #

With the <a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>, every request has a corresponding success-case response object. There are also several failure-case response objects which are shared between calls. The specifics of the request and response objects will be described in <a href="#sdk_methods">SDK Methods</a>.

<a name="tango_card_service_api_endpoints"></a>
## Tango Card Service API Endpoints ##

Available are two endpoints that provide the <a href="https://github.com/tangocarddev/General/blob/master/Tango_Card_Service_API.md" target="_blank">Tango Card Service API</a>, as defined by `TangoCard::TangoCardServiceApiEnum`:
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

<a name="sdk_methods"></a>
# SDK Methods #

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
    <dt>[IN] * enumTangoCardServiceApi</dt>
    <dd><code>TangoCardServiceApiEnum</code> - <b>required</b> - <code>INTEGRATION</code> or <code>PRODUCTION</code></dd>

    <dt>[IN] * username</dt>
    <dd>string - <b>required</b> - user account's username registered within Tango Card production website (https://www.tangocard.com).</dd>

    <dt>[IN] * password</dt>
    <dd>string - <b>required</b> - user account's password registered within Tango Card production website (https://www.tangocard.com)</dd>
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
            "Bill Company",                         # giftFrom
            nil,                                    # companyIdentifier
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
    <dt>[IN] * enumTangoCardServiceApi</dt>
    <dd><code>TangoCardServiceApiEnum</code> - <b>required</b> - <code>INTEGRATION</code> or <code>PRODUCTION</code></dd>

    <dt>[IN] * username</dt>
    <dd>string - <b>required</b> - user account's username registered within Tango Card production website (https://www.tangocard.com).</dd>
    <dt>[IN] * password</dt>
    <dd>string - <b>required</b> - user account's password registered within Tango Card production website (https://www.tangocard.com)</dd>

    <dt>[IN] * cardSku</dt>
    <dd>string - <b>required</b> - The SKU of the card to purchase. The SKU for the Tango Card is "tango-card". See: <a href="#puchasing_options_skus">Purchase Option of Gift Card Brands</a></dd>

    <dt>[IN] * cardValue</dt>
    <dd>integer - <b>required</b> - The value of the card to purchase in cents (100 = $1.00). See: <a href="#puchasing_options_denominations">Purchase Option for Denominations</a></dd>

    <dt>[IN] * tcSend</dt>
    <dd>boolean - <b>required</b> - Determines if Tango Card Service will send an email with gift card information to recipient. See: <a href="#puchasing_options_distribution">Purchase Option for Distribution</a>.</dd>

    <dt>[IN] * recipientName</dt>
    <dd>string (length 1 - 255) or null - <b>required</b> if parameter <code>tcSend</code> is <code>true</code>, else ignored - The name of the person receiving the card.</dd>

    <dt>[IN] * recipientEmail</dt>
    <dd>string (length 3 - 255) or null - <b>required</b> if parameter <code>tcSend</code> is <code>true</code>, else ignored - The email address of the person receiving the card.</dd>

    <dt>[IN] * giftMessage</dt>
    <dd>string (length 1 - 255) or null - <b>required</b> if parameter <code>tcSend</code> is <code>true</code>, else ignored - A message from the sender of the card to the recipient. May be null, but must exist if tcSend = true.</dd>

    <dt>[IN] giftFrom</dt>
    <dd>string (length 1 - 255) or null - <b>optional</b> if parameter <code>tcSend</code> is <code>true</code>, else ignored - The name of the person sending the card.</dd>

    <dt>[IN] companyIdentifer</dt>
    <dd>string (length 1 - 255) or null - <b>optional</b> if parameter <code>tcSend</code> is <code>true</code>, else ignored - The email-template identifier. Ignored or value <code>null</code> will use the Tango Card Email Template. See: <a href="#puchasing_options_templates">Purchase Option for Email Templates</a>.</dd>
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

<a name="sdk_error_handling"></a>
# SDK Error Handling #

The Tango Card Ruby SDK handles its errors by throwing the following exceptions:

* Custom `TangoCardSdk::TangoCardServiceException` is thrown when the `Tango Card Service API` return a `Failure Response` for a given `Request`.
* Custom `TangoCardSdk::TangoCardSdkException` is thrown when the Tango Card SDK has detected an error within its code, regardless of any given Request.
* Standard `\InvalidArgumentException` is thrown due to parameter entry errors.

![Tango Card SDK Exceptions](https://github.com/tangocarddev/TangoCard_Ruby_SDK/raw/master/doc/images/tangocard_sdk_exceptions.png "Tango Card SDK Exceptions")

<a name="service_failure_responses"></a>
## Service Failure Responses ##

The `Tango Card Service API` handles its errors by returning the following failure responses as enumerated by `TangoCardSdk::ServiceResponseEnum`:

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
* lib\tangocard\config\tc_sdk_config.ini
* lib\tangocard\sdk\tangocard_service_api.rb
* lib\tangocard\sdk\common\helper.rb
* lib\tangocard\sdk\common\sdk_config.rb
* lib\tangocard\sdk\common\tangocard_sdk_exception.rb
* lib\tangocard\sdk\request\base_request.rb
* lib\tangocard\sdk\request\get_available_balance_request.rb
* lib\tangocard\sdk\request\purchase_card_request.rb
* lib\tangocard\sdk\response\base_response.rb
* lib\tangocard\sdk\response\service_response_enum.rb
* lib\tangocard\sdk\response\failure\failure_response.rb
* lib\tangocard\sdk\response\failure\insufficient_funds_response.rb
* lib\tangocard\sdk\response\failure\insufficient_inventory_response.rb
* lib\tangocard\sdk\response\failure\invalid_credentials_response.rb
* lib\tangocard\sdk\response\failure\invalid_input_response.rb
* lib\tangocard\sdk\response\failure\system_error_response.rb
* lib\tangocard\sdk\response\success\get_available_balance_response.rb
* lib\tangocard\sdk\response\success\purchase_card_response.rb
* lib\tangocard\sdk\response\success\success_response.rb
* lib\tangocard\sdk\service\service_proxy.rb
* lib\tangocard\sdk\service\tangocard_service_api_enum.rb
* lib\tangocard\sdk\service\tangocard_service_exception.rb
* lib\tangocard\ssl\cacert.pem

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

The `examples` sub-directory contains full "start to finish" store front examples of all of the supported Tango Card Ruby SDK methods. This includes catching all of the possible failure modes, etc. 

<a name="examples_config"></a>
### Example Configuration: `config/api_config.api` ###

When running `examples`, it is pulling configuration values from `config/api_config.api` file. This file can be modified to test against other accounts (`username` and `password`), recipients (`recipientEmail`), card SKU (`cardSku`) and denomination (`cardValue`)

<dl>
    <dt><code>app_tango_card_service_api</code></dt>
    <dd>Available Tango Card Service API endpoints are INTEGRATION and PRODUCTION.<br>Default value: <code>INTEGRATION</code><dd>

    <dt><code>app_username</code></dt>
    <dd>Login `username` credentials for to chosen `app_tango_card_service_api`.<br>Default INTEGRATION `username`: <code>third_party_int@tangocard.com</code><dd>

    <dt><code>app_password</code></dt>
    <dd>Login `password` credentials for to chosen `app_tango_card_service_api`.<br>Default INTEGRATION `password`: <code>integrateme</code><dd>

    <dt><code>app_card_sku</code></dt>
    <dd>Gift Card SKU<br>Default SKU: <code>tango-card</code><dd>

    <dt><code>app_card_value</code></dt>
    <dd>Gift Card Value in Cents (100 = $1.00)<br>Default Value: <code>100</code><dd>

    <dt><code>app_recipient_email</code></dt>
    <dd>Gift Card Recipient's Email Address<br>Default SKU: <code>sally@example.com</code><dd>
</dl>

<a name="examples_success"></a>
### Success Request Examples: `tangocard_store_example.rb` ###

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
=== Begin Examples ===
        Tango Card Ruby SDK version: '1.0.10'
        Example App Config File: './config/app_config.ini'

==============================
= Tango Card Ruby SDK Example =
==============================

        Success - GetAvailableBalance - Initial
        'third_party_int@tangocard.com': Available balance: $8,733,778.32.

        Success - PurchaseCard Confirmation with Email Delivery
        Recipient Email:   'sally@example.com'
        Gift Card SKU:     'tango-card'
        Gift Card Value:    100 (cents)
        Reference Order ID: 112-09214333-27
        Card Token:         5064a5e7a67759.43161949
        Card Number:        7001-1040-0143-4184-413
        Card Pin:           960802

        Success - PurchaseCard Confirmation without Email Delivery
        Gift Card SKU:     'tango-card'
        Gift Card Value:    100 (cents)
        Reference Order ID: 112-09214334-27
        Card Token:         5064a5e8769022.73062233
        Card Number:        7001-4040-0104-4352-615
        Card Pin:           789450

        Success - GetAvailableBalance - Concluding
        'third_party_int@tangocard.com': Available balance: $8,733,776.32.

==============================
=   The End                  =
==============================
```

<a name="examples_failures"></a>
### Failure Request Examples: `tangocard_failures_example.rb` ###

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
    = Tango Card Ruby SDK Example =
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

* `unittests\unittests_tangocard.rb`
* `unittests\unittest_getavailablebalance.rb`
* `unittests\unittest_purchasecard.rb`
* `unittests\unittest_sdk_config.rb`
* `unittests\unittest_service_api_enums.rb`
* `unittests\unittest_service_response_enums.rb`

### Running Ruby Unit Tests ###

Unittests for this SDK can be run from the command line. File `unittests\unittests_tangocard.rb` is a suite of all available unit tests.

#### `unittests\unittests_tangocard.rb` ####

```Text
    > ruby -w unittests\unittests_tangocard.rb
    Run options:

    # Running tests:

    ..................

    Finished tests in 8.877508s, 2.0276 tests/s, 7.2092 assertions/s.

    18 tests, 64 assertions, 0 failures, 0 errors, 0 skips
```

<a name="sdk_development_environment"></a>
# SDK Development Environment #

This Ruby SDK was built using:

* [eclipse Juno](http://www.eclipse.org/juno/)
* [Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/)
* [Dynamic Languages Toolkit - Ruby Development Tools](http://www.eclipse.org/dltk/)

<a name="license"></a>
# License #

The Tango Card Ruby SDK is free to use, given some restrictions. Please see the <a href="https://github.com/tangocarddev/TangoCard_Ruby_SDK/blob/master/LICENSE.md" target="_blank">LICENSE</a> file for details.

<a name="contact_us"></a>
# Contact Us #
If you have any questions about using this SDK, please do contact us at <a href="mailto:sdk@tangocard.com?Subject=Tango Ruby SDK Question">sdk@tangocard.com</a> 

To learn more about Tango Card integration solutions, call 1.877.55.TANGO.
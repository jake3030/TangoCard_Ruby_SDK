TangoCard Ruby SDK - Ruby 1.9
===

# Table of Contents #
<ul>
    <li><a href="#introduction">Introduction</a>
        <ul>
            <li><a href="#Incorporate_tango_card">Incorporate Tango Card Gift Cards</a></li>
            <li><a href="#open_account">Open Tango Card Account</a></li>
            <li><a href="#sdk_support">SDK Support</a></li>
        </ul>
    </li>
    <li><a href="#sdk_overview">SDK Overview</a></li>
    <li><a href="#sdk_requirements">SDK Requirements</a></li>
    <li><a href="#tango_card_service_requests">Tango Card Service Requests</a>
        <ul>
            <li><a href="#tango_card_service_api_endpoints">Tango Card Service API Endpoints</a></li>
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
            <li><a href="#doc">doc</a></li>
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

<a name="Incorporate_tango_card"></a>
## Incorporate Tango Card Gift Cards  ##
Tango Card’s Extend SDKs allow you to quickly incorporate the innovative Tango Card gift card into your reward, loyalty, and engagement applications. Tango Card is the “exactly what you want” gift card and allows the recipient to use their value exactly how they want – they can select a premier gift card, they can divide their value among Brands, they can use some today and save the rest for another day. They can also donate to a non-profit organization. Tango Card value can be used via the web or from almost any mobile device. There are no fees or expiration dates of any kind. It’s great for the recipient, and even better for you because it is an entire gift card program delivered in one card allowing you to focus on your core business. Tango Card solutions are already used by Microsoft Bing, FedEx, Extole, Plink, beintoo, Lead Valu, Getty Images, and many others. 

<a name="open_account"></a>
## Open Tango Card Account ##
Within minutes of download, our Extend SDKs will allow you to check the balance on your pre-funded Tango Card account, send Tango Card gift cards directly to recipients via email, and return live gift card codes for you to customize and redistribute. With Tango Card and Retailer Brand approval, there is also the ability to order retailer Brand gift cards via the SDK. Simply use the supplied credentials to see how easy it is. When you’re ready to move into production, sign up for an account at https://www.tangocard.com/user/register. Use these credentials in your SDK and you’re done!

<a name="sdk_support"></a>
## SDK Support ##
If you have any questions, please contact us at sdk@tangocard.com.

<a name="sdk_overview"></a>
# SDK Overview #

The Tango Card Ruby SDK is a wrapper around the Tango Card Service API. environments. As such, it has two primary types of objects, Requests and Responses; which are handled by a wrapper class `TangoCardSdk::TangoCardServiceApi`.

The wrapper class `TangoCardSdk::TangoCardServiceApi` currently handles the following static methods:
<dl>
    <dt>bool GetAvailableBalance()</dt>
    <dd>- Gather the currently available balance for provided user within their www.tangocard.com account.</dd>

    <dt>bool PurchaseCard()</dt>
    <dd>- Purchase a gift card using funds from user's www.tangocard.com account.</dd>
</dl>

![Tango Card Service Api](https://github.com/tangocarddev/TangoCard_PHP_SDK/raw/dev/5.3/doc/images/tangocardserviceapi.png "Tango Card Service Api")

<a name="sdk_requirements"></a>
# SDK Requirements #

* [PHP 5.3+](http://www.php.net/releases/5_3_0.php) because it uses [namespaces](http://php.net/manual/en/language.namespaces.php).
* [cURL PHP Extension](http://www.php.net/manual/en/curl.setup.php)


<a name="tango_card_service_requests"></a>
# Tango Card Service Requests #

The Tango Card SDK, every Request has a corresponding success-case Response object.

<a name="tango_card_service_api_endpoints"></a>
## Tango Card Service API Endpoints ##

Available are two endpoints that provide the Tango Card Service API, as defined by `enum TangoCardSdk::TangoCardServiceApiEnum` :
* `INTEGRATION` - Expected to be used for development and testing purposes.
* `PRODUCTION` - Performs actual card purchase requests.

Requests are secure HTTP POST using SSL.

<a name="get_available_balance"></a>
## Get Available Balance ##

![Tango Card Service API - GetAvailableBalance()](https://github.com/tangocarddev/TangoCard_PHP_SDK/raw/dev/5.3/doc/images/tangocardserviceapi_getavailablebalance.png "Tango Card Service API - GetAvailableBalance()")

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
```

Assuming success, the `out` parameter `$response` will be an instance of `TangoCardSdk::GetAvailableBalanceResponse`.

### Method TangoCardSdk::TangoCardServiceApi.get_available_balance() ###

#### Parameters ####
<dl>
  <dt>TangoCardServiceApiEnum enumTangoCardServiceApi</dt>
  <dd>- <code>INTEGRATION</code> or <code>PRODUCTION</code></dd>
  
  <dt>string $username</dt>
  <dd>- User email address, and the SDK Integration test username is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_username</code></dd>

  <dt>string $password</dt>
  <dd>- User password, and the SDK Integration test password is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_password</code></dd>
</dl>

### `TangoCardSdk::GetAvailableBalanceResponse` Properties ###

<dl>
  <dt>int getAvailableBalance</dt>
  <dd>- Returns available balance of username's account in cents: 100 is $1.00 dollar.</dd>
</dl>

<a name="purchase_card"></a>
## Purchase Card ##

![Tango Card Service API - PurchaseCard()](https://github.com/tangocarddev/TangoCard_PHP_SDK/raw/dev/5.3/doc/images/tangocardserviceapi_purchasecard.png "Tango Card Service API - PurchaseCard()")

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
            "Bill Example",                         # giftFrom
            "Tango Card PHP SDK Example"            # companyIdentifier
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
```

Assuming success, the `out` parameter `$response` will be an instance of `TangoCardSdk::PurchaseCardResponse`.

### Method TangoCardSdk::TangoCardServiceApi.PurchaseCard() ###

#### Parameters ###
<dl>
  <dt>TangoCardServiceApiEnum $enumTangoCardServiceApi</dt>
  <dd>- <code>INTEGRATION</code> or <code>PRODUCTION</code></dd>

  <dt>string $username</dt>
  <dd>- User email address, and a SDK Integration test username is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_username</code></dd>

  <dt>string $password</dt>
  <dd>- User password, and a SDK Integration test password is defined within configuration file <code>config\app_config.ini</code> in setting <code>app_password</code></dd>

  <dt>string $cardSku</dt>
  <dd>- Card brand request, and the Tango Card brand's card sku *tango-card* is defined in configuration file <code>config\app_config.ini</code> within <code>app_card_sku</code></dd>

  <dt>int $cardValue</dt>
  <dd>- Card value in cents; a value of 100 (cent) is $1.00 dollar card. Minimum value is 1 (cent).</dd>

  <dt>boolean $tcSend</dt>
  <dd>- Tango Card Service delivers by Email requested card. Set to <code>true</code> for email delivery, and <code>false</code> for no delivery.</dd>

  <dt>string $recipientName</dt>
  <dd>- Full name of recipient receiving gift card. Set this parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>string $recipientEmail</dt>
  <dd>- Valid email address of recipient receiving gift card. Set this parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>string $giftMessage</dt>
  <dd>- [Optional] Gift message to be applied to gift card's email. Set this optional parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) or null if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>string $giftFrom</dt>
  <dd>- Full name of giver of gift card. Set this parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>
  
  <dt>string $companyIdentifier</dt>
  <dd>- The name of the parent company providing this gift. Set this optional parameter with a value of either a string (length minimum 1 character to maximum of 255 characters) if <code>tcSend</code> is <code>true</code>, or <code>null</code> if parameter <code>tcSend</code> is <code>false</code>.</dd>

  <dt>TangoCardSdk::PurchaseCardResponse $response</dt>
  <dd>- This <i>out</i> parameter will provide a valid success response object if this method returns <code>true</code> upon success.</dd>
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

![Tango Card SDK Exceptions](https://github.com/tangocarddev/TangoCard_PHP_SDK/raw/dev/5.3/doc/images/tangocard_sdk_exceptions.png "Tango Card SDK Exceptions")

<a name="service_failure_responses"></a>
## Service Failure Responses ##

A service will return the following failure responses as enumerated by `TangoCardSdk::Response\ServiceResponseEnum`:

<table>
    <tr><th>Failure</th><th>Failure Reponse Type</th><th>Failure Response Object</th></tr>
    <tr><td>Insufficient Funds</td><td>INS_FUNDS</td><td>`TangoCardSdk::Response\Failure\InsufficientFundsResponse`</td></tr>
    <tr><td>Insufficient Inventory</td><td>INS_INV</td><td>`TangoCardSdk::Response\Failure\InsufficientInventoryResponse`</td></tr> 
    <tr><td>Invalid Credentials</td><td>INV_CREDENTIAL</td><td>`TangoCardSdk::Response\Failure\InvalidCredentialsResponse`</td></tr> 
    <tr><td>Invalid Input</td><td>INV_INPUT</td><td>`TangoCardSdk::Response\Failure\InvalidInputResponse`</td></tr>
    <tr><td>System Failure</td><td>SYS_ERROR</td><td>`TangoCardSdk::Response\Failure\SystemFailureResponse`</td></tr>
</table>

Each of the aforementioned `Failure Responses` contains details as to the reason that the `Tango Card Service API` did not perform provided `Request`.

![Tango Card SDK Service Response Failures](https://github.com/tangocarddev/TangoCard_PHP_SDK/raw/dev/5.3/doc/images/tangocard_sdk_service_failure_response.png "Tango Card SDK Service Response Failures")

The details of these service failure responses are embedded and thrown within `TangoCardSdk::TangoCardServiceException`

### Expected Failure Responses for Specific Requests ###

Each Request will have the following possible Failure Responses as a property value within `TangoCardSdk::TangoCardServiceException.getResponse()`:

<table>
    <tr><th>Request</th><th>Possible Failure Responses</th></tr>
    <tr>
        <td>`GetAvailableBalanceRequest`</td>
        <td>
            <table>
                <tr><th>Failure Reponse Type</th><th>Failure Response</th></tr>
                <tr><td>INV_CREDENTIAL</td><td>`InvalidCredentialsResponse`</td></tr> 
                <tr><td>SYS_ERROR</td><td>`SystemFailureResponse`</td></tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>`PurchaseCardRequest`</td>
        <td>
            <table>
                <tr><th>Failure Reponse Type</th><th>Failure Response</th></tr>
                <tr><td>INS_FUNDS</td><td>`InsufficientFundsResponse`</td></tr>
                <tr><td>INS_INV</td><td>`InsufficientInventoryResponse`</td></tr> 
                <tr><td>INV_CREDENTIAL</td><td>`InvalidCredentialsResponse`</td></tr> 
                <tr><td>INV_INPUT</td><td>`InvalidInputResponse`</td></tr>
                <tr><td>SYS_ERROR</td><td>`SystemFailureResponse`</td></tr>
            </table>
        </td>
    </tr>
</table>

<a name="sdk_error_responses"></a>
## SDK Error Responses ##

This SDK throws it own custom exception `TangoCardSdk::TangoCardSdkException` when detecting errors that pertain to itself.

![Tango Card SDK Error Detection](https://github.com/tangocarddev/TangoCard_PHP_SDK/raw/dev/5.3/doc/images/tangocard_sdk_error_detected.png "Tango Card SDK Error Detection")

<a name="handling_errors"></a>
## Handling Errors ##

Wrap every Tango Card request call within a try/catch block, followed by first catching `TangoCardSdk::TangoCardServiceException`, then by `TangoCardSdk::TangoCardSdkException`, and finally by standard `Exception`.

```ruby

require 'rubygems'
require 'tangocard_sdk'

    /* ... */
    
    try
    {
        $enumTangoCardServiceApi = TangoCardSdk::TangoCardServiceApiEnum::INTEGRATION;
        $username = "burt@example.com";
        $password = "password";
        $response = null;
    
        $response = null;
        if ( TangoCardSdk::TangoCardServiceApi::GetAvailableBalance(
                $enumTangoCardServiceApi,
                $username, 
                $password,
                $response
                ) 
            && (null != $response)
        ) {
            // Do Stuff ... //
        }
    }
    rescue TangoCardSdk::TangoCardServiceException => e
    {
        echo "\n=== Tango Card Service Failure ===";        
        echo "\nFailure response type: " . $ex->getResponseType();
        echo "\nFailure response:      " . $ex->getMessage();
    }
    rescue TangoCardSdk::TangoCardSdkException => e
    {
        echo "\n=== Tango Card SDK Failure ===\n\n";
        echo sprintf("%s :: %s", get_class($ex), $ex->getMessage());
    }
    rescue Exception => e
    {
        echo "\n=== Unexpected Error ===\n\n";
        echo sprintf("%s :: %s", get_class($ex), $ex->getMessage());
    }
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
    <dd>- SDK configuration file referenced by `TangoCardSdk::SdkConfig.php`. **DO NOT MODIFY**</dd>
    
    <dt>lib\TangoCard\ssl\cacert.pem</dt>
    <dd>- The root-CA certificates for the Tango Card prodcution and integration endpoints (issued by Thawte), so that machines that do not have them will still be able to make use of the SDK. This is file referenced by `TangoCardSdk::ServiceProxy.php`</dd>
</dl>

<a name="doc"></a>
## doc ##

The `doc\phpdoc\index.html` accesses the up-to-date [phpdoc](http://www.phpdoc.org/) generated documentation for the classes (and functions) that are included in the SDK.

<a name="examples"></a>
## examples ##

The examples sub-directory contains full "start to finish" examples of all of the supported methods. This includes catching all of the possible failure modes, etc. 

### TangoCard_Store_Example.php ###

This is a complete example of requesting available balance and purchasing Tango Cards.

1. Request latest available balance
2. Purchase $1.00 Tango Card for Email Delivery
3. Purchase $1.00 Tango Card without Email Delivery
4. Request updated available balance

#### Command Line ####

This example is intended to be run from the command line:
```Text
    $ php examples/TangoCard_Store_Example.php
```

#### Example Command Line Run ####

```Text
    ==============================
    = Tango Card PHP SDK Example =
    ==============================

    Success - GetAvailableBalance - Initial
            I have an available balance of $8,755,453.19 dollars.

    Success - PurchaseCard - Delivery
            Reference Order ID: 112-07212535-31
            Card Token:         50172e468bc842.39194333
            Card Number:        7001-0040-0122-9705-918
            Card Pin:           896370

    Success - PurchaseCard - No Delivery
            Reference Order ID: 112-07212536-31
            Card Token:         50172e47475ec1.97325571
            Card Number:        7001-4040-0123-1510-519
            Card Pin:           783977

    Success - GetAvailableBalance - Concluding
            I have an updated balance of $8,755,451.19 dollars.


    ==============================
    =   The End                  =
    ==============================
```

### TangoCard_Failures_Example.php ###

Example of how the SDK handles various failure responses, such as:
* Insufficient Funds
* Invalid Credentials
* Invalid Input

#### Command Line ####

This example is intended to be run from the command line:

```Text
    $ php examples/TangoCard_Failures_Example.php
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
    Available Balance: 0
    Order Cost       : 100

    ======== End Purchase Card with Insufficient Funds ========

    ==============================
    =   The End                  =
    ==============================
```
<a name="unittests"></a>
## unittests ##

The SDK's unittests have been written to use [PHPUnit](http://www.phpunit.de).

* `UnitTest_GetAvailableBalance.php`
* `UnitTest_PurchaseCard.php`

### Running PHPUnit Tests ###

Installation of [PHPUnit](http://www.phpunit.de) is required to run these from command-line.

#### PHPUnit UnitTest_GetAvailableBalance.php ####

```Text
    >phpunit unittests\UnitTest_GetAvailableBalance.php
        PHPUnit 3.6.11 by Sebastian Bergmann.

        ...

        Time: 4 seconds, Memory: 4.00Mb

        OK (3 tests, 15 assertions)
```

#### PHPUnit UnitTest_PurchaseCard.php ####

```Text
    >phpunit unittests\UnitTest_PurchaseCard.php
        PHPUnit 3.6.11 by Sebastian Bergmann.

        ......

        Time: 6 seconds, Memory: 4.00Mb

        OK (6 tests, 52 assertions)
```

<a name="sdk_development_environment"></a>
# SDK Development Environment #

This PHP SDK project was built using:

* [eclipse Helios](http://www.eclipse.org/helios/)
* [PHP 5.3] (http://www.php.net/downloads.php)
* [PHPUnit 3.6](http://www.phpunit.de/manual/current/en/)

<a name="license"></a>
# License #

The Tango Card PHP SDK is free to use, given some restrictions. Please see the LICENSE file for details.

<a name="production_deployment"></a>
# Production Deployment #

When you're ready to go live, email [sales@tangocard.com](mailto:sales@tangocard.com). We'll get you set up with a contract and everything else you need, including linking your account so that transactions served via your integration will draw down on your Tango Card account. 

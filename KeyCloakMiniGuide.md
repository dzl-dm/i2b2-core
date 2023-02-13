# KeyCloak mini-guide - configuration for I2B2
Here, we do not aim to document KeyCloak in depth, only provide some rough instructions on setting up a client which is compatible with i2b2's SAML supported SSO.

## Pre-requisites
* A functional deployment of KeyCloak - accessible via HTTPS over the internet
* A basic understanding of SSO principles (eg IDP and SP)
* A basic understanding of realms

## Setup an i2b2 client on KeyCloak
This is a brief guide to setup the "client" on KeyCloak to be compatible with i2b2. You may apply this in an existing realm or new realm depending on your preference.

In your realm, select "Clients" from the left sidebar and begin by choosing "Create client"
* Fill in the initial fields
    * Client type: SAML
    * Client ID: Can be anything, but a good standard to follow is `<application scheme and hostname>/saml-sp` (eg https://my-application.example.com/saml-sp)
    * Name: As you like, something short and clear
    * Description: A longer description for the client
* Now you'll be at the main configuration page for this new client. Some things to edit:
    * Root URL: Should be the application server address (eg https://my-application.example.com/)
    * Home URL: Should be the full application address (eg https://my-application.example.com/webclient/)
    * Master SAML Processing URL: Same as "Home URL"
* Under the "Keys" tab, there is nothing to change, but you will want to export the data for use in the application config (see below)
* Under the "Client scopes" tab, there should be a `<client-id>-dedicated` scope, we must configure the parameter mappings here
    * Configure new mapper/Add mapper -> By configuration for each parameter:
    * username -> User Property
        * Name: username
        * Property: Username
        * Friendly Name: Username
        * SAML Attribute Name: username
        * Property: Basic
    * Given name -> User Property
        * Name: i2b2-givenName
        * Property: firstName
        * Friendly Name: 
        * SAML Attribute Name: givenName
        * Property: Basic
    * Last name -> User Property
        * Name: Last name
        * Property: lastName
        * Friendly Name: i2b2 sn 
        * SAML Attribute Name: sn
        * Property: Basic
    * Display name -> User Property
        * Name: i2b2-display-name
        * Property: firstName
        * Friendly Name: 
        * SAML Attribute Name: displayName
        * Property: Basic
    * E-Mail address -> User Property
        * Name: emailAddress
        * Property: email
        * Friendly Name: 
        * SAML Attribute Name: email
        * Property: Basic
    * EPPN -> User Property
        * Name: i2b2-eduPersonPrincipalName
        * Property: Username
        * Friendly Name: 
        * SAML Attribute Name: eduPersonPrincipalName
        * Property: Basic
    * EPPN -> Hardcoded attribute
        * Name: i2b2-eduPersonAffiliation
        * Friendly Name: 
        * SAML Attribute Name: eduPersonAffiliation
        * Property: Basic
        * Attribute value: PA

Then the KeyCloak system should be ready to receive SAML login requests from i2b2.

## Extract details for i2b2
In order to configure i2b2 as the SP (Service Provider), we need a few small pieces of information and a few files...

* Login to the KeyCloak admin interface and ensure you have the correct realm selected (where you have the i2b2 client setup and are managing users).

### Required information
* sso_entity_id = Two parts:
    * myrealm = the active realm in the dropdown on the left sidebar. The ID is usually the same, but to be sure, you can view this under "Realm settings"
    * idp-hostname = You can take the URL in your browsers address bar. This is the host portion after the first double // and before the first single /
* app_entity_id = The KeyCloak client id for i2b2
    * This is listed after following the "Clients" link in the left sidebar and is what was setup for the i2b2 application

### Required files
* idp-metadata.xml
    * Select "Realm settings" from the left sidebar
    * Under the sub-heading "Endpoints", select "SAML 2.0 Identity Provider Metadata"
    * Save this file as `i2b2-idp-metadata.xml`
* Export signing key and certificate:
    * Select "Clients" in the left menu and select the i2b2 client which has been setup (it is usually using the hostname where the i2b2 application is running)
    * Select the "Keys" tab
    * Ensure the "Client signature required" is active
    * Choose "Export" below the certificate string
        * Select "PCKS12" archive format
        * Fill the alias and passwords as you wish, remember them for the extraction process next
        * Clicking "Export" will download a file like "keystore.p12"
* Extracting the signing keys and certificates
    * On the CLI (Command line interface, a terminal), navigate to where your downloaded keystore is
    * Assuming a keystore called `keystore.p12`, run the following command (you will need open-ssl installed):
```sh
openssl pkcs12 -in keystore.p12 -out i2b2-sso-t1-cert.pem -clcerts -nokeys
openssl pkcs12 -in keystore.p12 -out i2b2-sso-t1-key.pem -nocerts -nodes
```
You'll be promted for the password you entered at exort time for both commands, then you have the key and certificate files which you need.

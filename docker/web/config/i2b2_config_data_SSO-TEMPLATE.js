{
    urlProxy: "index.php",
    urlFramework: "js-i2b2/",
    startZoomed: true,
    //-------------------------------------------------------------------------------------------
    // THESE ARE ALL THE DOMAINS A USER CAN LOGIN TO
    lstDomains: [
           {
                   name: "${ORGANISATION_NAME} (Single Sign-On)",
                   domain: "i2b2demo",
                   urlCellPM: "${ajp_proxy_url}",
                   allowAnalysis: false,
                   registrationMethod: "saml",
                   loginType: "federated",
                   showRegistration: false,
                   debug: false
           }
           ,
            {
                   name: "${ORGANISATION_NAME}",
                   domain: "i2b2demo",
                   urlCellPM: "${wildfly_scheme}://${wildfly_host}:${wildfly_port}/i2b2/services/PMService/",
                   allowAnalysis: false,
                   loginType: "local",
                   debug: false,
                   isSHRINE: false
            }
    ]
    //-------------------------------------------------------------------------------------------
}

{
    urlProxy: "index.php",
    urlFramework: "js-i2b2/",
    startZoomed: true,
    //-------------------------------------------------------------------------------------------
    // THESE ARE ALL THE DOMAINS A USER CAN LOGIN TO
    lstDomains: [
      //      {
      //              name: "i2b2demo_local",
      //              domain: "i2b2demo",
      //              urlCellPM: "${wildfly_scheme}://${wildfly_host}:${wildfly_port}/i2b2/services/PMService/",
      //              allowAnalysis: false,
      //              registrationMethod: "local",
      //              loginType: "local",
      //              showRegistration: true,
      //              debug: false,
      //      }
      //      ,
           {
                   name: "i2b2demo_saml",
                   domain: "i2b2demo",
                   urlCellPM: "${ajp_proxy_url}",
                   allowAnalysis: false,
                   registrationMethod: "saml",
                   loginType: "federated",
                   showRegistration: false,
                   debug: false,
           }
           ,
            {
                   name: "Local i2b2 data warehouse",
                   domain: "i2b2demo",
                   urlCellPM: "${wildfly_scheme}://${wildfly_host}:${wildfly_port}/i2b2/services/PMService/",
                   allowAnalysis: false,
                   debug: false,
                   isSHRINE: false
            }
    ]
    //-------------------------------------------------------------------------------------------
}

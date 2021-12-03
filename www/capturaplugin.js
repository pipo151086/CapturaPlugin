

 var exec = require('cordova/exec');

  /**
          * Constructor.
          *
          * @returns {CapturaPlugin}
          */
  function CapturaPlugin() {

             /**
              * Encoding constants.
              *
              * @type Object
              */
             this.Encode = {
                 TEXT_TYPE: "TEXT_TYPE",
                 EMAIL_TYPE: "EMAIL_TYPE",
                 PHONE_TYPE: "PHONE_TYPE",
                 SMS_TYPE: "SMS_TYPE"
                 //  CONTACT_TYPE: "CONTACT_TYPE",  // TODO:  not implemented, requires passing a Bundle class from Javascript to Java
                 //  LOCATION_TYPE: "LOCATION_TYPE" // TODO:  not implemented, requires passing a Bundle class from Javascript to Java
             };
  }

    exports.coolMethod = function (arg0, success, error) {
        exec(success, error, 'CapturaPlugin', 'captura', [arg0]);
    };


    CapturaPlugin.prototype.captura = function (successCallback, errorCallback, config, args) {
                exec(
                    function(result) {
                        successCallback(result);
                    },
                    function(error) {
                        errorCallback(error);
                    },
                    'CapturaPlugin',
                    'captura',
                    args
                );
            };

    var capturaplugin = new CapturaPlugin();
    module.exports = capturaplugin;
 


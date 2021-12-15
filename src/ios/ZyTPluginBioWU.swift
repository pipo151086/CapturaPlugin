import zy_validacionfacial_qapac_lib_ios

@objc(ZyTPluginBioWU)
class ZyTPluginBioWU : CDVPlugin {
    
    @objc(coolMethod:) // Declare your function name.
    func coolMethod(command: CDVInvokedUrlCommand) {
        let inputs = command.arguments as NSArray
        let tiDoc = inputs[0] as! String
        let nuDoc = inputs[1] as! String
        let idSolicitud = inputs[2] as! String
        let nuOperacionEmpresa = inputs[3] as! String
        let token = inputs[4] as! String
        let isDialog = inputs[5] as! Bool

        let  valBio = ZyApiCapturaFacial(onView: self.viewController)
        
        var zyrequest = ZyValidacionRequest()
        zyrequest.nuDoc = nuDoc
        zyrequest.tipoDoc = "1"
        zyrequest.nuOperacionEmps = nuOperacionEmpresa
        zyrequest.idSolicitud = idSolicitud
        zyrequest.token = token
        
        
        valBio.validacionFacialQ(request: zyrequest)
        {
            (result:(ZyValidacionResult<ZyValidacionResponse, ZyValidacionError>)) in
            var pluginResult = CDVPluginResult (status: CDVCommandStatus_ERROR, messageAs:"");
            switch result {
            case .success(let response):
                print("=======>>>>>>success")
                let keys = ["coError",
                            "deError" ,
                            "codErrorReniec" ,
                            "deErrorReniec" ,
                            "bioScore",
                            "nuSolicitud",
                            "bioIdTransaccion",
                            "idSolicitud"]
                
                let values = [response.coError ,
                              response.deError,
                              response.bioCodErrorReniec,
                              response.bioDeErrorReniec,
                              response.bioScore,
                              response.bioNuSolicitud,
                              response.bioIdTransaccion,
                              response.bmoIdSolicitud] as [Any]
                
                let dict = Dictionary(uniqueKeysWithValues: zip(keys, values))
                
                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: dict );
                
            case .error(let error):
                print("=======>>>>>>error")
                let keys = ["coError", "deError" ]
                let values = [error.coError , error.deError] as [Any]
                
                let dict = Dictionary(uniqueKeysWithValues: zip(keys, values))
                
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR, messageAs: dict);
            }
            
            self.commandDelegate!.send(pluginResult, callbackId: command.callbackId);
            
        }
        
    }
}

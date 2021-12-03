package com;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.text.BoringLayout;
import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.zy.qapaq.facial.lib.android.sdk.api.IZyApiCapturaFacial;
import com.zy.qapaq.facial.lib.android.sdk.api.ZyApiCapturaFacial;
import com.zy.qapaq.facial.lib.android.sdk.api.ZyRequest;
import com.zy.qapaq.facial.lib.android.sdk.api.ZyResponse;

/**
 * This class echoes a string called from JavaScript.
 */
public class CapturaPlugin extends CordovaPlugin {

    private static final String LOG_TAG = "zy_CapturaPlugin";
    private static final String CAPTURE = "captura";

    private CallbackContext callbackContext;
    Context contect;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        Log.d(LOG_TAG, "execute");
        this.callbackContext = callbackContext;
        if (action.equals("coolMethod")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);

        } else if (action.equals(CAPTURE)) {
            //android permission auto add
            Log.d(LOG_TAG, "args: " + args.toString());

            captura(args);
        }
        return true;
    }

    /**
     * Starts an intent to scan and decode a barcode.
     */
    public void captura(final JSONArray args) throws JSONException {
        Log.d(LOG_TAG, "Captura de FACIAL");
        final CordovaPlugin that = this;

        String tiDoc = args.getString(0);
        String nuDoc = args.getString(1);
        String idSolicitud = args.getString(2);
        String nuOperacionEmpresa = args.getString(3);
        String token = args.getString(4);
        Boolean isDialog = args.getBoolean(5);


        cordova.getThreadPool().execute(new Runnable() {
            public void run() {
                initCaptura(tiDoc, nuDoc, idSolicitud, nuOperacionEmpresa , token , isDialog);
            }
        });
    }

    public void initCaptura(String tiDoc, String nuDoc, String idSolicitud, String nuOperacionEmpresa , String token , Boolean isDialog) {

        final CordovaPlugin that = this;
        contect = that.cordova.getActivity().getApplicationContext();
        Activity activity = that.cordova.getActivity();

        IZyApiCapturaFacial iZyApiCapturaFacial = new ZyApiCapturaFacial(activity, new IZyApiCapturaFacial.ICallback() {
            @Override
            public void onStart() {
                Log.i(LOG_TAG, "onStart");

                //openDialog("Porfavor espere...");
            }

            @Override
            public void onComplete() {
                Log.i(LOG_TAG, "onComplete");
                //closeDialog();
            }

            @Override
            public void onSuccess(ZyResponse zyResponse) {
                Log.i(LOG_TAG, "zyResponse");
                JSONObject objeto = new JSONObject();
                try {
                    objeto.put("coError", zyResponse.getCoError() + "");
                    objeto.put("deError", zyResponse.getDeError()+ "");
                    objeto.put("codErrorReniec", zyResponse.getBioCodErrorReniec()+ "");
                    objeto.put("deErrorReniec", zyResponse.getBioDeErrorReniec()+ "");
                    objeto.put("nuSolicitud", zyResponse.getBioNuSolicitud()+ "");
                    objeto.put("idSolicitud", zyResponse.getBmoIdSolicitud()+ "");
                    objeto.put("bioScore", zyResponse.getBioScore()+ "");
                    objeto.put("bioIdTransaccion", zyResponse.getBioIdTransaccion()+ "");

                } catch (JSONException e) {
                    Log.d(LOG_TAG, "This should never happen");
                }
                callbackContext.success(objeto);

            }

            @Override
            public void onError(ZyResponse zyError) {
                Log.i(LOG_TAG, "OnError");
                JSONObject objeto = new JSONObject();

                try {
                    objeto.put("coError", zyError.getCoError());
                    objeto.put("deError", zyError.getDeError());

                } catch (JSONException e) {
                    Log.d(LOG_TAG, "This should never happen");
                }
                callbackContext.error(objeto);

            }


        });

        ZyRequest zyRequest = new ZyRequest();
        zyRequest.setTipoDoc(tiDoc);
        zyRequest.setNuDoc(nuDoc);
        zyRequest.setIdSolicitud(idSolicitud);
        zyRequest.setToken(token);
        zyRequest.setNuOperacionEmps(nuOperacionEmpresa);
        zyRequest.setDialogActivated(isDialog);
        iZyApiCapturaFacial.zyCapturaFacial(zyRequest);

    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

    /**
     * This plugin launches an external Activity when the camera is opened, so we
     * need to implement the save/restore API in case the Activity gets killed
     * by the OS while it's in the background.
     */
    public void onRestoreStateForActivityResult(Bundle state, CallbackContext callbackContext) {
        this.callbackContext = callbackContext;
    }
}

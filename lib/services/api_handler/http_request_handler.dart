import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_ultimate/Shared/shared_preferances.dart';
import 'package:task_ultimate/main.dart';
import 'package:task_ultimate/services/api_handler/http_request_exception.dart';
import 'package:task_ultimate/services/api_handler/urls.dart';
import 'package:task_ultimate/utilties/helper.dart';
import 'package:task_ultimate/utilties/toast_helper.dart';



enum RequestType {post,get,put,delete,}

class HttpHelper {
  /// TO CALL ANY API [post-get-put-delete]

  Future<dynamic> callService({required String url, required RequestType responseType, bool authorization = false, var body})async{
    http.Response? response;
    Map<String, String> headers = {
      'Content-Type': 'application/json',

    };
    if (kDebugMode) {

      log("Url: ${UltimateEndPoints.baseURL}$url");
      log("Headers: ${headers.toString()}");

    }
    try {
      switch(responseType){
        case RequestType.post:
          await http.post(Uri.parse("${UltimateEndPoints.baseURL}$url"), headers : headers, body: jsonEncode(body)).then((value){
            if (kDebugMode) {
              print("Body: ${body.toString()}");
              print(value.body);
            }
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
        case RequestType.get:
          await http.get(Uri.parse("${UltimateEndPoints.baseURL}$url"), headers : headers).then((value){
            if (kDebugMode) {
              print(value.body);
              print("Body: ${body.toString()}");
              print(value.body);
            }
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
        case RequestType.put:
          await http.put(Uri.parse("${UltimateEndPoints.baseURL}$url"), headers: headers, body : jsonEncode(body)).then((value){
            if (kDebugMode) {
              print(value.body);
            }
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
        case RequestType.delete:
          await http.delete(Uri.parse("${UltimateEndPoints.baseURL}$url"), headers : headers, body:jsonEncode(body)).then((value){
            if (kDebugMode) {
              print(value.body);
            }
            response = value;
          }).timeout(const Duration(seconds: 30));
          break;
      }
    }on SocketException catch (socketException) {

      ToastHelper.showError(message: "there_is_no_internet".tr);
      throw InternetException('internet');

    }on HttpException catch(httpException) {
      ToastHelper.showError(message: httpException.message.toString());
      return _responseExceptionHandler(response!);

    }on FormatException catch(formException) {
      ToastHelper.showError(message: formException.message.toString());
      return _responseExceptionHandler(response!);

    }on TimeoutException catch(timeOutException) {
      ToastHelper.showError(message: timeOutException.message.toString());
      return _responseExceptionHandler(response!);

    }on HandshakeException catch(handShakeException) {
      ToastHelper.showError(message: handShakeException.message.toString());
      return _responseExceptionHandler(response!);

    }
    catch (error) {
      ToastHelper.showError(message: error.toString());
      return _responseExceptionHandler(response!);
    }
    return _responseExceptionHandler(response!);
  }

}

///Exception STATUE
dynamic _responseExceptionHandler(http.Response response) async {
  switch (response.statusCode) {

  // success response
    case 200:
      return json.decode(response.body);

    case 201:
      return json.decode(response.body);

    case 204:
      debugPrint('no content');
      return {
        "statusCode": 204,
        "message":null,
        "data":  null
      };

    case 400:
    // bad request Exception
      debugPrint('bad request or otp wrong=${response.body}');
      return json.decode(response.body);

    case 401:
     // BaseModel baseModel=BaseModel.fromJson(jsonDecode(response.body));
      // if(baseModel.statusCode==403){
        ShowToastFunctions.showToast(context: TaskApp.navigatorKey.currentState!.context, msg: "unAuthErrorMessage".tr, isTranslate: true,);
        SharedPref.logOut();
        // todo navigate login
      // }
      return json.decode(response.body);
    case 404:
      debugPrint('Not Found 404');
      return json.decode(response.body);

    case 409:
      return json.decode(response.body);

    case 410:
      return json.decode(response.body);

    case 408:
      ShowToastFunctions.showToast(
        context: TaskApp.navigatorKey.currentState!.context,
        msg: "timeOutErrorMessage", isTranslate: true,
        // isTranslate: true
      );
      // Time Out Exception
      debugPrint('Time Out Exception 408');
      return json.decode(response.body);

    default:
      ShowToastFunctions.showToast(
        context: TaskApp.navigatorKey.currentState!.context,
        msg: "publicErrorMessage".tr, isTranslate: true,
        // isTranslate: true
      );
      debugPrint('exception error url ${response.request!.url} status code=${response.statusCode}');
      return json.decode(response.body);
  }
}


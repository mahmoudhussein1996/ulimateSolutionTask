import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/controller/provider/login_provider.dart';
import 'package:task_ultimate/Login/model/login.dart';
import 'package:task_ultimate/services/api_handler/general_api_state.dart';
import 'package:task_ultimate/services/api_handler/http_request_handler.dart';
import 'package:task_ultimate/services/api_handler/urls.dart';

class LoginApi extends GeneralApiState
{

  Future login({required BuildContext context}) async {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);

    setWaiting();
    await HttpHelper().callService(
        url:UltimateEndPoints.login,
        responseType:RequestType.post,
        body: {
          "Value": {
            "P_LANG_NO": "1",
            "P_DLVRY_NO": loginProvider.userIdController.text,
            "P_PSSWRD": loginProvider.passwordController.text
          }
        },
      authorization:true).then((value) {
      setHasData();
      loginProvider.setLoginResult(true);
      loginProvider.setLoginData(Login.fromJson(value));
    }).catchError((error, stackTrace) {
      debugPrint("catchError --------------> ${UltimateEndPoints.login}\n error= $error");
      if(error.toString()=="internet"){
        setConnectionError();
      }
      else{
        setHasError();
        setError(error);
      }

    });
  }
}

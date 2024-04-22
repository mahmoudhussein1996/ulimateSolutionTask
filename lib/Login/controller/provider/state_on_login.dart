import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/controller/api/login_api.dart';
import 'package:task_ultimate/Login/controller/provider/login_provider.dart';
import 'package:task_ultimate/Orders/controller/provider/state_on_get_delivery_data.dart';
import 'package:task_ultimate/Shared/shared_preferances.dart';


class StateOnClickLogin{

  LoginProvider loginProvider = LoginProvider();
  StateOnClickLogin(BuildContext context){
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
  }


  Future login(BuildContext context) async {
    await LoginApi().login(context: context);
    if(loginProvider.loginResult == true){
     await SharedPref.saveUserName(name: loginProvider.loginData?.name ?? "");
     StateOnGetDeliveryData(context).getDeliveryData(context);
    }
  }

}
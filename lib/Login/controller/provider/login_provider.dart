import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/model/login.dart';

class LoginProvider extends ChangeNotifier{
  factory LoginProvider() {
    _this ??= LoginProvider._();
    return _this!;
  }
  static LoginProvider? _this;
  LoginProvider._();


  final GlobalKey<FormState> loginInKey = GlobalKey();

  // The user data after the login
  Login? _loginData;
  Login? get loginData => _loginData;
  void setLoginData(Login? login){
    _loginData = login;
    notifyListeners();
  }
  // indicates login is successful or failed to navigate or show error
  bool _loginResult = false;
  bool get loginResult => _loginResult;
  setLoginResult(bool loginResult) {
    _loginResult = loginResult;
    notifyListeners();
  }

  // to show validation on login
  bool _autoValidate = false;
  bool get autoValidate => _autoValidate;
  setAutoValidate(bool autoValidate) {
    _autoValidate = autoValidate;
    notifyListeners();
  }

  TextEditingController
  userIdController = TextEditingController(),
  passwordController = TextEditingController();


  void resetData() {
    userIdController.clear();
    passwordController.clear();
    _autoValidate = false;
    notifyListeners();
  }

  void listen(){
    notifyListeners();
  }
}
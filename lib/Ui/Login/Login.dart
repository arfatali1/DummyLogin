import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dummylogin/Api_Client/api_client.dart';
import 'package:dummylogin/Ui/Constants/Constants.dart';
import 'package:dummylogin/Ui/Models/Login_Api-Model/Login_Api_Model.dart';
import 'package:dummylogin/Ui/Utils/App_utils.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';


class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  var utils = AppUtils();

  final emailTextController = TextEditingController();

  final passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   


  var client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: utils.appbar(appBarTitle: 'Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                utils.textfield(
                    hinttext: 'Email',
                    obscureText: false,
                    controller: emailTextController,
                    errorMessage: 'Please Enter Your Email'),
                SizedBox(
                  height: 20,
                ),
                utils.textfield(
                    hinttext: 'Password',
                    obscureText: true,
                    controller: passwordController,
                    errorMessage: 'Please Enter Your Password'),
                SizedBox(
                  height: 20,
                ),
                utils.button(
                    btncolor: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    radius: 10.0,
                    txt: 'Login',
                    txtcolor: Colors.white,
                    onPress: () {
                      _formKey.currentState!.validate();
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        loginUser();


                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                utils.button(
                    btncolor: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    radius: 10.0,
                    txt: 'Signup',
                    txtcolor: Colors.white,
                    onPress: () {
                      Navigator.pushNamed(context, signupScreenRoute);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser() {
    ProgressDialog pd = ProgressDialog(context: context);
    Map<String, dynamic> user = new Map();
    user['Email'] = emailTextController.text.toString();
    user['Password'] = passwordController.text.toString();
    // _logger.i('STACKTRACE:' +user.toString());
    pd.show(max: 10, msg: 'Please Wait...');
    client.login(user).then((value) {

      WelcomeL loginModel = WelcomeL.fromJson(jsonDecode(value));
      // box.write(loginUser,value);
      // WelcomeL = userModel.data!.type!;
      // WelcomeL = userModel.data.type;
      print('Logged in');
      pd.close();
      Navigator.pushNamed(context, homePageScreenRoute);
      // _logger.i("STACKTRACE: " + value.toString());
    }).onError((DioError error, stackTrace) {
pd.close();
      // _logger.i("STACKTRACE: " + error.response.toString());
      // showToast(error.response.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  }
}

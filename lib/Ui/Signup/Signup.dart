import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dummylogin/Api_Client/api_client.dart';
import 'package:dummylogin/Ui/Constants/Constants.dart';
import 'package:dummylogin/Ui/Models/Signup_Api_Model/Signup_Api_Model.dart';
import 'package:dummylogin/Ui/Utils/App_utils.dart';
import 'package:flutter/material.dart';

class Signupscreen extends StatefulWidget {
  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  var utils = AppUtils();

  final nameTextController = TextEditingController();

  final emailTextController = TextEditingController();

  final passwordController = TextEditingController();

  final typeTextController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: utils.appbar(appBarTitle: 'Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 50),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  utils.textfield(hinttext: 'Name', obscureText: false,controller: nameTextController,errorMessage: 'Please Enter Your Name'),
                  SizedBox(height: 10,),
                  utils.textfield(hinttext: 'Email', obscureText: false,controller: emailTextController,errorMessage: 'Please Enter Your Email'),
                  SizedBox(height: 10,),
                  utils.textfield(hinttext: 'Password', obscureText: true,controller: passwordController,errorMessage: 'Please Enter A Password'),
                  SizedBox(height: 10,),
                  utils.textfield(hinttext: 'Type', obscureText: false,controller: typeTextController,errorMessage: 'Please Enter Type'),
                  SizedBox(height: 50,),
                  utils.button(btncolor: Colors.blue,radius: 10.0,width: MediaQuery.of(context).size.width,txt: 'SignUp',txtcolor: Colors.white,onPress: (){
                    _formKey.currentState!.validate();
                    if(!_formKey.currentState!.validate()){
                      return;
                    }
                    else{
                      signUp(context: context);
                      print(typeTextController.text.toString());
                      print(nameTextController.text.toString());
                      print(emailTextController.text.toString());
                      print(passwordController.text.toString());
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp({context}){
    Map<String, dynamic> registerU = new Map();
    registerU['Name'] = nameTextController.text.toString();
    registerU['Email'] = emailTextController.text.toString();
    registerU['Password'] = passwordController.text.toString();
    registerU['Type'] = typeTextController.text.toString();

    client.register(registerU).then((value){
      // print(value);
      WelcomeS registerModel = WelcomeS.fromJson(jsonDecode(value));
      print('User Registered');
      Navigator.pushNamed(context, loginScreenRoute);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  }
}

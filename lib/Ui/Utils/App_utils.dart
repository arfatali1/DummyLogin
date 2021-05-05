import 'package:flutter/material.dart';

class AppUtils {
  appbar({appBarTitle, context}) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // automaticallyImplyLeading: true,
          title: Text(appBarTitle)),
    );
  }

  textfield({hinttext, obscureText,controller,errorMessage}) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (val)=> val!.isEmpty ? errorMessage : null,
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hinttext),
    );
  }

  button({
    onPress,
    btncolor,
    txt,
    txtcolor,
    width,
    radius,
  }) {
    return FlatButton(
      minWidth: width,
      color: btncolor,
      onPressed: onPress,
      child: Text(
        txt,
        style: TextStyle(color: txtcolor),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

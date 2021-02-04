import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackToLoginButton extends StatelessWidget {
  const BackToLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right:10.0),
      child: FlatButton(
        onPressed:()=> Get.offNamed("/login"),
        padding: EdgeInsets.all(0),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
            child: Text("Back to Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
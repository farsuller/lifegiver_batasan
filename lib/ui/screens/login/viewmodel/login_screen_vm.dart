import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/base/locator.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import '../../../../base/base_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();


  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        Get.offNamed("/home");
      } else {
        dialogDisplay(title:'Login',
            message:'Login Failed. Please try again',
            image:'assets/images/login_failed.png');
      }
    } else {
      dialogDisplay(title:'Login',
          message:result,
          image:'assets/images/login_failed.png');
    }
  }
  // Reset Password
  Future sendResetPassword({
    @required String email,
  }) async {
    setBusy(true);

    if (email.isEmail) {
      setBusy(false);
      await _authenticationService.sendPasswordResetEmail(email).then((value) {
        print(value.toString());
        dialogDisplay(title:'Forgot Password',
            message:'Check your email to reset your password',
            image:'assets/images/email_image.png');
      }).catchError((onError)=>
          dialogDisplay(title:'Forgot Password',
          message:'We can\'t find a user with this email address.\nThe user may have been deleted or does not really exist',
          image:'assets/images/email_image.png'));
    } else {
      dialogDisplay(title:'Forgot Password',
          message:'Email format is not valid',
          image:'assets/images/email_image.png');
    }

  }
  void dialogDisplay({String title, String message, String image}){
    Get.defaultDialog(
      title: title, radius: 5.0,
      content: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(children:[
          Image.asset(image,height: 170,),
          Text(message)]),
      ),
      actions: [
        RaisedButton(
          onPressed: () => Get.back(),
          child: Text("OK", style: TextStyle(color: Colors.white),),
          color: Colors.black,
        )
      ],
    );
  }

  Future<bool> onBackPressed() async{
    await Get.offNamed("/login");
    return true;
  }
  void navigateToSignUp() {
    Get.offNamed("/signUp");
  }

  void navigateToForgotPassword() {
    Get.offNamed("/forgotPassword");
  }
}

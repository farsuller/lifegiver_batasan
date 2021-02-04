
import 'package:flutter/material.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/ui/screens/login/viewmodel/login_screen_vm.dart';
import 'package:stacked/stacked.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.only(left: 10.0, right:10.0),
        child: Container(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            onPressed: () => model.navigateToSignUp(),
            padding: EdgeInsets.all(0),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
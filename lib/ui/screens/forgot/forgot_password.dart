import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:lifegiver_batasan/constants/check_build_flavor.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/screens/login/viewmodel/login_screen_vm.dart';
import 'package:lifegiver_batasan/ui/screens/shared/wave_background.dart';
import 'package:lifegiver_batasan/ui/screens/signup/widget/back_login_button.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';


class ForgotPasswordScreen extends StatefulWidget{
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> with SingleTickerProviderStateMixin {

  final emailController = TextEditingController();
  final _nativeAdController = NativeAdmobController();
  bool showNative = true;

  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 10),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();

    _nativeAdController.setNonPersonalizedAds(false);
    _nativeAdController.stateChanged.listen((event) {
      if(event == AdLoadState.loadError){
        setState(() {
          showNative = false;
        });
      }
      print("Here is native $event");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: model.onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
              overflow: Overflow.clip,
              children:[
                WaveBackground(controller: _controller),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll){overScroll.disallowGlow();
                      return;
                    },
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          child:  Padding(
                            padding: EdgeInsets.only(top: 20.0, left:10.0),
                            child: Text('Forgot Password',
                              style: TextStyle(color:Colors.white, fontSize: 38,
                                  fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Card(elevation: 5.0,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0,bottom: 20.0),
                                      child: Center(
                                        child: Container(
                                            height: 70,
                                            child: Image.asset('assets/images/batasan.png',)),
                                      ),
                                    ),
                                    InputField(
                                      placeholder: 'Email',
                                      controller: emailController,
                                    ),
                                    verticalSpaceSmall,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        showNative == true ? AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 150,
                          color: Colors.white,
                          child: NativeAdmob(
                            adUnitID: BuildFlavor.adNativeIDForgotPassword,
                            controller: _nativeAdController,
                            type: NativeAdmobType.banner,
                          ),
                        ):verticalSpaceMassive,
                        verticalSpaceMassive,
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right:10.0),
                          child: FlatButton(
                            onPressed: () {
                              model.sendResetPassword(email: emailController.text);
                            },
                            padding: EdgeInsets.all(0),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [quepalStart, mojitoStart, earthlyStart,],
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                                child: Text("Submit",
                                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        verticalSpaceSmall,
                        BackToLoginButton(),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/managers/dialog_manager.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/viewmodels/startup_view_model.dart';
import 'package:lifegiver_batasan/utils/constants.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 100,
                  child: Image.asset('assets/lifegiver_logo.jpg'),
                ),
                SizedBox(height: 100,),
                CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(secondaryColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

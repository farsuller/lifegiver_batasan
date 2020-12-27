
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/expansion_list.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/ui/viewmodels/signup_screen_vm.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';

import 'shared/ui_helpers.dart';


class SignUpView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenHeight * 0.04, vertical: SizeConfig.screenHeight * 0.10),
            child: ListView(
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceLarge,
                InputField(
                  placeholder: 'Full Name',
                  controller: fullNameController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                  additionalNote: 'Password has to be a minimum of 6 characters.',
                ),
                verticalSpaceSmall,
                ExpansionList<String>(
                    items: ['Renz', 'Renz2'],
                    title: model.selectedLeader,
                    onItemSelected: model.setSelectedLeader),
                verticalSpaceSmall,
                ExpansionList<String>(
                    items: ['David', 'David2'],
                    title: model.selectedLifegroup,
                    onItemSelected: model.setSelectedLifeGroup),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      title: 'Sign Up',
                      busy: model.busy,
                      onPressed: () {
                        model.signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            fullName: fullNameController.text);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/models/profile.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';
import 'package:lifegiver_batasan/ui/screens/shared/ui_helpers.dart';
import 'package:lifegiver_batasan/ui/viewmodels/profile_screen_vm.dart';
import 'package:lifegiver_batasan/ui/widgets/expansion_list.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/utils/constants.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';



class ProfileScreen extends StatelessWidget{

  final NavigationService _navigationService = locator<NavigationService>();
  final Profile profile;

  ProfileScreen({Key key, this.profile}) : super(key: key);
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: ()=> ProfileViewModel(),
      onModelReady: (model){
      },
      builder:(context, model, child) => Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: (){
                _navigationService.replaceNavigateTo(HomeViewRoute);
                },
             child: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04,
                vertical: SizeConfig.screenHeight * 0.05),
            child: ListView(
              children: <Widget>[
                Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 38,
                  ),
                ),
                verticalSpaceLarge,
                InputField(
                  textInputAction: TextInputAction.done,
                  placeholder: 'Full Name',
                  controller: fullNameController,
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
                verticalSpaceSmall,
                ExpansionList<String>(
                    items: ['Men','Women','Young Pro', 'Youth'],
                    title: model.selectedNetwork,
                    onItemSelected: model.setSelectedNetwork),

                verticalSpaceSmall,
                ExpansionList<String>(
                    items: ['Google Meet', 'Facebook'],
                    title: model.selectedPlatform,
                    onItemSelected: model.setSelectedPlatform),
                  ],
                )
            ),
        ),
        floatingActionButton: FloatingActionButton(
          child: !model.busy
              ? Icon(Icons.add)
              : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
          onPressed: () {
            if (!model.busy) {
              model.completeProfile(
                fullname: fullNameController.text,
                leader: model.selectedLeader,
                lifegroup: model.selectedLifegroup,
                network: model.selectedNetwork,
                platform: model.selectedPlatform
              );
            }
          },
          backgroundColor:
          !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
        ),
        ),
    );
  }
}
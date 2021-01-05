
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/models/lifegroup.dart';
import 'package:lifegiver_batasan/models/profile.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/screens/shared/ui_helpers.dart';
import 'package:lifegiver_batasan/ui/viewmodels/sunday_service_vm.dart';
import 'package:lifegiver_batasan/ui/widgets/expansion_list.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/utils/constants.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';



class SundayServiceProfileScreen extends StatelessWidget{

  final NavigationService _navigationService = locator<NavigationService>();
  final Profile profile;

  SundayServiceProfileScreen({Key key, this.profile}) : super(key: key);
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: ()=> ProfileViewModel(),
      onModelReady: (model)=> model.listenToData(),
      builder:(context, model, child) => Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: (){
                _navigationService.pop();
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
                  'Sunday Service Profile',
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
              Container(
                child: model.leaders != null ? ExpansionList<String>(
                                items: model.leaders,
                                title: model.selectedLeader,
                                onItemSelected: model.setSelectedLeader):_loadingIndicator(),
              ),
                verticalSpaceSmall,
                Container(
                  child: model.lifegroup != null ? ExpansionList<dynamic>(
                      items: model.lifegroup,
                      title: model.selectedLifegroup,
                      onItemSelected: model.setSelectedLifeGroup):_loadingIndicator(),
                ),
                verticalSpaceSmall,
                Container(
                  child: model?.network!= null ? ExpansionList<String>(
                      items: model.network,
                      title: model.selectedNetwork,
                      onItemSelected: model.setSelectedNetwork):_loadingIndicator(),
                ),
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

  _loadingIndicator(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
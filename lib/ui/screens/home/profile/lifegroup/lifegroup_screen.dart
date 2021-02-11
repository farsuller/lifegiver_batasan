
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/home/viewmodel/sunday_service_vm.dart';
import 'package:lifegiver_batasan/ui/widgets/expansion_list.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/helper/ui_helper.dart';
import 'package:stacked/stacked.dart';



class LifegroupProfileScreen extends StatelessWidget{


  LifegroupProfileScreen({Key key,}) : super(key: key);
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: ()=> ProfileViewModel(),
      disposeViewModel: false,
      onModelReady: (model)=> model.listenToData(),
      builder:(context, model, child) => Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=> Get.back(),
              child: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.04,
                  vertical: SizeConfig.screenHeight * 0.05),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Lifegroup Profile',
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
                  verticalSpaceSmall,
                  Container(
                    child: model?.platform!= null ? ExpansionList<String>(
                        items: model.platform,
                        title: model.selectedPlatform,
                        onItemSelected: model.setSelectedPlatform):_loadingIndicator(),
                  ),

                  Align(
                      child: RaisedButton( disabledColor:
                      !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
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
                        child: !model.busy
                            ? Text("Save")
                            : CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                  ),
                  Align(
                      child: RaisedButton( disabledColor:
                      !model.busy ? Theme.of(context).primaryColor : Colors.grey[600],
                        onPressed: () => Get.toNamed("/detector_camera"),
                        child: !model.busy
                            ? Text("Camera")
                            : CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      )
                  )
                ],
              )
          ),
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
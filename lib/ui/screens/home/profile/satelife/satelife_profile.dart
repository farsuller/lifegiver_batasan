import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/screens/shared/ui_helpers.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/ui/screens/home/viewmodel/sunday_service_vm.dart';
import 'package:lifegiver_batasan/ui/widgets/expansion_list.dart';
import 'package:lifegiver_batasan/ui/widgets/input_field.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';

class SatelifeProfileScreen extends StatelessWidget {
  SatelifeProfileScreen({
    Key key,
  }) : super(key: key);
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      disposeViewModel: false,
      onModelReady: (model) => model.listenToData(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.04,
                  vertical: SizeConfig.screenHeight * 0.05),
              child: ListView(
                children: <Widget>[
                  Text(
                    'Satelife Profile',
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
                    child: model.leaders != null
                        ? ExpansionList<String>(
                            items: model.leaders,
                            title: model.selectedLeader,
                            onItemSelected: model.setSelectedLeader)
                        : _loadingIndicator(),
                  ),
                  verticalSpaceSmall,
                  Container(
                    child: model.lifegroup != null
                        ? ExpansionList<dynamic>(
                            items: model.lifegroup,
                            title: model.selectedLifegroup,
                            onItemSelected: model.setSelectedLifeGroup)
                        : _loadingIndicator(),
                  ),
                  verticalSpaceSmall,
                  Container(
                    child: model?.network != null
                        ? ExpansionList<String>(
                            items: model.network,
                            title: model.selectedNetwork,
                            onItemSelected: model.setSelectedNetwork)
                        : _loadingIndicator(),
                  ),
                  verticalSpaceSmall,
                  Container(
                    child: model?.platform != null
                        ? ExpansionList<String>(
                            items: model.platform,
                            title: model.selectedPlatform,
                            onItemSelected: model.setSelectedPlatform)
                        : _loadingIndicator(),
                  ),
                  Align(
                      child: RaisedButton(
                    disabledColor: !model.busy
                        ? Theme.of(context).primaryColor
                        : Colors.grey[600],
                    onPressed: () {
                      if (!model.busy) {
                        model.completeProfile(
                            fullname: fullNameController.text,
                            leader: model.selectedLeader,
                            lifegroup: model.selectedLifegroup,
                            network: model.selectedNetwork,
                            platform: model.selectedPlatform);
                      }
                    },
                    child: !model.busy
                        ? Text("Save")
                        : CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                  ))
                ],
              )),
        ),
      ),
    );
  }

  _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

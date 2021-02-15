import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/screens/home/viewmodel/home_screen_vm.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/dashboard_card_box.dart';
import 'package:stacked/stacked.dart';


class DashboardReporting extends StatefulWidget {
  const DashboardReporting({Key key,}) : super(key: key);


  @override
  _DashboardReportingState createState() => _DashboardReportingState();
}

class _DashboardReportingState extends State<DashboardReporting> {


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: ()=> HomeViewModel(),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DashboardCardBox(
                header: dashboardDataItems[2].header,
                text: dashboardDataItems[2].text,
                image: dashboardDataItems[2].image,
                startColor: dashboardDataItems[2].startColor,
                endColor: dashboardDataItems[2].endColor,
                toAdjust: true,
                buttonStartColor:dashboardDataItems[2].buttonStartColor,
                buttonEndColor: dashboardDataItems[2].buttonEndColor,
                navigateProfile: () =>model.navigateToSatelifeProfile(),
              ),
              DashboardCardBox(
                header: dashboardDataItems[1].header,
                text: dashboardDataItems[1].text,
                image: dashboardDataItems[1].image,
                startColor: dashboardDataItems[1].startColor,
                endColor: dashboardDataItems[1].endColor,
                toAdjust: true,
                buttonStartColor:dashboardDataItems[1].buttonStartColor,
                buttonEndColor: dashboardDataItems[1].buttonEndColor,
                navigateProfile: () =>model.navigateToSatelifeProfile(),
              ),
          ],),
          verticalSpaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              DashboardCardBox(
                header: dashboardDataItems[0].header,
                text: dashboardDataItems[0].text,
                image: dashboardDataItems[0].image,
                startColor: dashboardDataItems[0].startColor,
                endColor: dashboardDataItems[0].endColor,
                toAdjust: true,
                buttonStartColor:dashboardDataItems[0].buttonStartColor,
                buttonEndColor: dashboardDataItems[0].buttonEndColor,
                navigateProfile: () =>model.navigateToSatelifeProfile(),
              ),
              DashboardCardBox(
                header: dashboardDataItems[3].header,
                text: dashboardDataItems[3].text,
                image: dashboardDataItems[3].image,
                startColor: dashboardDataItems[3].startColor,
                endColor: dashboardDataItems[3].endColor,
                toAdjust: true,
                buttonStartColor:dashboardDataItems[3].buttonStartColor,
                buttonEndColor: dashboardDataItems[3].buttonEndColor,
                navigateProfile: () =>model.navigateToSatelifeProfile(),
              ),
            ],)
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/ui/screens/home/viewmodel/home_screen_vm.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/dashboard_card.dart';
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
          SizedBox(
            height: 10,
          ),
          DashboardCard(
            header: dashboardDataItems[0].header,
            text: dashboardDataItems[0].text,
            image: dashboardDataItems[0].image,
            startColor: dashboardDataItems[0].startColor,
            endColor: dashboardDataItems[0].endColor,
            toAdjust: true,
            buttonStartColor:dashboardDataItems[0].buttonStartColor,
            buttonEndColor: dashboardDataItems[0].buttonEndColor,
             navigateProfile:() {
               print("navigation is working");
              model.navigateToLifegroupProfile();},
          ),

          SizedBox(
            height: 10,
          ),
          DashboardCard(
            header: dashboardDataItems[1].header,
            text: dashboardDataItems[1].text,
            image: dashboardDataItems[1].image,
            startColor: dashboardDataItems[1].startColor,
            endColor: dashboardDataItems[1].endColor,
            toAdjust: false,
            buttonStartColor:dashboardDataItems[1].buttonStartColor,
            buttonEndColor: dashboardDataItems[1].buttonEndColor,
            navigateProfile: () => model.navigateToServiceProfile(),
          ),

          SizedBox(
            height: 10,
          ),
          DashboardCard(
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


        ],
      ),
    );
  }
}
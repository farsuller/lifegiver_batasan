import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/locator.dart';
import 'package:lifegiver_batasan/models/service.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/announcement_tile.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/dashboard_reporting.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/widgets/attendance_forms.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/tab_bar_menu.dart';
import 'package:lifegiver_batasan/ui/viewmodels/home_screen_vm.dart';
import 'package:lifegiver_batasan/utils/constants.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';
import 'package:stacked/stacked.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final NavigationService _navigationService = locator<NavigationService>();

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: ()=> HomeViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: 4,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              leading: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/lifegiver_logo.jpg",),
                  )),
             // title: TabBarMenus(),
              actions: <Widget>[
                GestureDetector(
                  onTap:() => model.signOut(),
                    child: Icon(Icons.logout)),
                SizedBox(width: 10.0,)
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.04,
                                  bottom: 10.0),
                              child: Text("Announcements",style: TextStyle(fontSize: 20.0),),
                            ),
                            AnnouncementTile(),
                            DashboardReporting(navigationService: _navigationService)

                          ],
                        ),
                      ),
                    ),
            )
        ),
      ),
    );
  }

}





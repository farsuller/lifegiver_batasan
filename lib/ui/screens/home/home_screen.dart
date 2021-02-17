
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:lifegiver_batasan/constants/check_build_flavor.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/announcement_tile.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/dashboard_reporting.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/verse_of_the_day.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel/home_screen_vm.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nativeAdController = NativeAdmobController();
  bool showNative = true;
  @override
  void initState() {
    _nativeAdController.setNonPersonalizedAds(false);
    _nativeAdController.stateChanged.listen((event) {
      if(event == AdLoadState.loadError){
        setState(() {
          showNative = false;
        });
      }
      print("Here is native $event");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model)=> model.listenAnnouncement(),
      viewModelBuilder: ()=> HomeViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: 4,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 5,
              title: Text("Lifegiver Batasan",
              style: TextStyle(
                  fontFamily: "Londrina Shadow",
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),),
              leading: Container(
                width: 100,
                  child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/lifegiver_logo.jpg",),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnnouncementTile(),
                          VerseOfTheDay(),
                          showNative == true ?AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 100,
                            child: NativeAdmob(
                              adUnitID: BuildFlavor.adNativeIDHomeDashboard,
                              controller: _nativeAdController,
                              type: NativeAdmobType.banner,
                            ),
                          ):  verticalSpaceSmall,
                          DashboardReporting()
                        ],
                      ),
                    ),
            )
        ),
      ),
    );
  }

  }





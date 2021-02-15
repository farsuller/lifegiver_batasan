import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/announcement_tile.dart';
import 'package:lifegiver_batasan/ui/screens/home/widget/dashboard_reporting.dart';
import 'package:stacked/stacked.dart';

import 'viewmodel/home_screen_vm.dart';


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
                          Column(children: [
                            Center(child: Text("Verse of the Day",
                              style: TextStyle(
                                  fontFamily: "Londrina Shadow",
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),),),
                            Center(child: Padding(
                              padding: const EdgeInsets.only(left: 7.0, right: 7.0),
                              child: Text("And he has given us this command: Whoever loves God must also love his brother. 1 John 4:21",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,),),
                            ),),
                          ],
                          ),
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





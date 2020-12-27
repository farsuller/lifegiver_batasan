import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/models/service.dart';
import 'package:lifegiver_batasan/services/authentication_service.dart';
import 'package:lifegiver_batasan/ui/screens/service/service_screen.dart';
import 'file:///C:/Users/Service%20Unit/Desktop/FlutterProjects/lifegiver_batasan/lib/ui/screens/login_screen.dart';
import 'package:lifegiver_batasan/ui/widgets/attendance_forms.dart';
import 'package:lifegiver_batasan/ui/widgets/busy_button.dart';
import 'package:lifegiver_batasan/ui/widgets/tab_bar_menu.dart';
import 'package:lifegiver_batasan/ui/viewmodels/home_screen_vm.dart';
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
    Service service;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: ()=> HomeViewModel(),
      builder: (context, model, child) => DefaultTabController(
        length: 4,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Image.asset("assets/lifegiver_logo.jpg", height: 25, width: 25,),
              title: TabBarMenus(),
              actions: <Widget>[
                BusyButton(
                  title: 'Logout',
                  busy: model.busy,
                  onPressed: () => model.signOut().then((value) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginView()),
                            (Route<dynamic> route) => false);
                  }),
                ),
              ],
            ),
            body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 20.0),
                            child: Text("Sunday Service Attendance"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Column(
                                children: [
                                  AttendanceForms()
                                ],
                              ),
                            ),
                          ),

                          // ListView.builder(
                          //   itemCount:service.id.length,
                          //   scrollDirection: Axis.horizontal,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return _buildServiceList(service);
                          //   },
                          // )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Lifegroup"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Giving"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("Journey"),
                    ),
                  ),
                ]
            )
        ),
      ),
    );
  }


  _buildServiceList(Service service) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ServiceInfoScreen(
                id: service.id,
                title: service.title,
                description:service.description,
                attendanceCount:service.attendanceCount,
              ),
            ),
          );
        },
        child: Container(
          width: 200,
          margin: EdgeInsets.only(left:5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            // child: Image.network(video.thumbnailUrl, height:150 , width: 250,fit: BoxFit.cover,),
            child: Image.asset("assets/service1.jpg", height:150 , width: 250,fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }

}





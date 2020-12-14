import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/models/attendance.dart';
import 'package:lifegiver_batasan/requests/api_client.dart';

class AttendanceListPage extends StatefulWidget {
  AttendanceListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AttendanceListPageState createState() => _AttendanceListPageState();
}

class _AttendanceListPageState extends State<AttendanceListPage> {
  List<Attendance> attendanceItems = List<Attendance>();

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();
    LifegiverApiClient().getAttendanceList().then((attendanceItems){
      setState(() {
        this.attendanceItems = attendanceItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color: Colors.black),),
      ),
      body: attendanceItems.length == 0? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.amber // Red
          ),
        ),
      ):Container(
        child: Column(
          children:[
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: attendanceItems.length - 1,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(Icons.person),
                        Text(
                            "${attendanceItems[index].name}"
                        )
                      ],
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Column(children: [
                          Text("Lifegroup Leader: ${attendanceItems[index].leader}"),
                          Text("Lifegroup Name: ${attendanceItems[index].lifegroup}"),
                        ],
                        ),
                        Column(children: [
                          Text("Network: ${attendanceItems[index].network}"),
                          Text("Platform: ${attendanceItems[index].platform}"),
                        ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ] ,
        ),
      ),
    );
  }
}

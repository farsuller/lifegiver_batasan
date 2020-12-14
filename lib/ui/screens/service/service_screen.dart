import 'package:flutter/material.dart';

class ServiceInfoScreen extends StatefulWidget {
  final String title;
  final String id;
  final String description;
  final int attendanceCount;
  ServiceInfoScreen({this.id, this.title,this.description, this.attendanceCount});

  @override
  _ServiceInfoScreenState createState() => _ServiceInfoScreenState();
}

class _ServiceInfoScreenState extends State<ServiceInfoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            AppBar(title: Text("Service"),),
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(child: Text("Title: Service Info")),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(widget.description,),
                    ),
                  ],
                ),
              ),
            )
          ],
    );
  }

}

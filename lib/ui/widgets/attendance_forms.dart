import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/models/attendance.dart';
import 'package:lifegiver_batasan/requests/api_client.dart';
import 'package:lifegiver_batasan/ui/screens/home/attendance_list.dart';



class AttendanceForms extends StatefulWidget {
  @override
  _AttendanceFormsState createState() => _AttendanceFormsState();
}

class _AttendanceFormsState extends State<AttendanceForms> {
  String name, leader, lifegroup, network, platform;

  final _formKey = GlobalKey<FormState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController leaderController = TextEditingController();
  TextEditingController lifegroupController = TextEditingController();
  TextEditingController networkController = TextEditingController();
  TextEditingController platformController = TextEditingController();

  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.

    name = nameController.text;
    leader = leaderController.text;
    lifegroup =   lifegroupController.text;
    network =  networkController.text;
    platform = platformController.text;

    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      Attendance attendance = Attendance(name,leader, lifegroup, network, platform);

      LifegiverApiClient apiClient = LifegiverApiClient();

      print("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      apiClient.submitForm(attendance, (String response) {
        print("Response: $response");
        if (response == LifegiverApiClient.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          print("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          print("Error Occurred!");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter Valid Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Name"
                      ),
                    ),
                    TextFormField(
                      controller: leaderController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter Valid Leader";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Lifegroup Leader"
                      ),
                    ),
                    TextFormField(
                      controller: lifegroupController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter Valid Lifegroup";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Lifegroup Name"
                      ),
                    ),
                    TextFormField(
                      controller: networkController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter Valid Network";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Network"
                      ),
                    ),TextFormField(
                      controller: platformController,
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter Valid Platform";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Platform"
                      ),
                    ),

                  ],
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
              Center(child:
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AttendanceListPage(title: "Response",),
                        ));
                  },
                  child: Text('View Feedback'),
                ),
              )
            ],
          ),
        ),
    );
  }
}
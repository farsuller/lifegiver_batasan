import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:lifegiver_batasan/models/attendance.dart';

class LifegiverApiClient {
  // Callback function to give response of status of current request.

  // Google App Script Web URL
   static const String URL = "https://script.google.com/macros/s/AKfycby8AfJN01gd-Frixl7ufXeHR1KBIdVUTPZRDyVmWVk5RxVZj3E/exec";
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  List<Attendance> feedback = [];

  void submitForm(Attendance attendance, void Function(String) callback) async {
    try {
      await http.post(URL, body: attendance.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

   Future<List<Attendance>> getAttendanceList() async {
     return await http.get(URL).then((response) {
       var jsonFeedback = convert.jsonDecode(response.body) as List;
       return jsonFeedback.map((json) => Attendance.fromJson(json)).toList();
     });
   }
}
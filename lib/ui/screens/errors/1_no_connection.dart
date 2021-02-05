
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/constants.dart';
class NoConnectionScreen extends StatefulWidget {
  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {

  var isLoading;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/error_states/1_No Connection.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 100,
            left: 30,
            child: FlatButton(
              height: 50,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () async{
                setState(() {
                  isLoading = true;
                });

                },
              child: isLoading == true ? CircularProgressIndicator(
                backgroundColor: Colors.purple[300],
                  valueColor: AlwaysStoppedAnimation(Colors.deepPurple[400])):Text("Retry".toUpperCase()
            ),
            )
          )
        ],
      ),
    );
  }
}

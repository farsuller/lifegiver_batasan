
import 'package:flutter/material.dart';

class VerseOfTheDay extends StatelessWidget {
  const VerseOfTheDay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    );
  }
}
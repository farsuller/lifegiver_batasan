

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/helper/ui_helper.dart';
import 'package:lifegiver_batasan/ui/widgets/custom_shard_painter.dart';


class DashboardCardBox extends StatefulWidget {

  final String header;
  final String text;
  final String image;
  final Color startColor;
  final Color endColor;
  final Color buttonStartColor;
  final Color buttonEndColor;
  final bool toAdjust;
  final Function navigateProfile;
  final Function sendData;
  const DashboardCardBox({
    Key key, this.header, this.text,
    this.image, this.startColor, this.endColor,this.toAdjust,
    this.buttonStartColor, this.buttonEndColor, this.navigateProfile, this.sendData
  }) : super(key: key);

  @override
  _DashboardCardBoxState createState() => _DashboardCardBoxState();
}

class _DashboardCardBoxState extends State<DashboardCardBox> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left:10.0, right:5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        height: SizeConfig.screenHeight * 0.25,
        width: SizeConfig.screenWidth * 0.45,
        child: Stack(
            children:[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      widget.startColor,
                      widget.endColor
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 1,
                bottom: 0,
                top: 10,
                child: CustomPaint(
                  size: Size(150, 10),
                  painter: CustomCardShapePainter(15,
                      widget.startColor, widget.endColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:75.0),
                child: Center(child: Image.asset(widget.image, height: 120,)),
              ),
              Stack(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:[
                        GestureDetector(
                          onTap: widget.navigateProfile,
                          child: Padding(
                            padding: const EdgeInsets.only(top:10,left:10.0,right: 10.0),
                            child: Icon(Icons.settings),
                          ),
                        ),
                      ]
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top:10,left:8.0,bottom: 5.0),
                      child: Container(
                          width: 90.0,
                          child: Text(widget.header,
                            style: TextStyle(
                                fontFamily: "Londrina Shadow",
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top:90.0,left:8.0,bottom: widget.toAdjust? 35.0 : 5.0),
                      child: Container(
                        width: 90,
                        child: Text(widget.text,
                            style:TextStyle(
                                height: 0.8,
                                fontFamily: "Londrina Shadow",
                                fontSize: 27.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  //AttendanceForms()
                ],
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:15.0,right: 10.0),
                    child: Container(
                      height: 40.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        gradient: LinearGradient(
                          colors: <Color>[
                            widget.buttonStartColor,
                            widget.buttonEndColor,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black54, blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: ()=>widget.sendData,
                        child: Center(
                          child: Text('YES',
                              style: TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold)),
                        ),
                      ),

                    ),
                  )
              ),

            ]
        ),
      ),
    );
  }
}
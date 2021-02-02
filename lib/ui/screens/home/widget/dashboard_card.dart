

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/ui/widgets/custom_shard_painter.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';

class DashboardCard extends StatefulWidget {

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
  const DashboardCard({
    Key key, this.header, this.text,
    this.image, this.startColor, this.endColor,this.toAdjust,
    this.buttonStartColor, this.buttonEndColor, this.navigateProfile, this.sendData
  }) : super(key: key);

  @override
  _DashboardCardState createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left:10.0, right:10.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: SizeConfig.screenHeight * 0.25,
          width: SizeConfig.screenWidth * 1.0,
          child: Stack(
              children:[

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: CustomPaint(
                    size: Size(100, 150),
                    painter: CustomCardShapePainter(5,
                        widget.startColor, widget.endColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: Center(child: Image.asset(widget.image)),
                ),
                Stack(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left:10.0,),
                            child: Image.asset("assets/lifegiver_logo.jpg",
                              height: SizeConfig.screenHeight * 0.09,
                              width: SizeConfig.screenWidth * 0.09,),
                          ),
                          GestureDetector(
                            onTap: widget.navigateProfile,
                            child: Padding(
                              padding: const EdgeInsets.only(left:10.0,right: 10.0),
                              child: Icon(Icons.settings),
                            ),
                          ),
                        ]
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,bottom: 5.0),
                        child: Container(
                            width: 100.0,
                            child: Text(widget.header,
                              style: TextStyle(
                                  fontFamily: "Londrina Shadow",
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left:8.0,bottom: widget.toAdjust? 25.0 : 5.0),
                        child: Container(
                          width: 150,
                          child: Text(widget.text,
                              style:TextStyle(
                                height: 0.8,
                                  fontFamily: "Londrina Shadow",
                                  fontSize: 35.0,
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
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: ()=>widget.sendData,
                          child: Center(
                            child: Text('YES',
                                style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
                          ),
                        ),

                      ),
                    )
                ),

              ]
          ),
        ),
      ),
    );
  }
}
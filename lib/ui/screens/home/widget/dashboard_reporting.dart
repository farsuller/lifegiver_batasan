import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/models/report_card.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';
import 'package:lifegiver_batasan/ui/widgets/custom_shard_painter.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';


class DashboardReporting extends StatefulWidget {
  const DashboardReporting({
    Key key,
    @required NavigationService navigationService,
  }) : _navigationService = navigationService, super(key: key);

  final NavigationService _navigationService;

  @override
  _DashboardReportingState createState() => _DashboardReportingState();
}

class _DashboardReportingState extends State<DashboardReporting> {
  var items = [
    ReportCard('Did you attend your', 'Lifegroup',"assets/images/yp-women.png",
      Color(0xffFFB157), Color(0xffFFA057),),
    ReportCard('Did you attend', 'Sunday Service',"assets/images/men.png",
        Color(0xffFF5B95), Color(0xffF8556D)),
    ReportCard('Did you attend a', 'Satelife',"assets/images/yp-men.png",
        Color(0xffD76EF5), Color(0xff8F7AFE)),

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
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
                        items[0].startColor,
                        items[0].endColor
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
                          items[0].startColor, items[0].endColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:25.0),
                    child: Center(child: Image.asset(items[0].image)),
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
                            Padding(
                              padding: const EdgeInsets.only(left:10.0,right: 10.0),
                              child: Icon(Icons.settings),
                            ),
                          ]
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0,),
                          child: Container(
                            width: 100.0,
                              child: Text(items[0].header,style: TextStyle(fontSize: 15.0),)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0,bottom: 25.0),
                          child: Text(items[0].text,style:GoogleFonts.londrinaShadow(
                              fontSize: 35.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:15.0,right: 5.0),
                          child: FlatButton(onPressed: (){},
                              child: Text("YES",style:GoogleFonts.londrinaShadow(
                                  fontSize: 35.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                          ),
                        )
                      )
                      //AttendanceForms()
                    ],
                  ),
                ]
              ),
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),
        Padding(
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
                          items[1].startColor,
                          items[1].endColor
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
                            items[1].startColor, items[1].endColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0),
                      child: Center(child: Image.asset(items[1].image)),
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
                              Padding(
                                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                child: Icon(Icons.settings),
                              ),
                            ]
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,bottom: 15.0),
                            child: Container(
                                width: 100.0,
                                child: Text(items[1].header,style: TextStyle(fontSize: 15.0),)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,bottom: 5.0),
                            child: Container(
                              width: 100,
                              child: Text(items[1].text,style:GoogleFonts.londrinaShadow(
                                  fontSize: 35.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:15.0,right: 5.0),
                              child: FlatButton(onPressed: (){},
                                child: Text("YES",style:GoogleFonts.londrinaShadow(
                                    fontSize: 35.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                              ),
                            )
                        )
                        //AttendanceForms()
                      ],
                    ),
                  ]
              ),
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),
        Padding(
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
                          items[2].startColor,
                          items[2].endColor
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
                            items[2].startColor, items[2].endColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0),
                      child: Center(child: Image.asset(items[2].image)),
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
                              Padding(
                                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                child: Icon(Icons.settings),
                              ),
                            ]
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,),
                            child: Container(
                                width: 110.0,
                                child: Text(items[2].header,style: TextStyle(fontSize: 15.0),)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0,bottom: 25.0),
                            child: Text(items[2].text,style:GoogleFonts.londrinaShadow(
                                fontSize: 35.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom:15.0,right: 5.0),
                              child: FlatButton(onPressed: (){},
                                child: Text("YES",style:GoogleFonts.londrinaShadow(
                                    fontSize: 35.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                              ),
                            )
                        )
                        //AttendanceForms()
                      ],
                    ),
                  ]
              ),
            ),
          ),
        ),


      ],
    );
  }
}
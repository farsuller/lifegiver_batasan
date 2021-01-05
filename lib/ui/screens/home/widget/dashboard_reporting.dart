import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/constants/route_names.dart';
import 'package:lifegiver_batasan/services/navigation_service.dart';
import 'package:lifegiver_batasan/utils/size_config.dart';


class DashboardReporting extends StatelessWidget {
  const DashboardReporting({
    Key key,
    @required NavigationService navigationService,
  }) : _navigationService = navigationService, super(key: key);

  final NavigationService _navigationService;

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
                  Center(child: Image.asset("assets/images/yp-women.png")),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,),
                        child: Text("Did you attend your",style: TextStyle(fontSize: 15.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,bottom: 10.0),
                        child: Text("Lifegroup",style: TextStyle(fontSize: 20.0),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:8.0,right: 10.0),
                          child: RaisedButton(onPressed: (){},
                              child: Text("Yes",style: TextStyle(fontSize: 15.0))),
                        ),
                      )
                      //AttendanceForms()
                    ],
                  ),
                ]
              ),
            ),
          ),
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
                    Center(
                      child: Image.asset("assets/images/men.png",
                        height: SizeConfig.screenHeight * 0.5,
                        width: SizeConfig.screenWidth * 0.5,),
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              onTap: ()=>  _navigationService.navigateTo(ProfileViewRoute),
                              child: Padding(
                                padding: const EdgeInsets.only(left:10.0,right: 10.0),
                                child: Icon(Icons.settings),
                              ),
                            ),
                          ]
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,),
                        child: Text("Did you attend",style: TextStyle(fontSize: 15.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,bottom: 10.0),
                        child: Text("Sunday Service",style: TextStyle(fontSize: 20.0),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:8.0,right: 10.0),
                          child: RaisedButton(onPressed: (){},
                              child: Text("Yes",style: TextStyle(fontSize: 15.0))),
                        ),
                      )
                      //AttendanceForms()
                    ],
                  ),
                ]
              ),
            ),
          ),
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
                  Center(child: Image.asset("assets/images/yp-men.png")),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,),
                        child: Text("Did you attend a",style: TextStyle(fontSize: 15.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,bottom: 10.0),
                        child: Text("Satelife",style: TextStyle(fontSize: 20.0),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:8.0,right: 10.0),
                          child: RaisedButton(onPressed: (){},
                              child: Text("Yes",style: TextStyle(fontSize: 15.0))),
                        ),
                      )
                      //AttendanceForms()
                    ],
                  )
                ] ,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
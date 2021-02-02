import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/ui/screens/shared/app_colors.dart';

class TabBarMenus extends StatelessWidget {
  const TabBarMenus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: primaryColor,
      labelColor: Colors.black,
      labelPadding: EdgeInsets.only(left:1),
      tabs: [
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("Attendance"),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("Lifegroup"),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("Giving"),
          ),
        ),
        Tab(
          child: Align(
            alignment: Alignment.center,
            child: Text("Journey"),
          ),
        ),

      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/models/report_card.dart';

var hotLinearStart = Color(0xffF55B9A);
var hotLinearEnd = Color(0xffF9B16E);
var blushStart = Color(0xffB24592);
var blushEnd = Color(0xffF15F79);
var cosmicFusionStart = Color(0xffb372db);
var cosmicFusionEnd = Color(0xff8949ba);

var earthlyStart = Color(0xff649173);
var earthlyEnd = Color(0xffdbd5a4);

var mojitoStart = Color(0xff1d976c);
var mojitoEnd = Color(0xff93f9b9);

var quepalStart = Color(0xff11998e);
var quepalEnd = Color(0xff38ef7d);


TextStyle labelTextStyle() =>
    TextStyle(
      fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 16, color: Colors.black,
        decoration: TextDecoration.none,
    );

TextStyle titleTextStyle() =>
    TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 16, color: Colors.black,
        decoration: TextDecoration.none);

TextStyle descriptionTextStyle() =>
    TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 16, color: Colors.black,
        decoration: TextDecoration.none);

var dashboardDataItems = [
  ReportCard('Did you attend your', 'Lifegroup',"assets/images/yp-women.png",
    Color(0xffFFB157), Color(0xffFFA057),hotLinearStart, hotLinearEnd),
  ReportCard('Did you attend', 'Sunday Service',"assets/images/men.png",
      Color(0xffFF5B95), Color(0xffF8556D),blushStart, blushEnd),
  ReportCard('Did you attend a', 'Satelife',"assets/images/yp-men.png",
      Color(0xffD76EF5), Color(0xff8F7AFE),cosmicFusionStart, cosmicFusionEnd),

];
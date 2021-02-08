import 'package:flutter/material.dart';
import 'package:lifegiver_batasan/models/report_card.dart';

var hotLinearStart = Color(0xffF55B9A);
var hotLinearEnd = Color(0xffF9B16E);
var blushStart = Color(0xffB24592);
var blushEnd = Color(0xffF15F79);
var cosmicFusionStart = Color(0xffb372db);
var cosmicFusionEnd = Color(0xff8949ba);

var purple01 = Color(0xffd853ca);
var purple02 = Color(0xff964AF3);

var purpledark01 = Color(0xff9e3ae5);
var purpledark02 = Color(0xff8517d4);

var purpledark03 = Color(0xff8335b5);
var purpledark04 = Color(0xff7517b8);

var purplelight01 = Color(0xffd853ca);
var purplelight02 = Color(0xffb824d2);

var purplelight03 = Color(0xffbf63b5);
var purplelight04 = Color(0xffae22a1);

var earthlyStart = Color(0xff4dd484);
var earthlyEnd = Color(0xffaaf48f);

var mojitoStart = Color(0xff3bca77);
var mojitoEnd = Color(0xff8ac874);

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
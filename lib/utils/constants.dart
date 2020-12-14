import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff8BC34A);
const Color secondaryColor = Color(0xff64DD17);
const Color pusoBackgroundColor = Color(0xffa20025);


class PageKeys {
  static final keyAll = const Key('PageAll');
  static final keyPuso = const Key('PagePuso');
  static final keyConnect = const Key('PageConnect');
  static final keyBranches = const Key('PageBranches');
  static final keyMarket = const Key('PageMarket');
}

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
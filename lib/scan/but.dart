import 'package:flutter/material.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/scan/scanpage.dart';

Widget Homescanbut(context) {
  return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScanPage()));
      },
      style: TextButton.styleFrom(
        shadowColor: Colors.white,
        elevation: 2,
        shape: BeveledRectangleBorder(),
        backgroundColor: butcolorlight,
      ),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(5)),
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            'NEW SALE',
            style: problemStatementlight,
          ),
        ),
      ));
}

const butcolorlight = const Color.fromARGB(255, 1, 18, 36);

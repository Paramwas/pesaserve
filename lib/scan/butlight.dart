import 'package:flutter/material.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/scan/scanpage.dart';

Widget Homescanbutlight(context) {
  return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ScanPage()));
      },
      style: TextButton.styleFrom(
        shadowColor: const Color.fromARGB(255, 12, 12, 12),
        elevation: 2,
        shape: BeveledRectangleBorder(),
        backgroundColor: const Color.fromARGB(255, 214, 230, 247),
      ),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(5)),
        height: 100,
        width: 100,
        child: Center(
          child: Text(
            'NEW SALE',
            style: problemStatement,
          ),
        ),
      ));
}

const butcolor = const Color.fromARGB(255, 214, 230, 247);

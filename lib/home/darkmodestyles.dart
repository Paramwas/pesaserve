import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';

const backgroundcolor = Color.fromARGB(255, 2, 8, 14);
const freecolordark = Colors.white;

var tabbarname = GoogleFonts.lexend(
  fontSize: 14,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);
var tabbarwelcome = GoogleFonts.lexend(
  fontSize: 10,
  color: const Color.fromARGB(255, 199, 196, 196),
  fontWeight: FontWeight.w400,
);

const notificationicon = Colors.white;

var searchbarstyles = InputDecoration(
    fillColor: const Color.fromARGB(36, 255, 255, 255),
    filled: true,
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusColor: ContainerColor,
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 5, color: ContainerColor),
        borderRadius: BorderRadius.circular(10)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ContainerColor, width: 3),
        borderRadius: BorderRadius.circular(10)),
    labelStyle: problemStatement.copyWith(),
    hintText: 'Search Transaction',
    hintStyle: TextStyle(color: const Color.fromARGB(255, 138, 138, 138)));

var transactionhistory = GoogleFonts.lexend(
  fontSize: 15,
  color: const Color.fromARGB(255, 199, 196, 196),
  fontWeight: FontWeight.w400,
);

var transactionseeall = GoogleFonts.lexend(
  fontSize: 12,
  color: const Color.fromARGB(255, 199, 196, 196),
  fontWeight: FontWeight.w400,
);

var transcodeandammount = GoogleFonts.lexend(
  fontSize: 14,
  color: const Color.fromARGB(255, 255, 255, 255),
  fontWeight: FontWeight.w400,
);

var transtimeanddate = GoogleFonts.lexend(
  fontSize: 10,
  color: const Color.fromARGB(255, 190, 190, 190),
  fontWeight: FontWeight.w400,
);

var transname = GoogleFonts.lexend(
  fontSize: 12,
  color: const Color.fromARGB(255, 190, 190, 190),
  fontWeight: FontWeight.w400,
);

var balancedarrk = GoogleFonts.lexend(
  fontSize: 13,
  color: const Color.fromARGB(255, 199, 196, 196),
  fontWeight: FontWeight.w400,
);
var ammountbalance = GoogleFonts.lexend(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

const transcolorcontainerlight = Color.fromARGB(31, 255, 255, 255);

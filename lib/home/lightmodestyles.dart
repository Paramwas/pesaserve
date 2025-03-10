import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';

const backgroundcolorlight = Color.fromARGB(255, 243, 247, 250);
const freecolorlight = ContainerColor;

var tabbarnamelight = GoogleFonts.lexend(
  fontSize: 14,
  color: ContainerColor,
  fontWeight: FontWeight.w400,
);
var tabbarwelcomelight = GoogleFonts.lexend(
  fontSize: 10,
  color: const Color.fromARGB(255, 93, 93, 94),
  fontWeight: FontWeight.w400,
);

const notificationiconlight = const Color.fromARGB(255, 8, 1, 31);

var searchbarstyleslight = InputDecoration(
    fillColor: const Color.fromARGB(26, 3, 38, 66),
    filled: true,
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusColor: ContainerColor,
    border: OutlineInputBorder(
        borderSide:
            BorderSide(width: 5, color: const Color.fromARGB(255, 0, 104, 189)),
        borderRadius: BorderRadius.circular(10)),
    enabledBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: const Color.fromARGB(255, 0, 93, 168), width: 3),
        borderRadius: BorderRadius.circular(10)),
    labelStyle: problemStatement.copyWith(),
    hintText: 'Search Transaction',
    hintStyle: TextStyle(color: const Color.fromARGB(255, 138, 138, 138)));

var transactionhistorylight = GoogleFonts.lexend(
  fontSize: 15,
  color: ContainerColor,
  fontWeight: FontWeight.w400,
);

var transactionseealllight = GoogleFonts.lexend(
  fontSize: 12,
  color: const Color.fromARGB(255, 139, 139, 139),
  fontWeight: FontWeight.w400,
);

var transcodeandammountlight = GoogleFonts.lexend(
  fontSize: 14,
  color: ContainerColor,
  fontWeight: FontWeight.w400,
);

var transtimeanddatelight = GoogleFonts.lexend(
  fontSize: 10,
  color: const Color.fromARGB(255, 132, 132, 133),
  fontWeight: FontWeight.w400,
);

var transnamelight = GoogleFonts.lexend(
  fontSize: 12,
  color: const Color.fromARGB(255, 133, 133, 133),
  fontWeight: FontWeight.w400,
);

var balancedarklight = GoogleFonts.lexend(
  fontSize: 13,
  color: const Color.fromARGB(255, 49, 55, 59),
  fontWeight: FontWeight.w400,
);
var ammountbalancelight = GoogleFonts.lexend(
  fontSize: 23,
  color: ContainerColor,
  fontWeight: FontWeight.w400,
);
const transcolorcontainer = Colors.white;

const textbuttoncolor = const Color.fromARGB(255, 127, 192, 245);

var problemStatementlight = GoogleFonts.lexend(
    color: transcolorcontainer, fontWeight: FontWeight.w300, fontSize: 17);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';

var textbuttondeco = InputDecoration(
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusColor: ContainerColor,
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 5, color: ContainerColor),
        borderRadius: BorderRadius.circular(10)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ContainerColor, width: 3),
        borderRadius: BorderRadius.circular(10)),
    labelText: 'Username',
    labelStyle: problemStatement.copyWith(),
    hintText: 'username@gmail.com',
    hintStyle: TextStyle(color: ContainerColor));

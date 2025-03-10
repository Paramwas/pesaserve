import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/Transactions/individualTransaction.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget Transactionhistory(Transactionss pac, context) {
  return TextButton(
    style: TextButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 145, 189, 248),
        elevation: 6),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Individualtransaction(
                  account_no: pac.account_no,
                  time: pac.time,
                  ammount: pac.ammount,
                  date: pac.date,
                  name: pac.name,
                  Transcode: pac.Code)));
    },
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('${pac.Code}', style: transcodeandammountlight),
                Text(pac.name, style: transnamelight)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('KSH.${pac.ammount}', style: transcodeandammountlight),
                Text('${pac.date},${pac.time}', style: transtimeanddatelight)
              ],
            )
          ],
        ),
      ),
    ),
  );
}

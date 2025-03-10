import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/Transactions/individualTransaction.dart';

Widget Transactionhistorydark(Transactionss pac, context) {
  return TextButton(
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
    style: TextButton.styleFrom(
        foregroundColor: const Color.fromARGB(40, 252, 254, 255), elevation: 6),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('${pac.Code}', style: transcodeandammount),
                Text(pac.name, style: transname)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('KSH.${pac.ammount}', style: transcodeandammount),
                Text('${pac.date},${pac.time}', style: transtimeanddate)
              ],
            )
          ],
        ),
      ),
    ),
  );
}

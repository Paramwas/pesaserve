import 'package:flutter/material.dart';
import 'package:pesaserve/Transactions/transactionpage.dart';
import 'package:pesaserve/settings/settings.dart';
import 'package:pesaserve/home/home.dart';

void onTappage(int index, context, String? uid) {
  if (index == 1) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Transactionpage(uid: uid ?? 'user')));
  } else if (index == 2) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Setting(uid: uid ?? 'user')));
  } else if (index == 0) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Home(uid: uid ?? 'user')));
  }
}

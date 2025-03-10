import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/home/screenprovidehome/balanceammount.dart';
import 'package:pesaserve/transdetai/adddetails.dart';

Widget balancedark(String? usename) {
  if (usename == null || usename.isEmpty) {
    return CircularProgressIndicator();
  } else {
    return Consumer(builder: (context, ref, child) {
      final double balance = ref.watch(ammountbalanceProvider);
      final bair = ref.read(looksProvider(usename));
      bair.when(
          data: (data) {
            double mao = makes(data);

            Future.microtask(() {
              ref.read(ammountbalanceProvider.notifier).addammount(mao);
            });
          },
          error: (error, StackTrace) => print(error),
          loading: () => CircularProgressIndicator());

      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Todays Balance', style: balancedarrk),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('KSH ${balance}', style: ammountbalance),
              ],
            )
          ],
        ),
      );
    });
  }
}

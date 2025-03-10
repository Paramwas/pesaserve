import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/home/screenprovidehome/balanceammount.dart';
import 'package:pesaserve/transdetai/adddetails.dart';

Widget balance(String? usename) {
  if (usename == null || usename.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }

  return Consumer(builder: (context, ref, child) {
    final double balance = ref.watch(ammountbalanceProvider);
    final transaa = ref.watch(looksProvider(usename));

    return transaa.when(
      data: (data) {
        double mathe = makes(data);

        // Delay updating state to avoid modifying provider inside build
        Future.microtask(() {
          ref.read(ammountbalanceProvider.notifier).addammount(mathe);
        });

        return _buildBalanceUI(balance);
      },
      error: (error, stackTrace) => Center(
        child: Text(
          'Error: $error',
          style: const TextStyle(color: Colors.red),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  });
}

Widget _buildBalanceUI(double balance) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Todays Balance', style: balancedarklight)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('KSH $balance', style: ammountbalancelight)],
        ),
      ],
    ),
  );
}

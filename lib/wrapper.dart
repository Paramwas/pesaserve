import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/home/home.dart';
import 'package:pesaserve/landingpage/landing.dart';
import 'package:pesaserve/loginPage/login.dart';
import 'package:pesaserve/loginPage/provi/loginFire.dart';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class Wrappers extends ConsumerStatefulWidget {
  const Wrappers({super.key});

  @override
  ConsumerState<Wrappers> createState() => _WrappersState();
}

class _WrappersState extends ConsumerState<Wrappers> {
  @override
  Widget build(BuildContext context) {
    final waves = ref.watch(UidStateProvider);

    if (waves.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (waves.hasError) {
      return Text('error');
    }
    final taurus = waves.value;

    if (taurus == null) {
      return LoginPage();
    } else {
      return Home(uid: taurus);
    }
  }
}

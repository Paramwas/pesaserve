import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/landingpage/landing.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthServe {
  FirebaseAuth bidii = FirebaseAuth.instance;

  Future<String?> Login(String username, String password) async {
    final party = await bidii.signInWithEmailAndPassword(
        email: username, password: password);

    return People(party.user); // ✅ Safe
  }

  Future<String?> Register(String email, String password) {
    return bidii
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((Tempt) => People(Tempt.user))
        .catchError((error) => error);
  }

  String? People(User? user) {
    return user?.uid; // ✅ Safe null handling
  }

  Stream<String?> get fires {
    return bidii.authStateChanges().map(People);
  }

  Future<void> Signout() async {
    await bidii.signOut();
  }

  Future<void> ForgoPassword(String email) async {
    await bidii.sendPasswordResetEmail(email: email);
  }
}

final KnowProvider = Provider<AuthServe>((ref) => AuthServe());

final UidStateProvider = StreamProvider<String?>((ref) {
  return ref.watch(KnowProvider).fires;
});

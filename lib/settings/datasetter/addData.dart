import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddData {
  FirebaseFirestore frank = FirebaseFirestore.instance;

  Future<void> adddata(String name, String uid) async {
    final loves =
        await frank.collection('userdata').doc(uid).set({'username': name});
  }

  Future<String?> getUsername(String uid) async {
    final getusename = await frank.collection('userdata').doc(uid).get();

    if (getusename.exists) {
      return getusename
          .data()?['username']; // Assuming "username" is the correct field name
    } else {
      return "user"; // Return a default string instead of a widget
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransYoung {
  FirebaseFirestore jayz = FirebaseFirestore.instance;

  Future<void> gorgous(String trans_id, String name, String account_no,
      String date, String time, String ammount) async {
    final tx = DateTime.now().microsecondsSinceEpoch.toString();
    final youngin =
        await jayz.collection('Transactions').doc(tx.toString()).set({
      'transid': trans_id,
      'name': name,
      'account_no': account_no,
      'date': date,
      'time': time,
      'ammount': ammount,
      'sortm': tx
    });
  }
}

final looksProvider =
    StreamProvider.family<List<Transactionss>, String>((ref, username) {
  FirebaseFirestore sza = FirebaseFirestore.instance;
  return sza
      .collection('Transactions')
      .where('account_no', isEqualTo: username)
      .orderBy('sortm', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Transactionss.FromJson(doc.data()))
          .toList());
});

final homedProvider =
    StreamProvider.family<List<Transactionss>, String>((ref, username) {
  FirebaseFirestore sharna = FirebaseFirestore.instance;
  return sharna
      .collection('Transactions')
      .where('account_no', isEqualTo: username)
      .orderBy('sortm', descending: true)
      .limit(5)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((docs) => Transactionss.FromJson(docs.data()))
          .toList());
});

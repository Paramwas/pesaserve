import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class PlaceTransaction {
  FirebaseFirestore tran = FirebaseFirestore.instance;

  Future<String?> getTransactionAmount(String transid) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Transactions")
          .where("transid", isEqualTo: transid)
          .limit(1)
          .get();

      // Debugging

      if (querySnapshot.docs.isEmpty) {
        return null;
      }

      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;

      return data["ammount"]?.toString();
    } catch (e) {
      return null;
    }
  }
}

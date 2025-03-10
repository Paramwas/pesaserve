import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pesaserve/scan/class/scanclass.dart';

class GetProductDetails {
  FirebaseFirestore lanez = FirebaseFirestore.instance;

  Future<Product?> cashmo(String barcodeno) async {
    try {
      DocumentSnapshot doc =
          await lanez.collection('Products').doc(barcodeno).get();

      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        print("Product Data: $data");

        return Product(
          name: data['name'] ?? 'Unknown',
          quantity: data['quantity'] ?? '0',
          ammount: data['ammount'] ?? '0',
        );
      } else {
        print("Product not found for barcode: $barcodeno");
        return null;
      }
    } catch (e) {
      print("Error fetching product details: $e");
      return null;
    }
  }
}

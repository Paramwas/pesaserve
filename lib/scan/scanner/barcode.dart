import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/scan/class/scanclass.dart';
import 'package:pesaserve/scan/scanner/clouddetails.dart';
import 'package:pesaserve/scan/scanpage.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final MobileScannerController _controller = MobileScannerController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Product> kaigaa = [];
  bool isScanning = false;
  String? scanMessage; // NEW: Holds scan success/failure message

  void _startScanning() {
    setState(() {
      isScanning = true;
      scanMessage = null; // Reset message on new scan
    });
    _controller.start();
  }

  void _onBarcodeDetected(BarcodeCapture capture) async {
    if (isScanning && capture.barcodes.isNotEmpty) {
      String barcode = capture.barcodes.first.rawValue ?? '';
      setState(() {
        isScanning = false;
      });

      _controller.stop();

      Product? product = await _getProductDetails(barcode);
      if (product != null) {
        setState(() {
          kaiga.add(product);
          scanMessage = "Product found: ${product.name}";
        });
      } else {
        setState(() {
          scanMessage = "Product not found in database.";
        });
      }
    }
  }

  Future<Product?> _getProductDetails(String barcode) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('Products').doc(barcode).get();
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;
        return Product(
          name: data['name'] ?? 'Unknown',
          quantity: data['quantity'] ?? '0',
          ammount: data['ammount'] ?? '0',
        );
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching product details: $e");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.barcodes.listen(_onBarcodeDetected);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void fetchProductDetails(String barcode) async {
    Product? product = await GetProductDetails().cashmo(barcode);
    if (product != null) {
      setState(() {
        kaiga.add(product); // Add product to list
      });
    } else {
      print("Product not found!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: backgroundcolorlight,
          title: Text(
            'Barcode Scanner',
            style: problemStatement,
          )),
      body: Column(
        children: [
          if (scanMessage != null) // NEW: Show scan result message
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                scanMessage!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
              child: isScanning
                  ? Center(
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: MobileScanner(controller: _controller)),
                    )
                  : kaiga.isEmpty
                      ? Center(child: Text("No products scanned"))
                      : ScanPage()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _startScanning,
              child: Text(
                'Scan Barcode',
                style: problemStatement,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/textfieldDeco.dart';
import 'package:pesaserve/scan/but.dart';
import 'package:pesaserve/scan/butlight.dart';
import 'package:pesaserve/scan/class/findtotal.dart';
import 'package:pesaserve/scan/class/scanclass.dart';
import 'package:pesaserve/scan/contan.dart';
import 'package:pesaserve/scan/mounttrans.dart';
import 'package:pesaserve/scan/payment/scanfol.dart';
import 'package:pesaserve/scan/scanner/barcode.dart';
import 'package:pesaserve/scan/scanner/clouddetails.dart';
import 'package:pesaserve/setting.dart';
import 'package:pesaserve/wrapper.dart';

class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  TextEditingController cashammount = TextEditingController();
  TextEditingController mpesacode = TextEditingController();
  double total = 0.0;
  bool isExpandable = false;
  bool isExpandabled = false;

  Map<String, int> itemCounts = {};
  void updateTotal() {
    double newTotal = kaiga.fold(0.0, (sum, item) {
      int itemCount = itemCounts[item.name] ?? 1; // Default to 1
      return sum + double.parse(item.ammount) * itemCount;
    });

    setState(() {
      total = newTotal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    updateTotal();
  }

  @override
  Widget build(BuildContext context) {
    final darks = ref.watch(darkmodeProvider);
    return Scaffold(
      backgroundColor: darks ? backgroundcolorlight : backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: darks ? backgroundcolorlight : backgroundcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Items',
              style: darks ? problemStatement : problemStatementlight,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                    spacing: 20,
                    children: kaiga
                        .map((east) => Productcontain(
                              east,
                              darks,
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  itemCounts[east.name] =
                                      newQuantity; // Track quantity
                                  updateTotal(); // Recalculate total
                                });
                              },
                            ))
                        .toList()),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Total',
                  style: darks ? problemStatement : problemStatementlight),
              Text('KSH.${total.toStringAsFixed(2)}',
                  style: darks
                      ? problemStatement.copyWith(
                          fontWeight: FontWeight.w700,
                          decorationThickness: 4,
                          fontSize: 20)
                      : problemStatementlight.copyWith(
                          fontWeight: FontWeight.w700,
                          decorationThickness: 4,
                          fontSize: 20))
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              backgroundColor: darks ? butcolorlight : butcolor,
              heroTag: 'btn1',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BarcodeScannerPage()));
              },
              child: Icon(
                Icons.add,
                color: darks ? notificationicon : notificationiconlight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: darks ? butcolorlight : butcolor,
              heroTag: 'btn2',
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor:
                      darks ? backgroundcolorlight : backgroundcolor,
                  context: context,
                  isScrollControlled: true,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  builder: (context) {
                    // Wrap with StatefulBuilder to allow setState inside modal
                    return StatefulBuilder(
                      builder: (modalContext, setModalState) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                darks ? backgroundcolorlight : backgroundcolor,
                          ),
                          height: MediaQuery.of(context).size.height * 0.85,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  paymenttottal(total, context, darks),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: isExpandabled ? 200 : 200,
                                      height: isExpandabled ? 250 : 80,
                                      color: darks
                                          ? const Color.fromARGB(
                                              47, 255, 255, 255)
                                          : Color.fromARGB(19, 255, 255, 255),
                                      child: isExpandabled
                                          ? SingleChildScrollView(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextField(
                                                    style: TextStyle(
                                                        color: darks
                                                            ? Colors.black
                                                            : Colors.white),
                                                    controller: cashammount,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    decoration:
                                                        textbuttondeco.copyWith(
                                                            hintText: 'ammount',
                                                            hintStyle: TextStyle(
                                                                color: darks
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white),
                                                            labelText:
                                                                'ammount',
                                                            labelStyle: TextStyle(
                                                                color: darks
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .white)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      double enteredAmount =
                                                          double.tryParse(
                                                                  cashammount
                                                                      .text) ??
                                                              0.0;
                                                      if (enteredAmount >=
                                                          total) {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    "Popup Title"),
                                                                content: Text(
                                                                    "Ammount $total paid in cash."),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      kaiga
                                                                          .clear();
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => Wrappers())); // Closes the popup
                                                                    },
                                                                    child: Text(
                                                                        "Close"),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    "Insufficient Amount"),
                                                                content: Text(
                                                                    "Enter the full balance. You still owe ${total - enteredAmount}"),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        "Back"),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      }
                                                    },
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            buttonstylebackgroudColor),
                                                    child: Text('confirm'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setModalState(() {
                                                        isExpandabled = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            buttonstylebackgroudColor),
                                                    child: Text('cancel'),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : TextButton(
                                              onPressed: () {
                                                setModalState(() {
                                                  isExpandabled = true;
                                                });
                                              },
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      buttonstylebackgroudColor),
                                              child: Text('cash'),
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: isExpandable ? 200 : 200,
                                      height: isExpandable ? 250 : 80,
                                      color: darks
                                          ? const Color.fromARGB(
                                              19, 255, 255, 255)
                                          : Color.fromARGB(19, 255, 255, 255),
                                      child: isExpandable
                                          ? SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    style: TextStyle(
                                                        color: darks
                                                            ? Colors.black
                                                            : Colors.white),
                                                    controller: mpesacode,
                                                    decoration: textbuttondeco.copyWith(
                                                        hintText:
                                                            'Transactioncode',
                                                        hintStyle: TextStyle(
                                                            color: darks
                                                                ? Colors.black
                                                                : Colors.white),
                                                        labelText:
                                                            'Transactioncode',
                                                        labelStyle: TextStyle(
                                                            color: darks
                                                                ? Colors.black
                                                                : Colors
                                                                    .white)),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      setModalState(() {
                                                        isExpandable = false;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            buttonstylebackgroudColor),
                                                    child: Text('cancel'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextButton(
                                                      onPressed: () async {
                                                        String funn =
                                                            mpesacode.text;
                                                        String? ammou =
                                                            await PlaceTransaction()
                                                                .getTransactionAmount(
                                                                    funn);

                                                        if (ammou != null) {
                                                          if (double.parse(
                                                                  ammou) ==
                                                              total) {
                                                            return showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Total Ammount $ammou paid'),
                                                                    content: TextButton(
                                                                        onPressed: () {
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => Wrappers()));
                                                                        },
                                                                        child: Text('close')),
                                                                  );
                                                                });
                                                          } else {
                                                            return showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Balance is ${double.parse(ammou) - total}  '),
                                                                    content: Text(
                                                                        'pay ful ammount'),
                                                                  );
                                                                });
                                                          }
                                                        } else {
                                                          return showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Transaction code not found'),
                                                                  content: Text(
                                                                      'pay price'),
                                                                );
                                                              });
                                                        }
                                                      },
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              buttonstylebackgroudColor),
                                                      child: Text('confirm'))
                                                ],
                                              ),
                                            )
                                          : TextButton(
                                              onPressed: () {
                                                setModalState(() {
                                                  isExpandable = true;
                                                });
                                              },
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      buttonstylebackgroudColor),
                                              child: Text('Mpesa'),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Icon(
                Icons.done,
                color: darks ? notificationicon : notificationiconlight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

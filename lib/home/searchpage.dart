import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/Transactions/individualTransaction.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/home/screenprovidehome/transactiondata.dart';
import 'package:pesaserve/transdetai/adddetails.dart';

class OverlayWidget {
  OverlayEntry? _overlayEntry;
  List<Transactionss> _filteredItems = [];
  VoidCallback? _listener;

  void showOverlay(BuildContext context, WidgetRef ref, FocusNode focusNode,
      TextEditingController controller, String username) {
    if (_overlayEntry != null) return; // Prevent multiple overlays

    final transactionsAsyncValue = ref.watch(looksProvider(username));

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 250, // Adjust position if needed
        left: 20,
        right: 20,
        child: Material(
          color: const Color.fromARGB(255, 243, 247, 250),
          elevation: 4.0,
          child: StatefulBuilder(
            builder: (context, setState) {
              return transactionsAsyncValue.when(
                data: (transactions) {
                  _filteredItems = transactions
                      .where((transaction) => transaction.Code.toLowerCase()
                          .contains(controller.text.toLowerCase()))
                      .toList();

                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: _filteredItems.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'No transactions found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _filteredItems.map((transaction) {
                              return ListTile(
                                title: Transactionhistory(transaction, context),
                                onTap: () async {
                                  // Delay overlay removal until after navigation
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Individualtransaction(
                                        account_no: transaction.account_no,
                                        time: transaction.time,
                                        ammount: transaction.ammount,
                                        date: transaction.date,
                                        name: transaction.name,
                                        Transcode: transaction.Code,
                                      ),
                                    ),
                                  );

                                  // Remove overlay only when user comes back
                                  if (result == true) {
                                    Future.delayed(Duration(milliseconds: 100),
                                        () {
                                      removeOverlay();
                                    });
                                  }
                                },
                              );
                            }).toList(),
                          ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                      Text('Error: $err', style: TextStyle(color: Colors.red)),
                ),
              );
            },
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Update overlay when text changes
    _listener = () {
      if (_overlayEntry != null) {
        _overlayEntry!.markNeedsBuild();
      }
    };
    controller.addListener(_listener!);

    // Only remove overlay when the user manually dismisses the focus
    focusNode.addListener(() {
      if (!focusNode.hasFocus && _overlayEntry != null) {
        Future.delayed(Duration(milliseconds: 200), () {
          removeOverlay();
        });
      }
    });
  }

  void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }

    if (_listener != null) {
      _listener = null;
    }
  }
}

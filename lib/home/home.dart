import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/Transactions/transactionlistdata.dart';
import 'package:pesaserve/Transactions/transactionpage.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/home/screenprovidehome/balance.dart';
import 'package:pesaserve/home/screenprovidehome/balanceammount.dart';
import 'package:pesaserve/home/screenprovidehome/balancedark.dart';
import 'package:pesaserve/home/screenprovidehome/transactiondata.dart';
import 'package:pesaserve/home/screenprovidehome/transdarkmode.dart';
import 'package:pesaserve/home/searchpage.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/provi/loginFire.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/navigatorfuction.dart';
import 'package:pesaserve/scan/but.dart';
import 'package:pesaserve/scan/butlight.dart';
import 'package:pesaserve/scan/scanpage.dart';
import 'package:pesaserve/setting.dart';
import 'package:pesaserve/settings/datasetter/addData.dart';
import 'package:pesaserve/settings/settings.dart';
import 'package:pesaserve/transdetai/adddetails.dart';

class Home extends ConsumerStatefulWidget {
  final String uid;
  const Home({required this.uid, super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final OverlayWidget _overlayWidget = OverlayWidget();
  final FocusNode _focusNode = FocusNode();
  double ammo = 0.0;
  String? usename;
  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  List<Transactionss> allTransactions = []; // Stores all transactions
  List<Transactionss> filteredTransactions = [];
  bool showSearchPopup = false; // Stores filtered transactions

  @override
  void initState() {
    super.initState();
    // Ensure function runs after widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchUsername(widget.uid);
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayWidget.showOverlay(
            context, ref, _focusNode, _searchController, usename!);
      }
    });
  }

  Future<void> fetchUsername(String uid) async {
    final name = await AddData().getUsername(uid);
    if (!mounted) return; // Prevent calling setState if widget is disposed

    setState(() {
      usename = name;
    });
  }

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final darkss = ref.watch(darkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkss ? backgroundcolorlight : backgroundcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Hello, ${usename ?? "Guest"}',
                        style: darkss ? tabbarnamelight : tabbarname,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Welcome back',
                      style: darkss ? tabbarwelcomelight : tabbarwelcome,
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.notification_add,
              color: darkss ? notificationiconlight : notificationicon,
              size: 25,
            ),
          ],
        ),
      ),
      backgroundColor: darkss ? backgroundcolorlight : backgroundcolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(child: darkss ? balance(usename) : balancedark(usename)),
                const SizedBox(height: 40),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style:
                          darkss ? transactionhistorylight : transactionhistory,
                    ),
                    Text(
                      '',
                      style:
                          darkss ? transactionseealllight : transactionseeall,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                usename == null
                    ? const Center(child: CircularProgressIndicator())
                    : Consumer(builder: (context, ref, child) {
                        final steff = ref.watch(homedProvider(usename!));

                        return steff.when(
                          data: (transaction) {
                            if (transaction.isEmpty) {
                              allTransactions = transaction;
                              filteredTransactions = transaction;

                              return const Center(
                                child: Text(
                                  'No transactions found',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }
                            return Container(
                              padding: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: darkss
                                    ? transcolorcontainer
                                    : transcolorcontainerlight,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: transaction.map((pac) {
                                  return darkss
                                      ? Transactionhistory(pac, context)
                                      : Transactionhistorydark(pac, context);
                                }).toList(),
                              ),
                            );
                          },
                          error: (error, stackTrace) => Center(
                            child: Text(
                              'Error: $error',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor:
            darkss ? Colors.white : const Color.fromARGB(47, 255, 255, 255),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScanPage()));
        },
        child: Center(
          child: Column(
            spacing: 5,
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: darkss ? notificationiconlight : notificationicon,
              ),
              Text(
                'Scan New',
                style: darkss ? problemStatement : problemStatementlight,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: darkss ? freecolorlight : freecolordark,
        unselectedItemColor: darkss ? freecolorlight : freecolordark,
        showUnselectedLabels: true,
        backgroundColor: darkss ? backgroundcolorlight : backgroundcolor,
        selectedLabelStyle: darkss ? transname : transnamelight,
        unselectedLabelStyle: darkss ? transname : transnamelight,
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
          onTappage(index, context, widget.uid);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/Transactions/transactionlistdata.dart';
import 'package:pesaserve/home/class/transaction.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/home/screenprovidehome/balanceammount.dart';
import 'package:pesaserve/home/screenprovidehome/transactiondata.dart';
import 'package:pesaserve/home/screenprovidehome/transdarkmode.dart';
import 'package:pesaserve/home/searchpage.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/navigatorfuction.dart';
import 'package:pesaserve/setting.dart';
import 'package:pesaserve/transdetai/adddetails.dart';
import 'package:pesaserve/settings/datasetter/addData.dart';

class Transactionpage extends ConsumerStatefulWidget {
  final String uid;
  const Transactionpage({required this.uid, super.key});

  @override
  ConsumerState<Transactionpage> createState() => _TransactionpageState();
}

class _TransactionpageState extends ConsumerState<Transactionpage> {
  final OverlayWidget _overlayWidget = OverlayWidget();
  List<Transactionss> allTransactions = []; // Stores all transactions
  List<Transactionss> filteredTransactions = [];
  bool showSearchPopup = false;
  final FocusNode _focusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();
  int currentindex = 1;
  String? usename;
  @override
  void initState() {
    // TODO: implement initState

    ussename(widget.uid);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ussename(widget.uid);
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayWidget.showOverlay(
            context, ref, _focusNode, _searchController, usename!);
      }
    });
  }

  Future<void> ussename(String uid) async {
    final name = await AddData().getUsername(uid);

    setState(() {
      usename = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final darks = ref.watch(darkmodeProvider);
    return Scaffold(
      backgroundColor: darks ? backgroundcolorlight : backgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darks ? backgroundcolorlight : backgroundcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Transactions',
              style: darks ? problemStatement : problemStatementlight,
            ),
          ],
        ),
      ),
      body: usename == null
          ? Center(child: CircularProgressIndicator())
          : Consumer(builder: (context, ref, child) {
              final transaa = ref.watch(looksProvider(usename!));

              return transaa.when(
                  data: (transaction) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Stack(
                                  children: [
                                    TextField(
                                      focusNode: _focusNode,
                                      controller: _searchController,
                                      decoration: darks
                                          ? searchbarstyleslight
                                          : searchbarstyles,
                                      style: darks
                                          ? transactionhistorylight
                                          : transactionhistory,
                                    ),

                                    // Display search pop-up when user types
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
                            child: Container(
                              padding:
                                  EdgeInsets.only(top: 15, left: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: darks
                                      ? transcolorcontainer
                                      : transcolorcontainerlight,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: transaction
                                    .map((pac) => darks
                                        ? Transactionhistory(pac, context)
                                        : Transactionhistorydark(pac, context))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  error: (error, StackTrace) {
                    print(error);
                    return Center(
                      child: Text('error $error'),
                    );
                  },
                  loading: () => CircularProgressIndicator());
            }),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: darks
            ? freecolorlight
            : freecolordark, // Ensures selected label is white
        unselectedItemColor: darks ? freecolorlight : freecolordark,
        showUnselectedLabels: true,
        backgroundColor: darks ? backgroundcolorlight : backgroundcolor,
        selectedLabelStyle: transname,
        unselectedLabelStyle: transname,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
          onTappage(index, context, widget.uid);
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: darks ? notificationiconlight : notificationicon,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: darks ? notificationiconlight : notificationicon,
              ),
              label: 'Transactions'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: darks ? notificationiconlight : notificationicon,
              ),
              label: 'Settings'),
        ],
        currentIndex: currentindex,
      ),
    );
  }
}

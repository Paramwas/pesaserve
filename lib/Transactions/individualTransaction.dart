import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/setting.dart';
import 'package:google_fonts/google_fonts.dart';

class Individualtransaction extends ConsumerStatefulWidget {
  final String time;
  final String date;
  final String ammount;
  final String name;
  final String Transcode;
  final String account_no;
  const Individualtransaction(
      {required this.time,
      required this.account_no,
      required this.ammount,
      required this.date,
      required this.name,
      required this.Transcode,
      super.key});

  @override
  ConsumerState<Individualtransaction> createState() =>
      _IndividualtransactionState();
}

class _IndividualtransactionState extends ConsumerState<Individualtransaction> {
  @override
  Widget build(BuildContext context) {
    final darkss = ref.watch(darkmodeProvider);
    return Scaffold(
      backgroundColor: darkss ? backgroundcolorlight : backgroundcolor,
      appBar: AppBar(
        backgroundColor: darkss ? backgroundcolorlight : backgroundcolor,
        title: Center(
          child: Text(
            '${widget.time},${widget.date}',
            style: darkss ? problemStatement : problemStatementlight,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Card(
                  margin: EdgeInsets.only(top: 5, bottom: 50),
                  color: darkss
                      ? const Color.fromARGB(239, 255, 255, 255)
                      : const Color.fromARGB(26, 255, 255, 255),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 30, right: 10, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'NAME',
                          style: darkss
                              ? GoogleFonts.lexend(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: const Color.fromARGB(255, 20, 20, 20))
                              : problemStatementlight,
                        ),
                        Text(
                          widget.name,
                          style: darkss
                              ? GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: const Color.fromARGB(255, 24, 24, 24))
                              : problemStatementlight,
                        ),
                        Text(
                          '+ KSH .${widget.ammount}.00',
                          style: GoogleFonts.lexend(
                              color: darkss ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 35),
                        ),
                        Text(
                          'ID: ${widget.Transcode}',
                          style: GoogleFonts.lexend(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 56, 182, 6)),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'PAY BILL AC NO',
                                  style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: darkss
                                          ? Colors.black
                                          : const Color.fromARGB(
                                              255, 206, 204, 204)),
                                ),
                              ],
                            ),
                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${widget.account_no}',
                                  style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                      color: darkss
                                          ? const Color.fromARGB(255, 0, 0, 0)
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

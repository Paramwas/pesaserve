import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/login.dart';
import 'package:pesaserve/wrapper.dart';

class LandinPage extends ConsumerStatefulWidget {
  const LandinPage({super.key});

  @override
  ConsumerState<LandinPage> createState() => _LandinPageState();
}

class _LandinPageState extends ConsumerState<LandinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                color: ContainerColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Center(
              child: Text(
                'PESASERVE',
                style: headingTextStyle,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'simplifies digital transactions to process payments',
              style: problemStatement,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wrappers()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: buttonstylebackgroudColor),
              child: Text(
                'Get Started',
                style: problemStatement,
              )),
          Text('')
        ]));
  }
}

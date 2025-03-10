import 'package:flutter/material.dart';
import 'package:pesaserve/transdetai/adddetails.dart';

class Playy extends StatefulWidget {
  const Playy({super.key});

  @override
  State<Playy> createState() => _PlayyState();
}

class _PlayyState extends State<Playy> {
  String account_na = 'KCD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        TextField(),
        TextField(),
        TextField(),
        Text('letsjust add'),
        TextButton(
            onPressed: () async {
              final transcode = 'TXSEQ';
              final ammount = '500';
              final name = 'westrn';
              final time = '12:43 PM';
              final date = '12 Feb';

              final account_no = 'KCD';
              await TransYoung()
                  .gorgous(transcode, name, account_no, date, time, ammount);
            },
            child: Text('palyd')),
      ],
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/setting.dart';
import 'package:pesaserve/settings/datasetter/addData.dart';

class Proffil extends ConsumerStatefulWidget {
  final String uid;
  const Proffil({required this.uid, super.key});

  @override
  ConsumerState<Proffil> createState() => _ProffilState();
}

class _ProffilState extends ConsumerState<Proffil> {
  final _form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final darkman = ref.watch(darkmodeProvider);
    return Scaffold(
      backgroundColor: darkman ? backgroundcolorlight : backgroundcolor,
      appBar: AppBar(
        backgroundColor: darkman ? backgroundcolorlight : backgroundcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Edit infomation',
              style: darkman ? problemStatement : problemStatementlight,
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                foregroundColor: darkman ? ContainerColor : ContainerColor,
                backgroundColor: const Color.fromARGB(255, 62, 85, 104),
                child: Icon(
                  Icons.face_2_outlined,
                  color: darkman ? notificationicon : notificationiconlight,
                  size: 70,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.75,
                child: Form(
                  key: _form,
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a username';
                        }
                      },
                      controller: name,
                      decoration:
                          darkman ? searchbarstyleslight : searchbarstyles,
                      style: darkman
                          ? transactionhistorylight
                          : transactionhistory),
                ),
              ),
            ],
          ),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: textbuttoncolor),
              onPressed: () async {
                final usename = name.text;

                if (_form.currentState!.validate()) {
                  final results = await AddData().adddata(usename, widget.uid);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('username set sucessfully')));
                }
              },
              child: Text(
                'save',
                style: darkman ? problemStatement : problemStatementlight,
              )),
        ],
      )),
    );
  }
}

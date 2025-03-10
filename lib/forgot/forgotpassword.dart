import 'package:flutter/material.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/login.dart';
import 'package:pesaserve/loginPage/provi/loginFire.dart';
import 'package:pesaserve/loginPage/textfieldDeco.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'forgot password',
            style: problemStatement,
          ),
        ),
        body: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                      controller: username,
                      style: TextStyle(color: ContainerColor),
                      decoration: textbuttondeco),
                ),
                TextButton(
                    onPressed: () async {
                      final email = username.text;
                      await AuthServe().ForgoPassword(email);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: backgroundcolorlight,
                          content: Text(
                            'code sent to email',
                            style: problemStatement,
                          )));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    style: TextButton.styleFrom(
                        elevation: 3.0,
                        backgroundColor: buttonstylebackgroudColor),
                    child: Text(
                      'Submit',
                      style: problemStatement,
                    ))
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/forgot/forgotpassword.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/provi/loginFire.dart';
import 'package:pesaserve/loginPage/textfieldDeco.dart';
import 'package:pesaserve/registerpage/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var repo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PESASERVE',
                    style: headingTextStyle.copyWith(color: ContainerColor),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Powering Business Payments.',
                    style: problemStatement,
                  ),
                ],
              ),
            ],
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: email,
                    style: TextStyle(color: ContainerColor),
                    decoration: textbuttondeco),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                    controller: password,
                    style: TextStyle(color: ContainerColor),
                    decoration: textbuttondeco.copyWith(
                        labelText: 'Password', hintText: 'password')),
              ),
              Text(
                repo,
                style: problemStatement,
              )
            ],
          )),
          TextButton(
              onPressed: () async {
                final emal = email.text;
                final pasword = password.text;
                try {
                  var results = await AuthServe().Login(emal, pasword);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: backgroundcolorlight,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        'Login Successful',
                        style: problemStatement,
                      )));
                  setState(() {
                    repo != results; // Update the repository data
                    // Clear error if login is successful
                  });
                } catch (e) {
                  setState(() {
                    final String leggs = 'Wrong password or username';
                    repo = leggs; // Store error message
                  });
                }
              },
              style: TextButton.styleFrom(
                  elevation: 3.0, backgroundColor: buttonstylebackgroudColor),
              child: Text(
                'Login',
                style: problemStatement,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Forgotpassword()));
                  },
                  child: Text(
                    'FORGOT PASSWORD',
                    style: problemStatement,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    'REGISTER',
                    style: problemStatement,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

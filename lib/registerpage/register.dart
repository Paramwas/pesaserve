import 'package:flutter/material.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/login.dart';
import 'package:pesaserve/loginPage/provi/loginFire.dart';
import 'package:pesaserve/loginPage/textfieldDeco.dart';
import 'package:pesaserve/wrapper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var results = '';
  void _register() async {
    if (_formkey.currentState!.validate()) {
      final String userName = username.text;
      final String passWord = password.text;

      try {
        var micky = await AuthServe().Register(userName, passWord);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Wrappers()));
        setState(() {
          results != micky;
        });
      } catch (e) {
        setState(() {
          results = 'Username exists';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'REGISTER',
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password canot be empty';
                    } else if (value.length < 6) {
                      return 'minimum 6 characters';
                    }
                  },
                  controller: password,
                  style: TextStyle(color: ContainerColor),
                  decoration: textbuttondeco.copyWith(
                      labelText: 'password', hintText: 'password')),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                  validator: (value) {
                    if (value != password.text) {
                      return 'Password not same';
                    }
                  },
                  style: TextStyle(color: ContainerColor),
                  decoration: textbuttondeco.copyWith(
                      labelText: 'Confirm password', hintText: 'password')),
            ),
            TextButton(
                onPressed: _register,
                style: TextButton.styleFrom(
                    elevation: 3.0, backgroundColor: buttonstylebackgroudColor),
                child: Text(
                  'REGISTER',
                  style: problemStatement,
                )),
            Text(
              results,
              style: problemStatement,
            )
          ],
        ),
      ),
    );
  }
}

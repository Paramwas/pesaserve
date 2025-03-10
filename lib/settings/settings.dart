import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/landing.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/loginPage/provi/loginFire.dart';
import 'package:pesaserve/home/darkmodestyles.dart';
import 'package:pesaserve/home/lightmodestyles.dart';
import 'package:pesaserve/landingpage/styless/colorsInlandingpage.dart';
import 'package:pesaserve/navigatorfuction.dart';
import 'package:pesaserve/setting.dart';
import 'package:pesaserve/settings/profileset.dart';
import 'package:pesaserve/transdetai/play.dart';

class Setting extends ConsumerStatefulWidget {
  final String uid;
  const Setting({required this.uid, super.key});

  @override
  ConsumerState<Setting> createState() => _SettingState();
}

class _SettingState extends ConsumerState<Setting> {
  int _currentindex = 2;
  @override
  Widget build(BuildContext context) {
    final authtoken = ref.watch(UidStateProvider);
    final token = authtoken.value;

    final darkman = ref.watch(darkmodeProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: darkman
            ? freecolorlight
            : freecolordark, // Ensures selected label is white
        unselectedItemColor: darkman ? freecolorlight : freecolordark,
        showUnselectedLabels: true,
        backgroundColor: darkman ? backgroundcolorlight : backgroundcolor,
        selectedLabelStyle: transname,
        unselectedLabelStyle: transname,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
          onTappage(index, context, widget.uid);
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: darkman ? notificationiconlight : notificationicon,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: darkman ? notificationiconlight : notificationicon,
              ),
              label: 'Transactions'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: darkman ? notificationiconlight : notificationicon,
              ),
              label: 'Settings'),
        ],
        currentIndex: _currentindex,
      ),
      backgroundColor: darkman ? backgroundcolorlight : backgroundcolor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 30,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'settings',
                style: darkman ? problemStatement : problemStatementlight,
              ),
            ],
          ),
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
              TextButton.icon(
                style: TextButton.styleFrom(
                    foregroundColor:
                        darkman ? textbuttoncolor : textbuttoncolor),
                onPressed: () {
                  ref.read(darkmodeProvider.notifier).toogle();
                },
                label: Text(
                  'light mode',
                  style: darkman ? problemStatement : problemStatementlight,
                ),
                icon: darkman
                    ? Icon(
                        Icons.light_mode,
                        color: notificationiconlight,
                      )
                    : Icon(
                        Icons.dark_mode,
                        color: notificationicon,
                      ),
              ),
            ],
          ),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: textbuttoncolor),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Proffil(uid: token!)));
              },
              child: Text(
                'add details',
                style: darkman ? problemStatement : problemStatementlight,
              )),
          TextButton(
              style: TextButton.styleFrom(foregroundColor: textbuttoncolor),
              onPressed: () async {
                await AuthServe().Signout();
                ref.watch(UidStateProvider);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandinPage()));
              },
              child: Text(
                'Logout',
                style: darkman ? problemStatement : problemStatementlight,
              ))
        ],
      )),
    );
  }
}

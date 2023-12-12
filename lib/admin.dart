import 'package:flutter/material.dart';
import 'constants.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  Future<bool> adminLogOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('email');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: AppBar(
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        title: Text(
          'SM Internet Service Providers',
          style: TextStyle(
            color: kFontGoldColor,
            fontFamily: 'Northwell',
            fontSize: mediaQuery.size.width * 0.07,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBackGroundMaroonColor,
                  elevation: 30.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'reqBoardBand');
                },
                child: Text(
                  'BoardBand Request',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBackGroundMaroonColor,
                  elevation: 30.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'reqDth');
                },
                child: Text(
                  'DTH Request',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 1.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBackGroundMaroonColor,
                  elevation: 30.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'internetusage');
                },
                child: Text(
                  'Internet Usage By Users',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBackGroundMaroonColor,
                  elevation: 30.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'adminbilling');
                },
                child: Text(
                  "User's Bills",
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBackGroundMaroonColor,
                  elevation: 30.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'admininvoice');
                },
                child: Text(
                  "User's Invoice",
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.width * 0.06,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.06,
              width: mediaQuery.size.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  elevation: 30.0,
                ),
                onPressed: () {
                  Auth().signOut();
                  adminLogOut().then((value) {
                    if (value == true) {
                      Navigator.pushReplacementNamed(context, 'signin');
                    }
                  });
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'MPIDeco',
                    color: Colors.white,
                    fontSize: mediaQuery.size.width * 0.05,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

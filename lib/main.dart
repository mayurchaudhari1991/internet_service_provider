import 'package:flutter/material.dart';
import 'package:shubhtoursandtravels/internetusage.dart';
import 'adminbilling.dart';
import 'admininvoice.dart';
import 'userbilling.dart';
import 'userinvoice.dart';
import 'viewprofile.dart';
import 'homepage.dart';
import 'aboutus.dart';
import 'boardbandplans.dart';
import 'dthplans.dart';
import 'signin.dart';
import 'signup.dart';
import 'allthree.dart';
import 'splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'admin.dart';
import 'reqDth.dart';
import 'reqBoardBand.dart';
import 'custTourReq.dart';
import 'recommendPackage.dart';
import 'internetusage.dart';

void main() {
  runApp(const RoutesClass());
}

class RoutesClass extends StatelessWidget {
  const RoutesClass({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splashscreen',
      routes: {
        'splashscreen': (context) => SplashScreen(),
        'homepage': (context) => const HomePage(),
        'aboutus': (context) => const AboutUs(),
        'boardbandplans': (context) => const BoardBandPlans(),
        'dthplans': (context) => const DTHPlans(),
        'signin': (context) => const SignIn(),
        'signup': (context) => const SignUp(),
        'allthree': (context) => const ThreeOptions(),
        'admin': (context) => const AdminPage(),
        'reqDth': (context) => const RequestDTH(),
        'reqBoardBand': (context) => const RequestBoardBand(),
        'custTourReq': (context) => const CustomerTourRequest(),
        'recommendPackage': (context) => const RecommendPackage(),
        'viewProfile': (context) => const ViewProfile(),
        'userbilling': (context) => const BillingUser(),
        'adminbilling': (context) => const BillingAdmin(),
        'userinvoice': (context) => const InvoiceUser(),
        'admininvoice': (context) => const InvoiceAdmin(),
        'internetusage': (context) => InternetUsage(),
      },
    );
  }
}//

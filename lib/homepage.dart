import 'package:flutter/material.dart';
import 'constants.dart';
import 'destinationCard.dart';
import 'topappbar.dart';
import 'auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int buttonIndex = 0;
  void getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString('email').toString();
    print(email);
    if (email.isNotEmpty) {
      index = 0;
    } else {
      index = 1;
    }
  }

  void removeUserPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("email");
  }

  @override
  void initState() {
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackGroundMaroonColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
          child: TopAppBar(),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 320.0,
                child: Container(
                  color: kBackGroundMaroonColor,
                  child: DrawerHeader(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/LogoForApp.png',
                          height: 200.0,
                          width: 190.0,
                        ),
                        Text(
                          'SM Internet Service Providers',
                          style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.05,
                            color: kFontGoldColor,
                            fontFamily: 'Northwell',
                          ),
                        ),
                        Text(
                          'Book Plan Today',
                          style: TextStyle(
                            fontSize: mediaQuery.size.width * 0.03,
                            color: kFontGoldColor,
                            fontFamily: 'MPIDeco',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.account_circle),
                text: 'View Profile',
                nextPage: 'viewProfile',
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.airplanemode_active_sharp),
                text: 'Plans',
                nextPage: 'allthree',
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.receipt),
                text: 'Billing',
                nextPage: 'userbilling',
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.note),
                text: 'Invoice',
                nextPage: 'userinvoice',
              ),
              const DrawerTile(
                firstIcon: Icon(Icons.question_mark),
                text: 'About Us',
                nextPage: 'aboutus',
              ),
              Visibility(
                visible: buttonIndex == 0 ? true : false,
                child: ListTile(
                  title: TextButton(
                    onPressed: () {
                      setState(() {
                        Auth().signOut();
                        buttonIndex = 1;
                        removeUserPreference();
                      });
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: mediaQuery.size.height * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: buttonIndex == 1 ? true : false,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'signin');
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: mediaQuery.size.height * 0.02,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: mediaQuery.size.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(kBackGroundMaroonColor),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'boardbandplans');
                      },
                      child: Text(
                        'BoardBand Plans',
                        style: TextStyle(
                          fontFamily: 'MPIDeco',
                          color: kFontGoldColor,
                          fontSize: mediaQuery.size.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DestinationCard(
                  destination: 'Elite',
                  imagepath: 'images/Elite.jpeg',
                  destinationText:
                      "30 mbps      upto 3300 Gb 2 mbps unlimited,                      30 Days,            ₹399 ",
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.03,
                ),
                const DestinationCard(
                  destination: 'Premium Elite',
                  destinationText:
                      "50 mbps      upto 3300 Gb 2 mbps unlimited,                      30 Days,            ₹599 ",
                  imagepath: 'images/Premium Elite.jpeg',
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.03,
                ),
                const DestinationCard(
                  destination: 'Supreme Elite',
                  destinationText:
                      "100 mbps      upto 3300 Gb 2 mbps unlimited,                      30 Days,            ₹799 ",
                  imagepath: 'images/Suprime Elite.jpeg',
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: mediaQuery.size.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(kBackGroundMaroonColor),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'dthplans');
                      },
                      child: Text(
                        'DTH Plans',
                        style: TextStyle(
                          fontFamily: 'MPIDeco',
                          color: kFontGoldColor,
                          fontSize: mediaQuery.size.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DestinationCard(
                  destination: 'Airtel Digital Hindi Pack',
                  imagepath: 'images/airtel.jpeg',
                  destinationText:
                      """Channels: 189               Hd Channels: 35             Price: ₹299. Duration: 1 Month.""",
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.03,
                ),
                const DestinationCard(
                  destination: 'Dish TV Hindi Premium',
                  destinationText:
                      """Channels: 189               Hd Channels: 35             Price: ₹299. Duration: 1 Month.""",
                  imagepath: 'images/dishtv.jpeg',
                ),
                SizedBox(
                  width: mediaQuery.size.width * 0.03,
                ),
                const DestinationCard(
                  destination: 'Videocon D2h Hindi Combo',
                  destinationText:
                      """Channels: 189               Hd Channels: 35             Price: ₹299. Duration: 1 Month.""",
                  imagepath: 'images/videocon.jpeg',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {super.key,
      required this.firstIcon,
      required this.text,
      required this.nextPage});

  final Icon? firstIcon;
  final String? text;
  final String? nextPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: firstIcon!,
      title: Text(text!,
          style: const TextStyle(
            fontSize: 16.0,
          )),
      trailing: TextButton(
        style: const ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(kBackGroundMaroonColor),
        ),
        onPressed: () {
          Navigator.pushNamed(context, nextPage!);
        },
        child: const Icon(
          Icons.arrow_forward_ios_sharp,
        ),
      ),
    );
  }
}

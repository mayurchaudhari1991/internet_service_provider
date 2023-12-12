import 'package:flutter/material.dart';
import 'constants.dart';
import 'topappbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.076),
        child: TopAppBar(),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 40.0,
            ),
            child: Text(
              'About Us',
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.06,
                fontFamily: 'MPIDeco',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              """Welcome to SM Internet Service Providers, your ultimate destination for high-speed internet and entertainment solutions, available 24/7. Established with a commitment to delivering exceptional connectivity and entertainment experiences, we take pride in offering a wide range of broadband plans and DTH (Direct-to-Home) packages to meet all your digital needs.
              \nAt SM Internet Service Providers, we believe that the internet and entertainment are not just utilities; they're essential elements of modern living. Whether you're looking for lightning-fast broadband for seamless online experiences or a diverse selection of DTH plans for your entertainment pleasure, we have it all tailored to your preferences.
              \nOur dedicated team of experts is here to assist you in choosing the perfect broadband and DTH packages that align with your requirements and budget. We understand that staying connected and entertained is crucial, and we strive to make it effortless for you.
              \nWe aim to be your trusted partner in the digital world, offering transparent and reliable services that cater to your connectivity and entertainment needs. With our attention to detail and commitment to customer satisfaction, you can enjoy uninterrupted browsing and immersive entertainment, knowing that you're in capable hands.
              \nJoin us as we open the door to a world of high-speed connectivity and entertainment options. Let's embark on this digital journey together, creating a seamless and enjoyable online experience with SM Internet Service Providers.""",
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.026,
              ),
            ),
          ),
          Text(
            'The Team',
            style: TextStyle(
              color: kFontGoldColor,
              fontFamily: 'MPIDeco',
              fontSize: mediaQuery.size.width * 0.06,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: kBackGroundMaroonColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: mediaQuery.size.width * 0.09,
                        foregroundImage:
                            const AssetImage('images/ShubhProfile.jpeg'),
                      ),
                      Text(
                        'Mayur Chaudhari -CEO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: mediaQuery.size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: kBackGroundMaroonColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: mediaQuery.size.width * 0.09,
                        foregroundImage: AssetImage(''),
                        backgroundColor: Colors.black,
                        child: Text(
                          '? ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        ' -CTO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: mediaQuery.size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: kBackGroundMaroonColor,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: mediaQuery.size.width * 0.09,
                        foregroundImage: AssetImage(''),
                        backgroundColor: Colors.black,
                        child: Text(
                          '? ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Text(
                        ' -COO',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: mediaQuery.size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

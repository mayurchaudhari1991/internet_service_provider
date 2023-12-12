import 'package:flutter/material.dart';
import 'constants.dart';
import 'topappbar.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  // Define the profile details
  final String name = 'Mayur Chaudhari';
  final String number = '7066363692';
  final String address =
      '505, Parthiv Emerland, Nahre'; // Update with actual address
  final String imagePath =
      'images/ShubhProfile.jpeg'; // Update with the image path

  // Dummy data for book plan status
  final bool isBroadbandPlanBooked = true;
  final String broadbandPlanName = 'Gold Broadband Plan';
  final String broadbandPlanExpiryDate = 'November 30, 2023';

  final bool isDTHPlanBooked = true;
  final String dthPlanName = 'Premium DTH Plan';
  final String dthPlanExpiryDate = 'December 15, 2023';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 40.0,
            ),
            child: CircleAvatar(
              radius: mediaQuery.size.width * 0.2,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          SizedBox(
            height: 160,
          ),
          // Name
          Text(
            name,
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: mediaQuery.size.width * 0.06,
              fontFamily: 'MPIDeco',
            ),
          ),
          // Number
          Text(
            number,
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: mediaQuery.size.width * 0.026,
            ),
          ),
          // Address
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              address,
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.026,
              ),
            ),
          ),
          // Broadband Plan Status
          if (isBroadbandPlanBooked)
            _buildPlanStatusTable(
              context,
              'Broadband Plan',
              broadbandPlanName,
              broadbandPlanExpiryDate,
            ),
          // DTH Plan Status
          if (isDTHPlanBooked)
            _buildPlanStatusTable(
                context, 'DTH Plan', dthPlanName, dthPlanExpiryDate),
        ],
      ),
    );
  }

  Widget _buildPlanStatusTable(
    BuildContext context,
    String planType,
    String planName,
    String expiryDate,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$planType Status:',
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Plan Name: $planName',
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: 16,
            ),
          ),
          Text(
            'Expiry Date: $expiryDate',
            style: TextStyle(
              color: kFontGoldColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

// Define your custom colors
const Color kBackGroundMaroonColor = Color(0xFF800000);
const Color kFontGoldColor = Color(0xFFFFD700);

void main() {
  runApp(const RoutesClass());
}

class RoutesClass extends StatelessWidget {
  const RoutesClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'dthplans',
      routes: {
        'dthplans': (context) => const DTHPlans(),
      },
    );
  }
}

class DTHPlans extends StatefulWidget {
  const DTHPlans({super.key});

  @override
  State<DTHPlans> createState() => _DTHPlansState();
}

class _DTHPlansState extends State<DTHPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DTH Plans',
          style: TextStyle(
            color: kFontGoldColor,
          ),
        ),
        backgroundColor: kBackGroundMaroonColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var plan in dthPlans)
              DTHPlanCard(
                plan: plan,
                onPressed: () {
                  showRequestDialog(context, plan.name);
                },
              ),
          ],
        ),
      ),
    );
  }

  void showRequestDialog(BuildContext context, String planName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request $planName Plan'),
          content: Text(
              'Your request for the $planName plan has been submitted. We will be in touch soon.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class DTHPlan {
  final String name;
  final String details;

  DTHPlan({
    required this.name,
    required this.details,
  });
}

class DTHPlanCard extends StatelessWidget {
  final DTHPlan plan;
  final VoidCallback onPressed;

  DTHPlanCard({required this.plan, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                plan.name,
                style: TextStyle(
                  fontSize: mediaQuery.size.height * 0.025,
                  color: kFontGoldColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.015),
              Text(
                plan.details,
                style: TextStyle(
                  fontSize: mediaQuery.size.height * 0.022,
                  color: kFontGoldColor,
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              ElevatedButton(
                onPressed: onPressed,
                child: const Text(
                  'Request Plan',
                  style: TextStyle(
                    color: kFontGoldColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: kBackGroundMaroonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define your DTH plans here
List<DTHPlan> dthPlans = [
  DTHPlan(
    name: 'Airtel Digital Hindi Pack',
    details: 'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
  ),
  DTHPlan(
    name: 'Dish TV Hindi Premium',
    details: 'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
  ),
  DTHPlan(
    name: 'Videocon D2h Hindi Combo',
    details: 'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
  ),
  DTHPlan(
    name: 'Tata Sky South Special',
    details: 'Channels: 200 Hd Channels: 40 Price: ₹349. Duration: 1 Month.',
  ),
  DTHPlan(
    name: 'Sun Direct Tamil Pack',
    details: 'Channels: 180 Hd Channels: 30 Price: ₹249. Duration: 1 Month.',
  ),
  DTHPlan(
    name: 'D2h Tamil Platinum Combo',
    details: 'Channels: 220 Hd Channels: 50 Price: ₹399. Duration: 1 Month.',
  ),
];

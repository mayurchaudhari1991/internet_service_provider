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
      initialRoute: 'boardbandplans',
      routes: {
        'boardbandplans': (context) => const BoardBandPlans(),
      },
    );
  }
}

class BoardBandPlans extends StatefulWidget {
  const BoardBandPlans({super.key});

  @override
  State<BoardBandPlans> createState() => _BoardBandPlansState();
}

class _BoardBandPlansState extends State<BoardBandPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BoardBand Plans',
          style: TextStyle(
            color: kFontGoldColor, // Apply gold color to the app bar text
          ),
        ),
        backgroundColor:
            kBackGroundMaroonColor, // Apply maroon color to the app bar background
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var plan in boardBandPlans)
              PlanCard(
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

class BoardBandPlan {
  final String name;
  final String details;

  BoardBandPlan({
    required this.name,
    required this.details,
  });
}

class PlanCard extends StatelessWidget {
  final BoardBandPlan plan;
  final VoidCallback onPressed;

  PlanCard({required this.plan, required this.onPressed});

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
                  color: kFontGoldColor, // Apply gold color to the text
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.015),
              Text(
                plan.details,
                style: TextStyle(
                  fontSize: mediaQuery.size.height * 0.022,
                  color: kFontGoldColor, // Apply gold color to the text
                ),
              ),
              SizedBox(height: mediaQuery.size.height * 0.02),
              ElevatedButton(
                onPressed: onPressed,
                child: const Text(
                  'Request Plan',
                  style: TextStyle(
                    color:
                        kFontGoldColor, // Apply gold color to the button text
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary:
                      kBackGroundMaroonColor, // Apply maroon color to the button background
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define your board band plans here
List<BoardBandPlan> boardBandPlans = [
  BoardBandPlan(
    name: 'Elite',
    details: '30 Mbps upto 3300 GB, 2 Mbps unlimited, 30 Days, ₹399',
  ),
  BoardBandPlan(
    name: 'Premium Elite',
    details: '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
  ),
  BoardBandPlan(
    name: 'Supreme Elite',
    details: '100 Mbps upto 5000 GB, 10 Mbps unlimited, 30 Days, ₹799',
  ),
  BoardBandPlan(
    name: 'Ultra Pro',
    details: '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
  ),
  BoardBandPlan(
    name: 'Extreme Speed',
    details: '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
  ),
  BoardBandPlan(
    name: 'Gigabit Plus',
    details: '1000 Mbps upto 10000 GB, 50 Mbps unlimited, 30 Days, ₹1499',
  ),
];

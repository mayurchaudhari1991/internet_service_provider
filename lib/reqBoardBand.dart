import 'package:flutter/material.dart';
import 'dart:math';

class RequestBoardBand extends StatefulWidget {
  const RequestBoardBand({Key? key});

  @override
  State<RequestBoardBand> createState() => _RequestBoardBandState();
}

class _RequestBoardBandState extends State<RequestBoardBand> {
  List<Map<String, dynamic>> broadbandRequests = [
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Elite',
      'details': 'Speed: 100 Mbps Price: ₹599. Duration: 1 Month.',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Premium Elite',
      'details': 'Speed: 200 Mbps Price: ₹799. Duration: 1 Month.',
    },
    {
      'userName': 'Aditya Verma',
      'email': 'aditya.verma@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Supreme Elite',
      'details': 'Speed: 250 Mbps Price: ₹999. Duration: 1 Month.',
    },
    {
      'userName': 'Ananya Gupta',
      'email': 'ananya.gupta@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Supreme Elite',
      'details': 'Speed: 500 Mbps Price: ₹1499. Duration: 1 Month.',
    },
    {
      'userName': 'Aarush Kumar',
      'email': 'aarush.kumar@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Gigabit Plus',
      'details': 'Speed: 100 Mbps Price: ₹899. Duration: 1 Month.',
    },
    {
      'userName': 'Avani Singh',
      'email': 'avani.singh@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Ultra Pro',
      'details': 'Speed: 50 Mbps Price: ₹399. Duration: 1 Month.',
    },
    {
      'userName': 'Arjun Sharma',
      'email': 'arjun.sharma@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Extreme Speed',
      'details': 'Speed: 75 Mbps Price: ₹499. Duration: 1 Month.',
    },
    // Repeated plans with different user names, emails, and request dates
    {
      'userName': 'Akshay Patel',
      'email': 'akshay.patel@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Ultra Pro',
      'details': 'Speed: 300 Mbps Price: ₹1199. Duration: 1 Month.',
    },
    {
      'userName': 'Anika Singh',
      'email': 'anika.singh@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Elite',
      'details': 'Speed: 50 Mbps Price: ₹299. Duration: 1 Month.',
    },
    {
      'userName': 'Aarav Gupta',
      'email': 'aarav.gupta@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Ultra Pro',
      'details': 'Speed: 100 Mbps Price: ₹499. Duration: 1 Month.',
    },
    {
      'userName': 'Anaya Sharma',
      'email': 'anaya.sharma@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Gigabit Plus',
      'details': 'Speed: 300 Mbps Price: ₹899. Duration: 1 Month.',
    },
    // Repeated plans with different user names, emails, and request dates
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Elite',
      'details': 'Speed: 100 Mbps Price: ₹599. Duration: 1 Month.',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'requestDate': getRandomDate(),
      'planName': 'Premium Elite',
      'details': 'Speed: 200 Mbps Price: ₹799. Duration: 1 Month.',
    },
    // Add more repeated plans as needed...
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Broadband Plan Requests - Admin',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var request in broadbandRequests)
              AdminBroadbandPlanCard(
                request: request,
                onApprove: () {
                  approveRequest(context, request);
                },
                onReject: () {
                  rejectRequest(context, request);
                },
              ),
          ],
        ),
      ),
    );
  }

  void approveRequest(BuildContext context, Map<String, dynamic> request) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Approved'),
          content: Text(
              'The request for ${request['planName']} broadband plan has been approved.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                removeButtons(request);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void rejectRequest(BuildContext context, Map<String, dynamic> request) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Rejected'),
          content: Text(
              'The request for ${request['planName']} broadband plan has been rejected.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                removeButtons(request);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void removeButtons(Map<String, dynamic> request) {
    setState(() {
      request['showButtons'] = false;
    });
  }
}

String getRandomDate() {
  final Random random = Random();
  final DateTime startDate = DateTime(2023, 9, 1);
  final DateTime endDate = DateTime(2023, 11, 30);
  final int randomDays = random.nextInt(endDate.difference(startDate).inDays);
  final DateTime randomDate = startDate.add(Duration(days: randomDays));
  return '${randomDate.year}-${randomDate.month.toString().padLeft(2, '0')}-${randomDate.day.toString().padLeft(2, '0')}';
}

class AdminBroadbandPlanCard extends StatelessWidget {
  final Map<String, dynamic> request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  AdminBroadbandPlanCard({
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Plan Name: ${request['planName']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.010),
            Text(
              'User: ${request['userName']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.020,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.010),
            Text(
              'Request Date: ${request['requestDate']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.020,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.010),
            Text(
              'Details: ${request['details']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.022,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            if (request['showButtons'] ?? true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onApprove,
                    child: const Text(
                      'Approve',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: onReject,
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RequestDTH extends StatefulWidget {
  const RequestDTH({Key? key});

  @override
  State<RequestDTH> createState() => _RequestDTHState();
}

class _RequestDTHState extends State<RequestDTH> {
  List<Map<String, dynamic>> dthRequests = [
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'requestDate': '2023-10-05',
      'name': 'Airtel Digital Hindi Pack',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'requestDate': '2023-10-25',
      'name': 'Dish TV Hindi Premium',
      'details':
          'Channels: 200 Hd Channels: 40 Price: ₹349. Duration: 1 Month.',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'requestDate': '2023-11-03',
      'name': 'Videocon D2h Hindi Combo',
      'details':
          'Channels: 180 Hd Channels: 30 Price: ₹249. Duration: 1 Month.',
    },
    {
      'userName': 'Aadvik Verma',
      'email': 'aadvik.verma@example.com',
      'requestDate': '2023-11-02',
      'name': 'Tata Sky South Special',
      'details':
          'Channels: 220 Hd Channels: 50 Price: ₹399. Duration: 1 Month.',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'requestDate': '2023-11-01',
      'name': 'Sun Direct Tamil Pack',
      'details':
          'Channels: 170 Hd Channels: 25 Price: ₹199. Duration: 1 Month.',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'requestDate': '2023-10-31',
      'name': 'D2h Tamil Platinum Combo',
      'details':
          'Channels: 230 Hd Channels: 55 Price: ₹449. Duration: 1 Month.',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'requestDate': '2023-10-30',
      'name': 'Dish TV Sports Mania',
      'details':
          'Channels: 250 Hd Channels: 60 Price: ₹499. Duration: 1 Month.',
    },
    {
      'userName': 'Aadvik Verma',
      'email': 'aadvik.verma@example.com',
      'requestDate': '2023-10-29',
      'name': 'Airtel Digital Kids Delight',
      'details':
          'Channels: 160 Hd Channels: 20 Price: ₹149. Duration: 1 Month.',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'requestDate': '2023-10-28',
      'name': 'Videocon D2h Ultra HD',
      'details':
          'Channels: 300 Hd Channels: 70 Price: ₹599. Duration: 1 Month.',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'requestDate': '2023-10-27',
      'name': 'Tata Sky Family Sports',
      'details':
          'Channels: 280 Hd Channels: 65 Price: ₹549. Duration: 1 Month.',
    },
    // Repeated plans with different user names, emails, and request dates
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'requestDate': '2023-11-06',
      'name': 'Airtel Digital Hindi Pack',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
    },
    {
      'userName': 'Aadvik Verma',
      'email': 'aadvik.verma@example.com',
      'requestDate': '2023-11-07',
      'name': 'Dish TV Hindi Premium',
      'details':
          'Channels: 200 Hd Channels: 40 Price: ₹349. Duration: 1 Month.',
    },
    // Add more dummy data as needed...
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DTH Plan Requests - Admin',
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var request in dthRequests)
              AdminDTHPlanCard(
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
              'The request for ${request['name']} DTH Plan has been approved.'),
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
              'The request for ${request['name']} DTH Plan has been rejected.'),
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

class AdminDTHPlanCard extends StatelessWidget {
  final Map<String, dynamic> request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  AdminDTHPlanCard({
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
              'Plan Name: ${request['name']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
            Text(
              'User: ${request['userName']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.020,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
            Text(
              'Request Date: ${request['requestDate']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.020,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
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

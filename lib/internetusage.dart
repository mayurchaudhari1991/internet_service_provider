import 'package:flutter/material.dart';
import 'dart:math';

const Color kBackGroundMaroonColor = Color(0xFF800000);
const Color kFontGoldColor = Color(0xFFFFD700);

class InternetUsage extends StatefulWidget {
  const InternetUsage({Key? key});

  @override
  State<InternetUsage> createState() => _InternetUsageState();
}

class _InternetUsageState extends State<InternetUsage> {
  List<Map<String, dynamic>> internetUsageData = [
    {
      'userName': 'Aarav Patel',
      'usageDate': getRandomDate(),
      'planName': 'Elite',
      'dataUsed': 20,
    },
    {
      'userName': 'Aanya Sharma',
      'usageDate': getRandomDate(),
      'planName': 'Premium Elite',
      'dataUsed': 30,
    },
    {
      'userName': 'Aditya Verma',
      'usageDate': getRandomDate(),
      'planName': 'Supreme Elite',
      'dataUsed': 25,
    },
    {
      'userName': 'Ananya Gupta',
      'usageDate': getRandomDate(),
      'planName': 'Ultra Pro',
      'dataUsed': 15,
    },
    {
      'userName': 'Aarush Kumar',
      'usageDate': getRandomDate(),
      'planName': 'Gigabit Plus',
      'dataUsed': 40,
    },
    {
      'userName': 'Avani Singh',
      'usageDate': getRandomDate(),
      'planName': 'Extreme Speed',
      'dataUsed': 35,
    },
    {
      'userName': 'Arjun Sharma',
      'usageDate': getRandomDate(),
      'planName': 'Elite',
      'dataUsed': 22,
    },
    {
      'userName': 'Akshay Patel',
      'usageDate': getRandomDate(),
      'planName': 'Ultra Pro',
      'dataUsed': 18,
    },
    {
      'userName': 'Anika Singh',
      'usageDate': getRandomDate(),
      'planName': 'Premium Elite',
      'dataUsed': 28,
    },
    {
      'userName': 'Aarav Gupta',
      'usageDate': getRandomDate(),
      'planName': 'Ultra Pro',
      'dataUsed': 32,
    },
    {
      'userName': 'Anaya Sharma',
      'usageDate': getRandomDate(),
      'planName': 'Gigabit Plus',
      'dataUsed': 45,
    },
    {
      'userName': 'Aarav Patel',
      'usageDate': getRandomDate(),
      'planName': 'Elite',
      'dataUsed': 23,
    },
    // Add more dummy data
    {
      'userName': 'Aaditya Singh',
      'usageDate': getRandomDate(),
      'planName': 'Premium',
      'dataUsed': 25,
    },
    {
      'userName': 'Aaradhya Verma',
      'usageDate': getRandomDate(),
      'planName': 'Pro Plus',
      'dataUsed': 35,
    },
    {
      'userName': 'Aarav Kumar',
      'usageDate': getRandomDate(),
      'planName': 'Basic',
      'dataUsed': 15,
    },
    {
      'userName': 'Aanya Verma',
      'usageDate': getRandomDate(),
      'planName': 'Gigabit',
      'dataUsed': 40,
    },
  ];

  DateTime selectedDate = DateTime.now();
  List<String> selectedUsers = [
    'Aarav Patel',
    'Aarush Kumar',
    'Avani Singh',
    'Arjun Sharma',
    'Akshay Patel',
    'Anika Singh',
    'Aarav Gupta',
    'Aakash Chauhan',
    'Aditi Jain',
    'Abhishek Mishra',
    'Amritpal Singh',
  ];
  List<String> selectedPlan = [
    'Elite',
    'Pro Plus',
    'Basic',
    'Gigabit',
    'Supreme Elite',
    'Premium Elite',
    'Ultra Pro'
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internet Usage - Admin',
          style: TextStyle(
            color: Colors.amber,
            fontFamily: 'Northwell',
            fontSize: mediaQuery.size.width * 0.07,
          ),
        ),
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _selectDate(context),
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var usageData in _getFilteredData())
              AdminInternetUsageCard(usageData: usageData),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getFilteredData() {
    List<Map<String, dynamic>> filteredData = internetUsageData
        .where(
          (data) =>
              isSameDate(DateTime.parse(data['usageDate']).toLocal()) &&
              selectedUsers.contains(data['userName']) &&
              selectedPlan.contains(data['planName']),
        )
        .toList();

    // If filtered data is less than 10, add more dummy data
    while (filteredData.length < 10) {
      filteredData.add({
        'userName': selectedUsers[Random().nextInt(selectedUsers.length)],
        'usageDate': getRandomDate(),
        'planName': selectedPlan[Random().nextInt(selectedPlan.length)],
        'dataUsed': Random().nextInt(50) + 1,
      });
    }

    return filteredData;
  }

  bool isSameDate(DateTime usageDate) {
    return usageDate.year == selectedDate.year &&
        usageDate.month == selectedDate.month &&
        usageDate.day == selectedDate.day;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023, 9, 1),
      lastDate: DateTime(2023, 11, 30),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}

String getRandomDate() {
  final Random random = Random();
  final DateTime startDate = DateTime(2023, 9, 1);
  final DateTime endDate = DateTime(2023, 11, 30);
  final int randomDays = random.nextInt(endDate.difference(startDate).inDays);
  final DateTime randomDate = startDate.add(Duration(days: randomDays));
  return '${randomDate.year}-${randomDate.month.toString().padLeft(2, '0')}-${randomDate.day.toString().padLeft(2, '0')} 00:00:00.000';
}

class AdminInternetUsageCard extends StatelessWidget {
  final Map<String, dynamic> usageData;

  AdminInternetUsageCard({required this.usageData});

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
              'User: ${usageData['userName']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
            Text(
              'Usage Date: ${usageData['usageDate']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
            Text(
              'Plan Name: ${usageData['planName']}',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.025,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.015),
            Text(
              'Data Used: ${usageData['dataUsed']} GB',
              style: TextStyle(
                fontSize: mediaQuery.size.height * 0.022,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

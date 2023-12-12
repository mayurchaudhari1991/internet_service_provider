import 'package:flutter/material.dart';

const Color kBackGroundMaroonColor = Color(0xFF800000);
const Color kFontGoldColor = Color(0xFFFFD700);

class BillingAdmin extends StatefulWidget {
  const BillingAdmin({Key? key}) : super(key: key);

  @override
  _BillingAdminState createState() => _BillingAdminState();
}

class _BillingAdminState extends State<BillingAdmin> {
  // Dummy data for bills
  final List<Map<String, dynamic>> dummyBills = [
    {
      'userName': 'Mayur Patel',
      'email': 'mayur.patell@gmail.com',
      'name': 'D2h Tamil Platinum Combo',
      'details':
          'Channels: 220 Hd Channels: 50 Price: ₹399. Duration: 1 Month.',
      'bookingDate': '2023-10-31',
      'expiryDate': '2023-11-30',
      'paymentRemaining': '₹399',
      'isReceived': true,
    },
    {
      'userName': 'Anvi Verma',
      'email': 'anvi.verma@gmail.com',
      'name': 'Premium Plus',
      'details': '75 Mbps upto 5000 GB, 7 Mbps unlimited, 30 Days, ₹699',
      'paymentRemaining': '₹699',
      'isReceived': true,
      'bookingDate': '2023-10-08',
      'expiryDate': '2023-11-08',
    },
    {
      'userName': 'Rahul Sharma',
      'email': 'rahul.sharma@gmail.com',
      'name': 'Tata Sky South Special',
      'details':
          'Channels: 200 Hd Channels: 40 Price: ₹349. Duration: 1 Month.',
      'bookingDate': '2023-11-02',
      'expiryDate': '2023-12-02',
      'paymentRemaining': '₹349',
      'isReceived': true,
    },
    {
      'userName': 'Ajay Patil',
      'email': 'ajay.patil@gmail.com',
      'name': 'D2h Tamil Platinum Combo',
      'details':
          'Channels: 220 Hd Channels: 50 Price: ₹399. Duration: 1 Month.',
      'bookingDate': '2023-10-31',
      'expiryDate': '2023-11-30',
      'paymentRemaining': '₹399',
      'isReceived': true,
    },
    {
      'userName': 'Tata Sky South Special',
      'email': 'tata.sky@gmail.com',
      'name': 'Tata Sky South Special',
      'details':
          'Channels: 200 Hd Channels: 40 Price: ₹349. Duration: 1 Month.',
      'bookingDate': '2023-11-02',
      'expiryDate': '2023-12-02',
      'paymentRemaining': '₹349',
      'isReceived': true,
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@gmail.com',
      'name': 'Dish TV Hindi Premium',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
      'bookingDate': '2023-10-25',
      'expiryDate': '2023-11-25',
      'paymentRemaining': '₹299',
      'isReceived': false,
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@gmail.com',
      'name': 'Airtel Digital Hindi Pack',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
      'bookingDate': '2023-10-05',
      'expiryDate': '2023-11-05',
      'paymentRemaining': '₹299',
      'isReceived': true,
    },
    {
      'userName': 'Aryan Singh',
      'email': 'aryan.singh@gmail.com',
      'name': 'Ultra Plus',
      'details': '250 Mbps upto 8000 GB, 25 Mbps unlimited, 30 Days, ₹1099',
      'paymentRemaining': '₹1099',
      'isReceived': true,
      'bookingDate': '2023-10-22',
      'expiryDate': '2023-11-22',
    },
    {
      'userName': 'Anika Singh',
      'email': 'anika.singh@gmail.com',
      'name': 'Premium Elite',
      'details': '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
      'paymentRemaining': '₹599',
      'isReceived': false,
      'bookingDate': '2023-10-06',
      'expiryDate': '2023-11-06',
    },
    {
      'userName': 'Aarav Kumar',
      'email': 'aarav.kumar@gmail.com',
      'name': 'Extreme Speed',
      'details': '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
      'paymentRemaining': '₹1199',
      'isReceived': false,
      'bookingDate': '2023-10-21',
      'expiryDate': '2023-11-21',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@gmail.com',
      'name': 'Elite',
      'details': '30 Mbps upto 3300 GB, 2 Mbps unlimited, 30 Days, ₹399',
      'paymentRemaining': '₹399',
      'isReceived': true,
      'bookingDate': '2023-10-01',
      'expiryDate': '2023-11-01',
    },
    {
      'userName': 'Aarav Gupta',
      'email': 'aarav.gupta@gmail.com',
      'name': 'Elite',
      'details': '30 Mbps upto 3300 GB, 2 Mbps unlimited, 30 Days, ₹399',
      'paymentRemaining': '₹399',
      'isReceived': true,
      'bookingDate': '2023-10-02',
      'expiryDate': '2023-11-02',
    },
    {
      'userName': 'Aarav Sharma',
      'email': 'aarav.sharma@gmail.com',
      'name': 'Extreme Plus',
      'details': '400 Mbps upto 10000 GB, 40 Mbps unlimited, 30 Days, ₹1299',
      'paymentRemaining': '₹1299',
      'isReceived': false,
      'bookingDate': '2023-10-15',
      'expiryDate': '2023-11-15',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@gmail.com',
      'name': 'Videocon D2h Hindi Combo',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
      'bookingDate': '2023-11-03',
      'expiryDate': '2023-12-03',
      'paymentRemaining': '₹299',
      'isReceived': true,
    },
    {
      'userName': 'Aditya Verma',
      'email': 'aditya.verma@gmail.com',
      'name': 'Supreme Elite',
      'details': '100 Mbps upto 5000 GB, 10 Mbps unlimited, 30 Days, ₹799',
      'paymentRemaining': '₹799',
      'isReceived': true,
      'bookingDate': '2023-10-10',
      'expiryDate': '2023-11-10',
    },
    {
      'userName': 'Aaditya Singh',
      'email': 'aaditya.singh@gmail.com',
      'name': 'Supreme Elite',
      'details': '100 Mbps upto 5000 GB, 10 Mbps unlimited, 30 Days, ₹799',
      'paymentRemaining': '₹799',
      'isReceived': true,
      'bookingDate': '2023-10-11',
      'expiryDate': '2023-11-11',
    },
    {
      'userName': 'Aaradhya Verma',
      'email': 'aaradhya.verma@gmail.com',
      'name': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'paymentRemaining': '₹999',
      'isReceived': true,
      'bookingDate': '2023-10-16',
      'expiryDate': '2023-11-16',
    },
    {
      'userName': 'Aarav Kumar',
      'email': 'aarav.kumar@gmail.com',
      'name': 'Extreme Speed',
      'details': '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
      'paymentRemaining': '₹1199',
      'isReceived': false,
      'bookingDate': '2023-10-21',
      'expiryDate': '2023-11-21',
    },
    {
      'userName': 'Anvi Patel',
      'email': 'anvi.patel@gmail.com',
      'name': 'Gigabit Plus',
      'details': '1000 Mbps upto 10000 GB, 50 Mbps unlimited, 30 Days, ₹1499',
      'paymentRemaining': '₹1499',
      'isReceived': true,
      'bookingDate': '2023-10-26',
      'expiryDate': '2023-11-26',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@gmail.com',
      'name': 'Premium Elite',
      'details': '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
      'paymentRemaining': '₹599',
      'isReceived': false,
      'bookingDate': '2023-10-05',
      'expiryDate': '2023-11-05',
    },
    {
      'userName': 'Ananya Gupta',
      'email': 'ananya.gupta@gmail.com',
      'name': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'paymentRemaining': '₹999',
      'isReceived': true,
      'bookingDate': '2023-10-15',
      'expiryDate': '2023-11-15',
    },
    {
      'userName': 'Aarush Kumar',
      'email': 'aarush.kumar@gmail.com',
      'name': 'Extreme Speed',
      'details': '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
      'paymentRemaining': '₹1199',
      'isReceived': false,
      'bookingDate': '2023-10-20',
      'expiryDate': '2023-11-20',
    },
    {
      'userName': 'Vijay Chaudhari',
      'email': 'vijay.chaudhari@gmail.com',
      'name': 'Sun Direct Tamil Pack',
      'details':
          'Channels: 180 Hd Channels: 30 Price: ₹249. Duration: 1 Month.',
      'bookingDate': '2023-11-01',
      'expiryDate': '2023-12-01',
      'paymentRemaining': '₹249',
      'isReceived': false,
    },
    {
      'userName': 'Prasad Rajput',
      'email': 'Prasad.rajput@gmail.com',
      'name': 'Sun Direct Tamil Pack',
      'details':
          'Channels: 180 Hd Channels: 30 Price: ₹249. Duration: 1 Month.',
      'bookingDate': '2023-11-01',
      'expiryDate': '2023-12-01',
      'paymentRemaining': '₹249',
      'isReceived': false,
    },
    {
      'userName': 'Akshaya Singh',
      'email': 'aaradhya.singh@gmail.com',
      'name': 'Videocon D2h Hindi Combo',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
      'bookingDate': '2023-11-03',
      'expiryDate': '2023-12-03',
      'paymentRemaining': '₹299',
      'isReceived': true,
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@gmail.com',
      'name': 'Videocon D2h Hindi Combo',
      'details':
          'Channels: 189 Hd Channels: 35 Price: ₹299. Duration: 1 Month.',
      'bookingDate': '2023-11-03',
      'expiryDate': '2023-12-03',
      'paymentRemaining': '₹299',
      'isReceived': true,
    },
    {
      'userName': 'Aaradhya Verma',
      'email': 'aaradhya.verma@gmail.com',
      'name': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'paymentRemaining': '₹999',
      'isReceived': true,
      'bookingDate': '2023-10-16',
      'expiryDate': '2023-11-16',
    },
    {
      'userName': 'Aarav Kumar',
      'email': 'aarav.kumar@gmail.com',
      'name': 'Extreme Speed',
      'details': '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
      'paymentRemaining': '₹1199',
      'isReceived': false,
      'bookingDate': '2023-10-21',
      'expiryDate': '2023-11-21',
    },
    {
      'userName': 'Aaditya Singh',
      'email': 'aaditya.singh@gmail.com',
      'name': 'Supreme Elite',
      'details': '100 Mbps upto 5000 GB, 10 Mbps unlimited, 30 Days, ₹799',
      'paymentRemaining': '₹799',
      'isReceived': true,
      'bookingDate': '2023-10-11',
      'expiryDate': '2023-11-11',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: AppBar(
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        title: Text(
          'Admin Billing',
          style: TextStyle(
            color: kFontGoldColor,
            fontFamily: 'Northwell',
            fontSize: mediaQuery.size.width * 0.06,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyBills.length,
        itemBuilder: (context, index) {
          final bill = dummyBills[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                'Plan: ${bill['name']}',
                style: TextStyle(color: Colors.black87),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User: ${bill['userName']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'Details: ${bill['details']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'Payment Remaining: ${bill['paymentRemaining']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'Booking Date: ${bill['bookingDate']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'Expiry Date: ${bill['expiryDate']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Toggle the received status when the button is pressed
                  setState(() {
                    bill['isReceived'] = !bill['isReceived'];
                  });
                },
                child: Text(bill['isReceived'] ? 'Received' : 'Not Received'),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';

const Color kBackGroundMaroonColor = Color(0xFF800000);
const Color kFontGoldColor = Color(0xFFFFD700);

class InvoiceAdmin extends StatefulWidget {
  const InvoiceAdmin({Key? key}) : super(key: key);

  @override
  State<InvoiceAdmin> createState() => _InvoiceAdminState();
}

class _InvoiceAdminState extends State<InvoiceAdmin> {
  final List<Map<String, dynamic>> dummyInvoices = [
    {
      'userName': 'Aadvik Verma',
      'email': 'aadvik.verma@example.com',
      'planName': 'Dish TV Hindi Premium',
      'details': '₹349',
      'bookingDate': '2023-11-07',
      'expiryDate': '2023-12-07',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'planName': 'Sun Direct Tamil Pack',
      'details': '₹199',
      'bookingDate': '2023-11-01',
      'expiryDate': '2023-12-01',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'planName': 'Tata Sky Family Sports',
      'details': '₹549',
      'bookingDate': '2023-10-27',
      'expiryDate': '2023-11-26',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@gmail.com',
      'planName': 'Premium Elite',
      'details': '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
      'bookingDate': '2023-10-05',
      'expiryDate': '2023-11-05',
    },
    {
      'userName': 'Anika Singh',
      'email': 'anika.singh@gmail.com',
      'planName': 'Premium Elite',
      'details': '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
      'bookingDate': '2023-10-06',
      'expiryDate': '2023-11-06',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'planName': 'Dish TV Sports Mania',
      'details': '₹499',
      'bookingDate': '2023-10-30',
      'expiryDate': '2023-11-29',
    },
    {
      'userName': 'Aarav Kumar',
      'email': 'aarav.kumar@gmail.com',
      'planName': 'Extreme Speed',
      'details': '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
      'bookingDate': '2023-10-21',
      'expiryDate': '2023-11-21',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@gmail.com',
      'planName': 'Elite',
      'details': '30 Mbps upto 3300 GB, 2 Mbps unlimited, 30 Days, ₹399',
      'bookingDate': '2023-10-01',
      'expiryDate': '2023-11-01',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'planName': 'Videocon D2h Ultra HD',
      'details': '₹599',
      'bookingDate': '2023-10-28',
      'expiryDate': '2023-11-27',
    },
    {
      'userName': 'Aditya Verma',
      'email': 'aditya.verma@gmail.com',
      'planName': 'Supreme Elite',
      'details': '100 Mbps upto 5000 GB, 10 Mbps unlimited, 30 Days, ₹799',
      'bookingDate': '2023-10-10',
      'expiryDate': '2023-11-10',
    },
    {
      'userName': 'Anvi Patel',
      'email': 'anvi.patel@gmail.com',
      'planName': 'Gigabit Plus',
      'details': '1000 Mbps upto 10000 GB, 50 Mbps unlimited, 30 Days, ₹1499',
      'bookingDate': '2023-10-26',
      'expiryDate': '2023-11-26',
    },
    {
      'userName': 'Aaradhya Verma',
      'email': 'aaradhya.verma@gmail.com',
      'planName': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'bookingDate': '2023-10-16',
      'expiryDate': '2023-11-16',
    },
    {
      'userName': 'Ananya Gupta',
      'email': 'ananya.gupta@gmail.com',
      'planName': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'bookingDate': '2023-10-15',
      'expiryDate': '2023-11-15',
    },
    {
      'userName': 'Aadvik Verma',
      'email': 'aadvik.verma@example.com',
      'planName': 'Airtel Digital Kids Delight',
      'details': '₹149',
      'bookingDate': '2023-10-29',
      'expiryDate': '2023-11-28',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'planName': 'Airtel Digital Hindi Pack',
      'details': '₹299',
      'bookingDate': '2023-10-05',
      'expiryDate': '2023-11-05',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@example.com',
      'planName': 'Sun Direct Tamil Pack',
      'details': '₹199',
      'bookingDate': '2023-11-01',
      'expiryDate': '2023-12-01',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@example.com',
      'planName': 'Tata Sky Family Sports',
      'details': '₹549',
      'bookingDate': '2023-10-27',
      'expiryDate': '2023-11-26',
    },
    {
      'userName': 'Aanya Sharma',
      'email': 'aanya.sharma@gmail.com',
      'planName': 'Premium Elite',
      'details': '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
      'bookingDate': '2023-10-05',
      'expiryDate': '2023-11-05',
    },
    {
      'userName': 'Anika Singh',
      'email': 'anika.singh@gmail.com',
      'planName': 'Premium Elite',
      'details': '50 Mbps upto 4000 GB, 5 Mbps unlimited, 30 Days, ₹599',
      'bookingDate': '2023-10-06',
      'expiryDate': '2023-11-06',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'planName': 'Dish TV Sports Mania',
      'details': '₹499',
      'bookingDate': '2023-10-30',
      'expiryDate': '2023-11-29',
    },
    {
      'userName': 'Aarav Kumar',
      'email': 'aarav.kumar@gmail.com',
      'planName': 'Extreme Speed',
      'details': '300 Mbps upto 8000 GB, 30 Mbps unlimited, 30 Days, ₹1199',
      'bookingDate': '2023-10-21',
      'expiryDate': '2023-11-21',
    },
    {
      'userName': 'Aarav Patel',
      'email': 'aarav.patel@gmail.com',
      'planName': 'Elite',
      'details': '30 Mbps upto 3300 GB, 2 Mbps unlimited, 30 Days, ₹399',
      'bookingDate': '2023-10-01',
      'expiryDate': '2023-11-01',
    },
    {
      'userName': 'Aaradhya Singh',
      'email': 'aaradhya.singh@example.com',
      'planName': 'Videocon D2h Ultra HD',
      'details': '₹599',
      'bookingDate': '2023-10-28',
      'expiryDate': '2023-11-27',
    },
    {
      'userName': 'Aditya Verma',
      'email': 'aditya.verma@gmail.com',
      'planName': 'Supreme Elite',
      'details': '100 Mbps upto 5000 GB, 10 Mbps unlimited, 30 Days, ₹799',
      'bookingDate': '2023-10-10',
      'expiryDate': '2023-11-10',
    },
    {
      'userName': 'Anvi Patel',
      'email': 'anvi.patel@gmail.com',
      'planName': 'Gigabit Plus',
      'details': '1000 Mbps upto 10000 GB, 50 Mbps unlimited, 30 Days, ₹1499',
      'bookingDate': '2023-10-26',
      'expiryDate': '2023-11-26',
    },
    {
      'userName': 'Aaradhya Verma',
      'email': 'aaradhya.verma@gmail.com',
      'planName': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'bookingDate': '2023-10-16',
      'expiryDate': '2023-11-16',
    },
    {
      'userName': 'Ananya Gupta',
      'email': 'ananya.gupta@gmail.com',
      'planName': 'Ultra Pro',
      'details': '200 Mbps upto 6000 GB, 20 Mbps unlimited, 30 Days, ₹999',
      'bookingDate': '2023-10-15',
      'expiryDate': '2023-11-15',
    },
    {
      'userName': 'Aadvik Verma',
      'email': 'aadvik.verma@example.com',
      'planName': 'Airtel Digital Kids Delight',
      'details': '₹149',
      'bookingDate': '2023-10-29',
      'expiryDate': '2023-11-28',
    },
  ];

  void downloadInvoice(String? invoiceNumber) {
    // Dummy download logic (replace with actual logic to download the invoice)
    if (invoiceNumber != null) {
      // Display a confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Download Confirmation'),
            content: Text('Do you want to download invoice: $invoiceNumber?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Replace this with the actual logic to download the invoice
                  print('Downloading invoice: $invoiceNumber...');
                  // Display a success dialog
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Download Successful'),
                        content: Text(
                            'Invoice $invoiceNumber downloaded successfully.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
            ],
          );
        },
      );
    } else {
      print('Invoice number is null.');
    }
  }

  String generateRandomInvoiceNumber() {
    final alphanumericChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return 'INV${List.generate(2, (index) => alphanumericChars[random.nextInt(alphanumericChars.length)]).join()}';
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: AppBar(
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        title: Text(
          'Invoices - Admin',
          style: TextStyle(
            color: kFontGoldColor,
            fontFamily: 'Northwell',
            fontSize: mediaQuery.size.width * 0.06,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyInvoices.length,
        itemBuilder: (ctx, index) {
          final invoice = dummyInvoices[index];
          return ListTile(
            title: Text(
              'Invoice Number: ${generateRandomInvoiceNumber()}',
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.04,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plan Name: ${invoice['planName'] ?? 'N/A'}',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.04,
                  ),
                ),
                Text(
                  'User Name: ${invoice['userName'] ?? 'N/A'}',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.04,
                  ),
                ),
                Text(
                  'Booking Date: ${invoice['bookingDate'] ?? 'N/A'}',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.04,
                  ),
                ),
                Text(
                  'Expiry Date: ${invoice['expiryDate'] ?? 'N/A'}',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.04,
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.width * 0.06,
                ),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Call the downloadInvoice function with the invoice number
                final invoiceNumber = invoice['userName'];
                if (invoiceNumber != null) {
                  downloadInvoice(invoiceNumber);
                } else {
                  print('Invoice number is null.');
                }
              },
              child: Text('Download'),
            ),
          );
        },
      ),
    );
  }
}

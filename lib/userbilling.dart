import 'package:flutter/material.dart';

const Color kBackGroundMaroonColor = Color(0xFF800000);
const Color kFontGoldColor = Color(0xFFFFD700);

class BillingUser extends StatefulWidget {
  const BillingUser({Key? key}) : super(key: key);

  @override
  _BillingUserState createState() => _BillingUserState();
}

class _BillingUserState extends State<BillingUser> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  final Color maroonColor = Color(0xFF800000); // Custom maroon color
  final Color goldColor = Color(0xFFFFD700); // Custom gold color

  // Dummy selected plan
  final Map<String, dynamic> selectedPlan = {
    'planName': 'Elite',
    'totalAmount': 399.0, // Replace with the total amount
  };

  bool isProcessing = false;
  String paymentMessage = '';

  void processPayment() {
    setState(() {
      isProcessing = true;
    });

    // Simulate a delay to mimic server communication
    Future.delayed(Duration(seconds: 2), () {
      final cvv = cvvController.text;

      // Extract plan details
      final planName = selectedPlan['planName'];

      if (cvv == '123') {
        // Payment was successful
        // Replace this part with your actual logic for a successful payment
        setState(() {
          paymentMessage = 'Payment successful for $planName';
        });
        // After a successful payment, you can navigate to the next screen or perform any required actions.
      } else {
        // Payment failed
        // Handle the error and provide feedback to the user
        setState(() {
          paymentMessage = 'Your bank server is down, try again later';
        });
      }

      setState(() {
        isProcessing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maroonColor,
      appBar: AppBar(
        backgroundColor: maroonColor,
        centerTitle: true,
        title: Text(
          'Billing - User',
          style: TextStyle(
            color: goldColor,
            fontFamily: 'Northwell',
            fontSize: mediaQuery.size.width * 0.06,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dummy plan display
            Text(
              'Selected Plan: ${selectedPlan['planName']}',
              style: TextStyle(
                fontFamily: 'MPIDeco',
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.05,
              ),
            ),
            Text(
              'Total Amount: ₹${selectedPlan['totalAmount']}',
              style: TextStyle(color: goldColor),
            ),

            // Billing UI elements (e.g., TextFields for card details)
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(labelText: 'UPI Id'),
            ),
            TextField(
              controller: expDateController,
              decoration: InputDecoration(labelText: 'Amount'),
            ),

            ElevatedButton(
              onPressed: () {
                // Call the processPayment function
                processPayment();
              },
              child: Text('Make Payment'),
            ),

            // Display payment message
            if (isProcessing)
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(goldColor),
              ),
            if (paymentMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  paymentMessage,
                  style: TextStyle(color: goldColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

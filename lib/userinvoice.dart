import 'package:flutter/material.dart';
import 'constants.dart';

class InvoiceUser extends StatefulWidget {
  const InvoiceUser({Key? key});

  @override
  State<InvoiceUser> createState() => _InvoiceUserState();
}

class _InvoiceUserState extends State<InvoiceUser> {
  void downloadInvoice(String? invoiceNumber) {
    // Dummy download logic (replace with actual logic to download the invoice)
    if (invoiceNumber != null) {
      print('Downloading invoice: $invoiceNumber...');
    } else {
      print('Invoice number is null.');
    }
  }

  Future<void> _showConfirmationDialog(String? invoiceNumber) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Download'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to download the invoice?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                downloadInvoice(invoiceNumber);
                Navigator.of(context).pop(); // Close the dialog
                _showSuccessDialog();
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showSuccessDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Download Successful'),
          content: Text('The invoice has been downloaded successfully.'),
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
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Dummy invoice data
    final List<Map<String, String?>> dummyInvoices = List.generate(2, (index) {
      return {
        'invoiceNumber': 'INV${1000 + index}',
        'date': 'October ${15 - index}, 2023',
        'totalAmount': '\₹${500 + index}.00',
      };
    });

    return Scaffold(
      backgroundColor: kBackGroundMaroonColor,
      appBar: AppBar(
        backgroundColor: kBackGroundMaroonColor,
        centerTitle: true,
        title: Text(
          'Invoices - User',
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
          return ListTile(
            title: Text(
              'Invoice Number: ${dummyInvoices[index]['invoiceNumber'] ?? 'N/A'}',
              style: TextStyle(
                color: kFontGoldColor,
                fontSize: mediaQuery.size.width * 0.04,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date: ${dummyInvoices[index]['date'] ?? 'N/A'}',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.04,
                  ),
                ),
                Text(
                  'Total Amount: ${dummyInvoices[index]['totalAmount'] ?? 'N/A'}',
                  style: TextStyle(
                    color: kFontGoldColor,
                    fontSize: mediaQuery.size.width * 0.04,
                  ),
                ),
              ],
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Call the downloadInvoice function with the invoice number
                final invoiceNumber = dummyInvoices[index]['invoiceNumber'];
                if (invoiceNumber != null) {
                  _showConfirmationDialog(invoiceNumber);
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

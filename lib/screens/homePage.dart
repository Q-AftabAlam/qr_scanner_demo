import 'package:flutter/material.dart';
import '/widgets/elevated_button.dart';
import 'barcode_scanner.dart';
import 'mobile_scanner.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      backgroundColor: Colors.teal.shade100,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyElevatedBTN(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarCodeScanner()),
                  );
                },
                text: "QR Scanner 1",
                iconn: Icon(Icons.qr_code_scanner)),
            MyElevatedBTN(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MobileQRScannerPage()),
                  );
                },
                text: "QR Scanner 2",
                iconn: Icon(Icons.qr_code_scanner)),
          ],
        ),
      ),
    );
  }
}

import 'dart:typed_data';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner_demo/screens/result_Page.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  State<BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  // String barcode = 'Tap  to scan';
  bool isScanComplete = false;

  void closeScanner(){
    setState(() {
      isScanComplete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI BarCode Scanner"),
      ),
      body: AiBarcodeScanner(
        errorText: "Invalid Code",
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          detectionTimeoutMs: 50,
          returnImage: true,
        ),
        canPop: false,
        onScan: (String value) {
          // debugPrint(value);
          // setState(() {
          //   barcode = value;
          // });
        },
        onDetect: (
          capture,
        ) {
          final List<Barcode> barcode = capture.barcodes;
          final Uint8List? image = capture.image;
          for (final barcode in barcode) {
            // debugPrint('AI Barcode Result ${barcode.rawValue}');
            if (!isScanComplete) {
              String qrResult = barcode.rawValue ?? "---";
              setState(() {
                isScanComplete = true;
              });
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result_Page(
                            qrResult: qrResult,
                          )
                  ),
              );
              closeScanner();

            }
          }
        },
        // onDispose: () {
        //   debugPrint("Barcode scanner disposed!");
        // },
      ),
    );
  }
}

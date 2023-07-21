import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_demo/screens/result_Page.dart';

class MobileQRScannerPage extends StatefulWidget {
  const MobileQRScannerPage({Key? key}) : super(key: key);

  @override
  State<MobileQRScannerPage> createState() => _MobileQRScannerPageState();
}

class _MobileQRScannerPageState extends State<MobileQRScannerPage> {
  bool isScanComplete = false;
  MobileScannerController controller = MobileScannerController();

  // void closeScanner(){
  //   setState(() {
  //     isScanComplete = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Scanner"),
      ),
      body: MobileScanner(
          fit: BoxFit.contain,
          controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
              torchEnabled: false,
              returnImage: true,
              detectionTimeoutMs: 50
          ),
          onDetect: (
            capture,
          ) {
            final List<Barcode> barcode = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcode) {
              debugPrint('Barcode found! ${barcode.rawValue}' );
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
                      // closeQRScreen: closeScanner,
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}

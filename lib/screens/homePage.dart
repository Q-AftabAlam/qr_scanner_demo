import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_scanner_demo/screens/result_Page.dart';
import 'package:qr_scanner_demo/screens/scan_from_gallry_page.dart';
import 'package:scan/scan.dart';
import '/widgets/elevated_button.dart';
import 'barcode_scanner.dart';
import 'generate_qrCode.dart';
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
                iconn: Icon(Icons.qr_code_scanner)
            ),
            MyElevatedBTN(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MobileQRScannerPage()),
                  );
                },
                text: "QR Scanner 2",
                iconn: Icon(Icons.qr_code_scanner)
            ),

            MyElevatedBTN(
                onPress: () {
                  ScanFromGallry().
                      pickImage(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ScanFromGallry()),
                  // );
                },
                text: "Scan from Gallry",
                iconn: Icon(Icons.image)
            ),

            MyElevatedBTN(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Generate_QR_Code()),
                  );
                },
                text: "Generate QR Code",
                iconn: Icon(Icons.queue_rounded)
            ),
          ],
        ),
      ),
    );
  }

  // String? qrResult;
  // Future<void> pickImage() async {
  //   await Permission.storage.request();
  //   var status = await Permission.storage.status;
  //
  //   if (status.isGranted) {
  //     final  pickedFile =
  //     await ImagePicker().getImage(source: ImageSource.gallery);
  //     // pickImage(source: ImageSource.gallery);
  //     if (pickedFile != null) {
  //
  //       qrResult = await Scan.parse(pickedFile.path);
  //       if (qrResult != null) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Result_Page(
  //               qrResult: qrResult!,
  //               // closeQRScreen: closeScanner,
  //             ),
  //           ),
  //         );
  //       }
  //     }
  //   }
  // }

}

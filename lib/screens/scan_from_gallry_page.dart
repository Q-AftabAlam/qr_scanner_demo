// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_scanner_demo/screens/result_Page.dart';
// import 'package:scan/scan.dart';
// import 'package:image_picker/image_picker.dart';



// External file and with  Material UI Statefull Class and function===================================

// class ScanFromGallry extends StatefulWidget {
//   const ScanFromGallry({Key? key}) : super(key: key);
//
//   @override
//   State<ScanFromGallry> createState() => _ScanFromGallryState();
// }
//
// class _ScanFromGallryState extends State<ScanFromGallry> {
//
//   String? qrResult;
//   Future<void> pickImage() async {
//     await Permission.storage.request();
//     var status = await Permission.storage.status;
//
//     if (status.isGranted) {
//       final pickedFile =
//           await ImagePicker().getImage(source: ImageSource.gallery);
//       // pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         qrResult = await Scan.parse(pickedFile.path);
//         if (qrResult != null) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Result_Page(
//                 qrResult: qrResult!,
//                 // closeQRScreen: closeScanner,
//               ),
//             ),
//           );
//         }
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pickImage();
//     // Future.delayed(Duration(seconds: 0),(){pickImage();});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           child: Center(child: Text('Loading...')),
//         ),
//         Center(child: CircularProgressIndicator())
//       ],
//     ));
//   }
// }


// external file and with only  Class and function===================================


// class ScanFromGallry {
//   String? qrResult;
//
//   Future<void> pickImage(BuildContext context) async {
//     await Permission.storage.request();
//     var status = await Permission.storage.status;
//
//     if (status.isGranted) {
//       final pickedFile =
//           await ImagePicker().getImage(source: ImageSource.gallery);
// // pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         qrResult = await Scan.parse(pickedFile.path);
//         if (qrResult != null) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Result_Page(
//                 qrResult: qrResult!,
// // closeQRScreen: closeScanner,
//               ),
//             ),
//           );
//         }
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_scanner_demo/screens/homePage.dart';

class Result_Page extends StatefulWidget {
  const Result_Page({
    required this.qrResult,
    // required this. closeQRScreen
  });

  final String qrResult;
  // final void Function()? closeQRScreen;

  @override
  State<Result_Page> createState() => _Result_PageState();
}

class _Result_PageState extends State<Result_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Result Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Output of QR code....    ${widget.qrResult}")),
        ],
      ),
    );
  }
}

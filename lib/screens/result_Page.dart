import 'package:flutter/material.dart';
import 'package:qr_scanner_demo/screens/homePage.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String codeLink = '';

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
            Center(child: Text("Output of QR code.... ",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),),
           SizedBox(height: 25),
           InkWell(
           borderRadius: BorderRadius.circular(50),
               highlightColor: Colors.white54,
               child: Center(
                 child: Text(
                   "${widget.qrResult}",
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,
                         color: widget.qrResult.startsWith('http') ?Colors.blue.shade800: Colors.black,
                     )
                 ),
               ),
               onTap: () async {
                 codeLink = widget.qrResult;
                 print(widget.qrResult);
                 final Uri _url = Uri.parse(codeLink);
                 print('codeLink is ${codeLink}');
                 print(_url);
                 if (!await launchUrl(_url)) {
                   throw Exception('Could not launch $_url');
                 }
               }
           ),
        ],
      ),
    );
  }
}

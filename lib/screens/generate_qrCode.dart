import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class Generate_QR_Code extends StatefulWidget {
  const Generate_QR_Code({Key? key}) : super(key: key);

  @override
  State<Generate_QR_Code> createState() => _Generate_QR_CodeState();
}

class _Generate_QR_CodeState extends State<Generate_QR_Code> {
  TextEditingController textControllerOne = TextEditingController();
  final key = GlobalKey();

  Future<void> _permissionGranted() async {

    var status = await  Permission.storage.status;
    print('Status of Permissions${status}');
    if(status.isDenied || status.isRestricted || status.isLimited ) {
            await Permission.storage.request();}
    else{
      Permission.storage.request().isGranted;
    }
    }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _permissionGranted();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 22, 11, 22),
              child: TextField(
                maxLines: null,
                maxLength: null,
                minLines: null,
                onChanged: (value) {
                  setState(() {});
                },
                controller: textControllerOne,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                        color: Colors.teal,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        strokeAlign: BorderSide.strokeAlignOutside,
                        style: BorderStyle.solid,
                        color: Colors.amber,
                      ),
                    ),
                    hintText: "Enter Something to Generate QR Code"),
              ),
            ),
            SizedBox(height: 100),
            RepaintBoundary(
              key: key,
              child: QrImage(
             //   key: key,
                data: textControllerOne.text.isNotEmpty
                    ? textControllerOne.text
                    : "Enter Something to Generate QR Code",
                size: 300,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ),
            textControllerOne.text.isEmpty ?
            Text(''):
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child:
                    ElevatedButton(
                        child: SizedBox(
                          width: 115,
                          height: 50,
                          child: ListTile(
                            title: Text('Save'),
                            trailing: Icon(Icons.download),
                          ),
                        ),
                        onPressed: () {
                          save();
                          _permissionGranted();
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      child: SizedBox(
                        width: 115,
                        height: 50,
                        child: ListTile(
                          title: Text('Share'),
                          trailing: Icon(Icons.share),
                        ),
                      ),
                      onPressed: () async {
                        await _permissionGranted();
                        try {
                          RenderRepaintBoundary boundary = key.currentContext
                              ?.findRenderObject()! as RenderRepaintBoundary;
                          //captures qr image
                          final image = await boundary.toImage(pixelRatio: 1);

                          ByteData? byteData =
                          await image.toByteData(format: ImageByteFormat.png);

                          Uint8List pngBytes = byteData!.buffer.asUint8List();
                          print("this is test print $pngBytes");
                          //app directory for storing images.
                          final appDir = await getApplicationDocumentsDirectory();
                          //current time
                          var datetime = DateTime.now();
                          //qr image file creation
                          final file =
                          await File('${appDir.path}/$datetime.png').create();
                          //appending data
                          await file.writeAsBytes(pngBytes);


                          //Shares QR image
                          await Share.shareFiles(
                            [file.path],
                            mimeTypes: ["image/png"],
                            text: "Share the QR Code",
                          );
                        } catch (e) {
                          print(e.toString());
                        }
                      },
                    ),
                  ),
                ],
              )
          ],
        )
        ),
      )),
    );
  }

  Future<void> save() async {

    try {
      RenderRepaintBoundary boundary =
      key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final appDir = await getExternalStorageDirectory();
      var datetime = DateTime.now();

      final file = await new File('${appDir!.path}/${datetime}.png').create();
      await file.writeAsBytes(pngBytes);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(file.path)));
      print("file path is...${file.path}");

    } catch (e) {
      print(e.toString());
    }
  }


}

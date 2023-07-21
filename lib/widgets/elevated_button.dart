import 'package:flutter/material.dart';

class MyElevatedBTN extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final Icon iconn;

  const MyElevatedBTN({
    required this.onPress,
    required this.text,
    required this.iconn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: ElevatedButton(
          onPressed: onPress,
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: iconn,
          ),
        ),
      ),
    );
  }
}

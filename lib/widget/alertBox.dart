import 'package:flutter/material.dart';

void displayAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert dialog
            },
          ),
        ],
      );
    },
  );
}





  // String newValue = value.replaceAll(RegExp(r'[^0-9]'), "");
  //   if (newValue.length >= 2) {
  //     newValue =
  //         '${newValue.substring(0, newValue.length - 2)}.${newValue.substring(newValue.length - 2)}';
  //   } else {
  //     newValue = '0.${newValue.padLeft(2, '0')}';
  //   }

  //   if (newValue.startsWith('.')) {
  //     newValue = '0${newValue.padLeft(2, '0')}';
  //   }
  //   newValue = newValue.replaceFirst(RegExp('^0+(?!\\.)'), '');
  //   newValue = 'RM $newValue';

  //    setState(() {
  //       amountController.text = newValue;
  //     });
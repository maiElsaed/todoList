import 'package:flutter/material.dart';

 /////////////////////////////////////////////////////////
 void showAlertDialog({required BuildContext context,required String content}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert"),
        content: Text("${content}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}


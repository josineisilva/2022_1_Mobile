import 'package:flutter/material.dart';

Future<bool> confirm(BuildContext context, String _msg) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Row(
          children: [
            Icon(Icons.help,color: Colors.blue,size: 48.0,),
            Expanded(
              child: Text('Confirmacao',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ),
        content: Text(_msg),
        actions: <Widget>[
          FlatButton(child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          FlatButton(child: const Text("CANCEL"),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ],
      );
    },
  );
}
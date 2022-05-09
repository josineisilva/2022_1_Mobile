import 'package:flutter/material.dart';

void showAlert(BuildContext context, String _msg) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Row(
            children: [
              Icon(Icons.info,color: Colors.yellow[600],size: 48.0,),
              Expanded(
                child: Text(
                  'Alerta',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ]
        ),
        content: Text(_msg),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
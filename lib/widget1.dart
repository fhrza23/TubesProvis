import 'package:flutter/material.dart';

class CustomAboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var aboutDialog = AboutDialog(
      applicationName: 'My App',
      applicationVersion: '1.0.0',
      applicationIcon: Icon(Icons.info),
      applicationLegalese: '© 2024 My Company',
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('This is an example of AboutDialog in Flutter.'),
        ),
      ],
    );
    return aboutDialog;
  }
}
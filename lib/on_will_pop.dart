import 'package:flutter/material.dart';

class ClosePageDialog extends StatefulWidget {
  const ClosePageDialog({super.key});

  @override
  _ClosePageDialogState createState() => _ClosePageDialogState();
}

class _ClosePageDialogState extends State<ClosePageDialog> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Do you want to exit the app?'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: const Scaffold(
          // Your home page content
          ),
    );
  }
}

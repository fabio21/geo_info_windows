import 'package:flutter/material.dart';


class AlertLocationDialog extends StatelessWidget {
  final Function(bool activate) action;
  final String title, description;

  const AlertLocationDialog({Key? key,
    required this.action,
    this.title = "Location is disabled!!",
    this.description = "Must enable to have use of the feature in the app!",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      content: Text(
        description,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      actions: [
        actionButton("Activate", Colors.green),
        actionButton("Close", Colors.black26, activate: false),
      ],
    );
  }

  TextButton actionButton(String value, Color color, {bool activate = true}) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          padding: const EdgeInsets.all(16)),
      child: Text(value),
      onPressed: () => action(activate),
    );
  }
}

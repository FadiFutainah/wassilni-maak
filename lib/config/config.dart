import 'package:flutter/material.dart';

void showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    ),
  );
}

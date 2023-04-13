import 'package:flutter/material.dart';

extension exSnackBar on BuildContext {
  void snackBar({required String title}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(title),
      ),
    );
  }
}

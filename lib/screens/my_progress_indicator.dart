import 'package:flutter/material.dart';

class MyProgressIndicator extends StatefulWidget {
  MyProgressIndicator(progressValue);

  double? get progressValue => null;

  @override
  _MyProgressIndicatorState createState() =>
      _MyProgressIndicatorState(progressValue!);
}

class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  double progressValue;

  _MyProgressIndicatorState(this.progressValue);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LinearProgressIndicator(
          value: progressValue,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        Positioned(
          top: 0,
          right: 16,
          child: Text(
            '${(progressValue * 100).toStringAsFixed(0)}%',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

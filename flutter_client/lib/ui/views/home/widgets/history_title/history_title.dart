import 'package:flutter/material.dart';

class HistoryTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'History',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}
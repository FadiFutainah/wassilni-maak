import 'package:flutter/material.dart';

import 'line.dart';

class LineTitleLine extends StatelessWidget {
  final String text;

  const LineTitleLine({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Line(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Line(),
      ],
    );
  }
}

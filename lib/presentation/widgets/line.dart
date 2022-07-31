import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      child: Divider(
        thickness: 1.5,
        color: Colors.black26,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InstructionsDialog extends StatelessWidget {
  final String instructions;
  const InstructionsDialog({
    Key? key,
    required this.instructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 30.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'التعليمات',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              child: Text(
                instructions,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

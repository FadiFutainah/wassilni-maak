import 'package:flutter/material.dart';

class RetryScreen extends StatelessWidget {
  final VoidCallback refreshFunction;
  const RetryScreen({
    Key? key,
    required this.refreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: refreshFunction,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.refresh,
              size: 60,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'إعادة المحاولة',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}

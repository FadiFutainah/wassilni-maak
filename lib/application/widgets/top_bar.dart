import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  // TODO implement logo and fix size

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Wassilni Maak'),
    );
  }
}

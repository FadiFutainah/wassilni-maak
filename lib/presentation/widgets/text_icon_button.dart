import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  const TextIconButton({
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 40,
            color: color,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: GoogleFonts.ubuntu(
            color: color,
          ),
        )
      ],
    );
  }
}

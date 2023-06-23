import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestartQuizButton extends StatelessWidget {
  const RestartQuizButton({super.key});

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: () {

      },
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.rajdhani(
              fontSize: 20,
              fontWeight: FontWeight.bold
          )
      ),
      icon: const Icon(Icons.restart_alt_outlined),
      label: const Text('Restart Quiz'),
    );
  }
}
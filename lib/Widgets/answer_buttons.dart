import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButtons extends StatelessWidget {
  const AnswerButtons({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;

  @override
  Widget build(context) {
    return  ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        backgroundColor: const Color.fromARGB(100, 45, 10, 10),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        )
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: GoogleFonts.rajdhani(

        ),
      ),
    );
  }
}
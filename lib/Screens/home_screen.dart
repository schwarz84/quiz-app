import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/Widgets/Widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.switcherScreen, {super.key});

  final void Function() switcherScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
            color: const Color.fromARGB(255, 127, 64, 64),
          ),
          const SizedBox(height: 100),
          Text(
            'Aprendiendo Flutter!!!',
            style: GoogleFonts.rajdhani(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30
            ),
          ),
          const SizedBox(height: 20),
          StartQuizButton(switcherScreen)
        ],
      ),
    );
  }
}
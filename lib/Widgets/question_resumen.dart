import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionResumen extends StatelessWidget {
  QuestionResumen({super.key, required this.resumenData});

  List<Map<String, Object>> resumenData;





  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: resumenData.map((data) {
            return Row(
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: GoogleFonts.rajdhani(
                    color: Colors.white
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(height: 5),
                      Text(data['user_answer'] as String),
                      const SizedBox(height: 5),
                      Text(data['correct_answer'] as String),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
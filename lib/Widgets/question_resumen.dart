import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionResumen extends StatelessWidget {
  const QuestionResumen({super.key, required this.resumenData});

  final List<Map<String, Object>> resumenData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: resumenData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Index(data: data),
                Expanded(
                  child: _ResumenData(data: data),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ResumenData extends StatelessWidget {
  const _ResumenData({
    super.key,
    required this.data
  });

  final Map<String, Object> data;

  Color isCorrect() {
    return data['correct_answer'] == data['user_answer']
        ? Colors.blue.shade200
        : Colors.red.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            data['question'] as String,
            textAlign: TextAlign.center,
            style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data['user_answer'] as String,
            style: GoogleFonts.rajdhani(
              color: isCorrect(),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data['correct_answer'] as String,
            style: GoogleFonts.rajdhani(
              color: Colors.blue.shade200,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _Index extends StatelessWidget {
  const _Index({
    super.key,
    required this.data
  });

  final Map<String, Object> data;

  Color isCorrect() {
    return data['correct_answer'] == data['user_answer']
      ? Colors.blue.shade200
      : Colors.red.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCorrect(),
      ),
      child: Text(
        ((data['question_index'] as int) + 1).toString(),
        style: GoogleFonts.rajdhani(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
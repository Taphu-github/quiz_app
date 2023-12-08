import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['user_answer']==data['correct_answer']?Colors.green:Colors.red,
                  ),
                  child: Text(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ((data['question_index'] as int) + 1).toString())),
              Expanded(
                child: Column(
                  children: [
                    Text(
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                          
                        ),
                        data['question'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                        data['correct_answer'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: data['correct_answer'] == data['user_answer']
                              ? Colors.green
                              : Colors.red,
                        ),
                        data['user_answer'] as String),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}

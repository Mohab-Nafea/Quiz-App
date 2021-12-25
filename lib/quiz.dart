import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Total totalScore;
  final Function nextQuestion;
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20, color: Color(7)));

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.totalScore,
      @required this.nextQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answer['score'], answer['text'], totalScore,
              key: UniqueKey());
        }).toList(),
        ElevatedButton(
          style: style,
          child: const Text("Next"),
          onPressed: () {
            if (totalScore.value == 0) {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Error"),
                  content: const Text("Please select at least one choice."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } else {
              nextQuestion();
            }
          },
        )
      ],
    );
  }
}

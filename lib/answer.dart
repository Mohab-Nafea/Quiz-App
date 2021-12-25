import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/main.dart';

class Answer extends StatefulWidget {
  final int answerScore;
  final String answerText;
  final Total total;

  Answer(this.answerScore, this.answerText, this.total, {Key key})
      : super(key: key);

  @override
  State<Answer> createState() => _Answer(
        this.answerScore,
        this.answerText,
        this.total,
      );
}

class _Answer extends State<Answer> {
  final int answerScore;
  final String answerText;
  Total total;
  int score;
  bool isChecked = false;

  _Answer(
    this.answerScore,
    this.answerText,
    this.total,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        title: Text(answerText),
        value: isChecked,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) {
          setState(() {
            if (!isChecked) {
              total.value += answerScore;
            } else {
              total.value -= answerScore;
            }
            isChecked = value;
          });
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class Total {
  var value;
  Total(this.value);
}

// Widget rest() {
//   return Center();
// }

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
        {'text': 'Yellow', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Matrawy', 'score': 1},
        {'text': 'Matrawy', 'score': 1},
        {'text': 'Matrawy', 'score': 1},
        {'text': 'Matrawy', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = new Total(0);
  var stack = new List();

  void _resetQuiz() {
    stack.removeRange(0, stack.length);

    setState(() {
      _questionIndex = 0;
      _totalScore.value = 0;
    });
  }

  void _next() {
    stack.add(_totalScore.value);

    setState(() {
      _questionIndex++;
    });

    _totalScore.value = 0;
  }

  void _back() {
    stack.removeLast();

    setState(() {
      _questionIndex -= 1;
    });

    _totalScore.value = 0;
  }

  int finalScore() {
    var sum = 0;
    stack.forEach((element) {
      sum += element;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: _questionIndex != 0
              // hna 7ttlko condition for backbutton to appear if index not equall 0
              ? IconButton(
                  onPressed: () {
                    //please implement the logic here of back Button 😛
                    _back();
                  },
                  icon: Icon(Icons.arrow_back))
              : Container(),
          title: Text('The Quiz App'),
          foregroundColor: Colors.white,
          actions: <Widget>[
            _questionIndex > 0 && _questionIndex < _questions.length
                ? IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      //please implement the logic here of home Button  , Answer 😂😂 onPressed: _resetQuiz,
                      _resetQuiz();
                    },
                  )
                : Container(),
          ],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                questions: _questions,
                totalScore: _totalScore,
                nextQuestion: _next)
            : Result(finalScore(), _resetQuiz),
      ),
    );
  }
}

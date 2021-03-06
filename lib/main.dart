import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  bool userAnswer;
  bool isCorrect;

  void addIcon(bool isCorrect) {
    if (isCorrect) {
      scoreKeeper.add(
        Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      );
    }
  }

  void showAlert() {
    Alert(
      context: context,
      type: AlertType.error,
      title: "QUIZ FINISHED!",
      desc: "thanks for playing!",
      buttons: [
        DialogButton(
          child: Text(
            "Reset",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              quizBrain.resetQuiz();
              scoreKeeper = [];
            });
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.black,
              color: Colors.lightGreen[500],
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  if (!quizBrain.quizFinished) {
                    userAnswer = true;
                    isCorrect = quizBrain.checkAnswer(userAnswer);
                    addIcon(isCorrect);
                    quizBrain.nextQuestion();
                    if (quizBrain.quizFinished) {
                      showAlert();
                    }
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red[400],
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(
                  () {
                    if (!quizBrain.quizFinished) {
                      userAnswer = false;
                      isCorrect = quizBrain.checkAnswer(userAnswer);
                      addIcon(isCorrect);
                      quizBrain.nextQuestion();
                      if (quizBrain.quizFinished) {
                        showAlert();
                      }
                    }
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}

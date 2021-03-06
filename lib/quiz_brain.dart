import 'question.dart';

class QuizBrain {
  int _questionNo = 0;
  bool quizFinished = false;

  List<Question> _questions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question(
        'Waterloo has the greatest number of tube platforms in London', true),
    Question(
        'The Great Wall of China is longer than the distance between London and Beijing',
        true),
    Question('Monaco is the smallest country in the world', false),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestionText() {
    if (!quizFinished) {
      return _questions[_questionNo].questionText;
    } else {
      return 'The quiz has finished! \n Thanks for playing!';
    }
  }

  bool getQuestionAnswer() {
    return _questions[_questionNo].questionAnswer;
  }

  bool checkAnswer(bool userAnswer) {
    if (getQuestionAnswer() == userAnswer) {
      return true;
    } else {
      return false;
    }
  }

  void nextQuestion() {
    if (_questionNo < _questions.length - 1) {
      _questionNo++;
    } else {
      quizFinished = true;
    }
  }

  void resetQuiz() {
    _questionNo = 0;
    quizFinished = false;
  }
}

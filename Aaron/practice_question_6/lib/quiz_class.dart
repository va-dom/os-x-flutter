import 'package:practice_question_6/question_class.dart';

class Quiz{
  List<Question> questions;
  int _score = 0;
  int _currentQuestion = 0;

  int get getScore => _score;

  Quiz(this.questions);

  Question getCurrentQuestion() => questions[_currentQuestion];

  bool answerQuestion(int chosenIndex){
    bool isCorrect = getCurrentQuestion().isCorrectAnswer(chosenIndex);
    
    if(isCorrect) _score++;
    
    _currentQuestion++;
    return isCorrect;
  }

  bool isFinished() => _currentQuestion == questions.length;

  void showResult(){
    print("Quiz completed! Your socre: $_score out of ${questions.length}");
  }
}
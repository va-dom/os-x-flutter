class Question{
  String text;
  List<String> options;
  int answerIndex;

  Question(this.text, this.options, this.answerIndex);

  bool isCorrectAnswer(int chosenIndex) => chosenIndex == answerIndex;

}
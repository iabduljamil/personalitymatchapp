import 'question.dart';
class questionsBank{

  List<Question> questionBank=[
    Question("Do you like coffee ?",true),
    Question("Would you prefer chocolate flavor icecream over strawberry flavor icecream ?",false),
    Question("Do you like sunny days ?",false),
    Question("Do you like programming ?",true),
    Question("Do you like Manto ?",true),
    Question("Do you love having midnight snacks ?",true),
    Question("Are you a foodie ?",false),
    Question("Do you like watching movies in weekends ?",true),
    Question("Would you prefer burger over a pizza ?",false),

  ];

  String questions(
    int numb
  )
  {
    return questionBank[numb].questionText;
  }

  bool getAnswer(int numb)
  {
    return questionBank[numb].questionAnswer;
  }
}


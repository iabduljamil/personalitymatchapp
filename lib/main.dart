import 'package:flutter/material.dart';

import 'questions_bank.dart';

void main() => runApp(PersonalityMatch());

questionsBank quiz = new questionsBank();

class PersonalityMatch extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personality Match"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        //backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Match(),
          ),
        ),
      ),
    );
  }
}

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  @override
  

  

  List<Widget> answers =[
    // Icon(Icons.check,color:Colors.green),
  ];

  int questionIndex=0;

  double total=0;

  void calc()
  {
    setState((){
      total+=12.5;
    });
  }

  void questNext()
  {
    setState(() {
      questionIndex++;
    });
  }

  Widget build(BuildContext context) {
    return
    questionIndex < quiz.questionBank.length ? 
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.questions(questionIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  //color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
               questNext();

                bool correct=quiz.getAnswer(questionIndex-1);
                 if (correct==true)
                 {
                   calc();
                answers.add(Icon(Icons.check,color: Colors.green,));
                 }
                else
                {
                answers.add(Icon(Icons.cancel,color: Colors.red,));
                }

               
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                 questNext();
                bool correct=quiz.getAnswer(questionIndex-1);

                if(correct==false)
                {
                  calc();
                answers.add(Icon(Icons.check,color: Colors.green,));
                }
                else
                answers.add(Icon(Icons.cancel,color: Colors.red,));
              },
            ),
          ),
        ),
        Row(
       children: answers,
        )
      ],
    ):
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[Center(
        child:Container(padding: EdgeInsets.all(20),color: Colors.blue[700],
        child:Text("Our Personality Match $total%",style: TextStyle(fontSize: 20),),
        
      ),
      
      ),
      FlatButton(onPressed: (){
        setState(() {
          questionIndex=0;
          answers.clear();
          total=0;
        });
      }, child: Container(margin:EdgeInsets.only(top: 20),color: Colors.red,padding: EdgeInsets.all(15),child: Text("Try Again"),)),
        
      ]
    );
  }
}

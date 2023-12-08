import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers=[];
  var activeScreen = 'start-screen';
  /*Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen= StartScreen(switchScreen);
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void reStartQuiz(){
    setState((){
      activeScreen='start-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget=StartScreen(switchScreen);

    if(activeScreen=='questions-screen'){
      screenWidget=QuestionScreen(onSelectedAnswer: chooseAnswer);
    }

    if(activeScreen=='results-screen'){
      screenWidget= ResultsScreen(chosenAnswer:selectedAnswers,reStart: reStartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(150, 117, 206, 1),
                Color.fromRGBO(201, 187, 226, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

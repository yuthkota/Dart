import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/submission.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String currentScreen = 'welcome';
  late Quiz quiz;
  late Submission submission;

  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    quiz = widget.quiz;
    submission = Submission();
  }

  void switchScreen(String screen) {
    setState(() {
      currentScreen = screen;
    });
  }

  void submitAnswer(String answer) {
    Answer userAnswer = Answer(
      userChoice: answer,
      question: quiz.questions[currentQuestionIndex],
    );
    submission.addAnswer(userAnswer);

    if (currentQuestionIndex < quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      switchScreen('result');
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      submission.removeAnswers();
      switchScreen('welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: const Center(
              child: Text(
            "Quizz",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        backgroundColor: appColor,
        body: Center(
          child: currentScreen == 'welcome'
              ? WelcomeScreen(
                  onStart: () => switchScreen('question'), quiz: quiz)
              : currentScreen == 'question'
                  ? QuestionScreen(
                      question: quiz.questions[currentQuestionIndex],
                      onTap: (answer) => submitAnswer(answer))
                  : ResultScreen(
                      submission: submission,
                      onRestart: restartQuiz,
                      quiz: quiz,
                    ),
        ),
      ),
    );
  }
}

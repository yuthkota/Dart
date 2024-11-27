import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "What are the colors of Cambodia's flag?",
      possibleAnswers: ["Red, blue", "Yellow, green", 'Black, blue'],
      goodChoice: 'Red, blue');
  Question q2 = const Question(
      title: "How many provinces does Cambodia have?",
      possibleAnswers: ["20", "25", '24'],
      goodChoice: '25');
  Question q3 = const Question(
      title: "What is the capital city of Cambodia?",
      possibleAnswers: ["Phnom Penh", "Siem Reap", 'Bangkok'],
      goodChoice: 'Phnom Penh');
  Question q4 = const Question(
      title: "What is Cambodia's currrency?",
      possibleAnswers: ["Bhat", "Dollar", 'Riel'],
      goodChoice: 'Riel');

  List<Question> myQuestions = [q1, q2, q3, q4];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}

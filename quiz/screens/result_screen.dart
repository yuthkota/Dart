import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';
import '../widgets/app_button.dart';
import '../widgets/result.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final VoidCallback onRestart; 
  final Quiz quiz; 

  const ResultScreen({
    super.key,
    required this.submission,
    required this.onRestart,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();
    int totalQuestions = quiz.questions.length;

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $score on $totalQuestions !',
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final userAnswer = submission.answers[question];

                  return ResultItem(
                    question: question,
                    userAnswer: userAnswer,
                    correctAnswer: question.goodChoice,
                    questionIndex: index + 1,
                  );
                },
              ),
            ),
            AppButton("Restart Quiz", onTap: onRestart, icon: Icons.restart_alt,)
          ],
        ),
      );
  }
}
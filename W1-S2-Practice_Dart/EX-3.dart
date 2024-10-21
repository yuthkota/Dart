void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  var passingScores = scores.where((score) => score >= 50);

  int numberOfPasses = passingScores.length;

  print(passingScores.toList());
  print('Number of students who passed: $numberOfPasses');
}

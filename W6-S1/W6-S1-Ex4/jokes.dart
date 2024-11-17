class Joke {
  final String title;
  final String description;

  Joke(this.title, this.description);
}

List<Joke> jokes = List.generate(
  20,
  (index) => Joke('Joke Title ${index + 1}', 'This is the description of joke ${index+1}.'),
);

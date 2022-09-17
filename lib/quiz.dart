import 'package:practice_app/questions_page.dart';

class Quiz {
  int score = 0;
  int count = 0;

  List<Question> flags = [
    Question(
      "images/canada.png",
      "Canada",
      "USA",
      "Australia",
      "Canada",
      "Switzerland",
    ),
    Question(
      "images/pakistan.png",
      "Pakistan",
      "Pakistan",
      "Turkey",
      "Malaysia",
      "Tunisia",
    ),
    Question(
      "images/scotland.png",
      "Scotland",
      "England",
      "Ireland",
      "Scotland",
      "Greece",
    ),
    Question(
      "images/denmark.png",
      "Denmark",
      "Germany",
      "Spain",
      "Belgium",
      "Denmark",
    ),
    Question(
        "images/china.png", "China", "Austria", "China", "Spain", "Vietnam"),
    Question(
      "images/russia.png",
      "Russia",
      "Ukraine",
      "Hungary",
      "Russia",
      "France",
    ),
    Question(
      "images/south-korea.png",
      "South Korea",
      "Japan",
      "South Korea",
      "North Korea",
      "Singapore",
    ),
    Question(
      "images/france.png",
      "France",
      "France",
      "Spain",
      "Norway",
      "Netherlands",
    ),
    Question(
      "images/japan.png",
      "Japan",
      "Bangladesh",
      "USA",
      "North Korea",
      "Japan",
    ),
    Question(
      "images/italy.png",
      "Italy",
      "Mexico",
      "Italy",
      "Spain",
      "Germany",
    ),
  ];
  void nextFlag() {
    if (count < flags.length - 1) {
      count++;
    }
  }

  String getFlag() {
    return flags[count].flag;
  }

  void checkAnswer(String userSelected) {
    if (flags[count].answer == userSelected) {
      score++;
    }
  }

  bool isFinished() {
    if (count >= flags.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    count = 0;
    score = 0;
  }
}

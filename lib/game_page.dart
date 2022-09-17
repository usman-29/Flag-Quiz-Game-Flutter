// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:practice_app/quiz.dart';
import 'dart:math';
import 'package:confetti/confetti.dart';

class GamePage extends StatefulWidget {
  bool darkMode = false;
  GamePage({super.key, required this.darkMode});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = ConfettiController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Quiz quiz = Quiz();
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Your score:  ${quiz.score.toString()}",
              style: TextStyle(
                  color: widget.darkMode == true ? Colors.white : Colors.blue),
            )),
            backgroundColor:
                widget.darkMode == true ? Colors.black : Colors.white,
            actions: [
              MaterialButton(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: widget.darkMode == true ? Colors.white : Colors.blue,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    quiz.reset();
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                child: Text(
                  "Party",
                  style: TextStyle(
                    color: widget.darkMode == true ? Colors.white : Colors.blue,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (quiz.score > 7) {
                      _controller.play();
                    }
                  });
                },
              ),
              ConfettiWidget(
                confettiController: _controller,
                blastDirection: -pi / 2,
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.darkMode == true ? Colors.black : Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Score: ${quiz.score}/10",
                    style: TextStyle(
                      color:
                          widget.darkMode == true ? Colors.white : Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image(
                    image: AssetImage(quiz.flags[quiz.count].flag),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        quiz.checkAnswer(quiz.flags[quiz.count].option1);
                        setState(() {
                          if (quiz.isFinished() == true) {
                            _showDialog(context);
                          } else {
                            quiz.nextFlag();
                          }
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      color:
                          widget.darkMode == true ? Colors.black : Colors.blue,
                      child: Text(
                        quiz.flags[quiz.count].option1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        quiz.checkAnswer(quiz.flags[quiz.count].option2);
                        setState(() {
                          if (quiz.isFinished() == true) {
                            _showDialog(context);
                          } else {
                            quiz.nextFlag();
                          }
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      color:
                          widget.darkMode == true ? Colors.black : Colors.blue,
                      child: Text(
                        quiz.flags[quiz.count].option2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        quiz.checkAnswer(quiz.flags[quiz.count].option3);
                        setState(() {
                          if (quiz.isFinished() == true) {
                            _showDialog(context);
                          } else {
                            quiz.nextFlag();
                          }
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      color:
                          widget.darkMode == true ? Colors.black : Colors.blue,
                      child: Text(
                        quiz.flags[quiz.count].option3,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        quiz.checkAnswer(quiz.flags[quiz.count].option4);
                        setState(() {
                          if (quiz.isFinished() == true) {
                            _showDialog(context);
                          } else {
                            quiz.nextFlag();
                          }
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width / 1.5,
                      color:
                          widget.darkMode == true ? Colors.black : Colors.blue,
                      child: Text(
                        quiz.flags[quiz.count].option4,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

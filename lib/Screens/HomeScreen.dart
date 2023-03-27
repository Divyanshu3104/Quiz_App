import 'dart:async';
import 'package:assignment/ResultScreen.dart';
import 'package:assignment/api/apiservices.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  //used to initiate the timer
  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  @override
  //used to cancle the timer outside the screen
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  late Future quiz;
  var isLoaded = false;
  var optionsList = [];
  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  int Seconds = 60;
  int points = 0;

  //used for the timer animation
  Timer? timer;
  var currentQuestionIndex = 0;
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //to change the indicator and stop after reaching zero
      setState(() {
        if (Seconds > 0) {
          Seconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  pnt() {
    points = points + 10;
    print(points);
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    Seconds = 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data["results"];
                if (isLoaded == false) {
                  optionsList = data[currentQuestionIndex]["incorrect_answers"];
                  optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                  optionsList.shuffle();
                  isLoaded = true;
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(alignment: Alignment.center, children: [
                              //add second
                              Text(
                                '$Seconds',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: 60,
                                //used to show circular progress indicator
                                child: CircularProgressIndicator(
                                  value: Seconds / 60,
                                  valueColor: const AlwaysStoppedAnimation(
                                      Colors.green),
                                ),
                              )
                            ])
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Question ${currentQuestionIndex + 1} of ${data.length}",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data[currentQuestionIndex]["question"],
                          style: const TextStyle(
                              fontSize: 28, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var answer =
                              data[currentQuestionIndex]["correct_answer"];
                          return Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (answer.toString() ==
                                      optionsList[index].toString()) {
                                    optionsColor[index] = Colors.green;
                                    pnt();
                                  } else {
                                    optionsColor[index] = Colors.red;
                                  }

                                  if (currentQuestionIndex < data.length - 1) {
                                    Future.delayed(
                                        const Duration(milliseconds: 10), () {
                                      gotoNextQuestion();
                                    });
                                  } else {
                                    timer!.cancel();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResultScreen(),
                                        ));
                                    //here you can do whatever you want with the results
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                width: size.width - 30,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: optionsColor[index],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  optionsList[index].toString(),
                                  style: const TextStyle(
                                      fontSize: 28, color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

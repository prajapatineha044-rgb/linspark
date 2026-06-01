import 'package:flutter/material.dart';
import 'result_page.dart';

class GreetingsLessonPage extends StatefulWidget {
  const GreetingsLessonPage({super.key});

  @override
  State<GreetingsLessonPage> createState() =>
      _GreetingsLessonPageState();
}

class _GreetingsLessonPageState
    extends State<GreetingsLessonPage> {

  int currentIndex = 0;
  int? selectedIndex;
  bool checked = false;
  int score = 0;

  final List<Map<String, dynamic>> questions = [

    {
      "question":
      "Choose correct greeting:\nMeeting someone in evening",
      "options": [
        "Good Night",
        "Good Evening",
        "Good Morning",
        "See You"
      ],
      "answer": 1
    },

    {
      "question": "Meaning of:\nNice to meet you",
      "options": [
        "आपसे मिलकर अच्छा लगा",
        "फिर मिलेंगे",
        "माफ़ करना",
        "शुभ रात्रि"
      ],
      "answer": 0
    },

    {
      "question":
      "Choose polite reply:\n'How are you?'",
      "options": [
        "I am fine, thank you",
        "Go away",
        "Nothing",
        "No idea"
      ],
      "answer": 0
    },

    {
      "question": "Meaning of:\nSee you later",
      "options": [
        "अभी जाओ",
        "बाद में मिलते हैं",
        "सुप्रभात",
        "शुभकामनाएँ"
      ],
      "answer": 1
    },

    {
      "question":
      "What do you say before sleeping?",
      "options": [
        "Good Morning",
        "Good Afternoon",
        "Good Night",
        "Hello"
      ],
      "answer": 2
    },

    {
      "question": "Translate:\nध्यान रखना",
      "options": [
        "Take care",
        "Come here",
        "Go now",
        "Good job"
      ],
      "answer": 0
    },

    {
      "question": "Choose formal greeting:",
      "options": [
        "Hey bro!",
        "Good afternoon",
        "Yo!",
        "What's up?"
      ],
      "answer": 1
    },

    {
      "question":
      "Meaning of:\nPleased to meet you",
      "options": [
        "मुझे भूख लगी है",
        "आपसे मिलकर खुशी हुई",
        "जल्दी करो",
        "मुझे जाना है"
      ],
      "answer": 1
    },

    {
      "question":
      "You are leaving office. What will you say?",
      "options": [
        "Goodbye",
        "Good Morning",
        "Welcome",
        "Sorry"
      ],
      "answer": 0
    },

    {
      "question": "Translate:\nफिर मिलेंगे",
      "options": [
        "Good Luck",
        "See you again",
        "Take seat",
        "Come fast"
      ],
      "answer": 1
    },
  ];

  void checkAnswer() {
    if (selectedIndex == null) return;

    if (!checked) {
      checked = true;

      if (selectedIndex ==
          questions[currentIndex]["answer"]) {
        score++;
      }

      setState(() {});
    } else {
      if (currentIndex <
          questions.length - 1) {
        setState(() {
          currentIndex++;
          selectedIndex = null;
          checked = false;
        });
      } else {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultPage(
              score: score,
              totalQuestions: questions.length,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final q = questions[currentIndex];
    int correct = q["answer"];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [

              Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        Navigator.pop(context),
                    icon: const Icon(
                        Icons.arrow_back),
                  ),

                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(20),
                      child:
                      LinearProgressIndicator(
                        minHeight: 12,
                        value:
                        (currentIndex + 1) /
                            questions.length,
                        backgroundColor:
                        Colors.grey.shade300,
                        color:
                        Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Center(
                child: Image.asset(
                  "assets/cat.png",
                  height: 100,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient:
                  const LinearGradient(
                    colors: [
                      Color(0xFF8E2DE2),
                      Color(0xFFB245FF),
                    ],
                  ),
                  borderRadius:
                  BorderRadius.circular(
                      25),
                ),
                child: Text(
                  q["question"],
                  textAlign:
                  TextAlign.center,
                  style:
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder:
                      (context, index) {

                    Color bg =
                        Colors.white;
                    Color border =
                        Colors.grey
                            .shade300;

                    if (selectedIndex ==
                        index) {
                      bg = Colors
                          .deepPurple
                          .shade50;
                      border =
                          Colors.deepPurple;
                    }

                    if (checked) {
                      if (index ==
                          correct) {
                        bg = Colors
                            .green
                            .shade100;
                        border =
                            Colors.green;
                      } else if (
                      index ==
                          selectedIndex &&
                          selectedIndex !=
                              correct) {
                        bg = Colors.red
                            .shade100;
                        border =
                            Colors.red;
                      }
                    }

                    return GestureDetector(
                      onTap: checked
                          ? null
                          : () {
                        setState(() {
                          selectedIndex =
                              index;
                        });
                      },
                      child: Container(
                        margin:
                        const EdgeInsets
                            .symmetric(
                            vertical: 8),
                        padding:
                        const EdgeInsets
                            .all(18),
                        decoration:
                        BoxDecoration(
                          color: bg,
                          borderRadius:
                          BorderRadius
                              .circular(
                              20),
                          border:
                          Border.all(
                            color:
                            border,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          q["options"]
                          [index],
                          style:
                          const TextStyle(
                            fontSize:
                            18,
                            fontWeight:
                            FontWeight
                                .w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    Colors.deepPurple,
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius
                          .circular(
                          18),
                    ),
                  ),
                  onPressed:
                  checkAnswer,
                  child: Text(
                    checked
                        ? "NEXT LESSON"
                        : "CHECK",
                    style:
                    const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                      color:
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
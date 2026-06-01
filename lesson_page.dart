import 'package:flutter/material.dart';
import 'result_page.dart';

class LessonPage extends StatefulWidget {
  final String lessonTitle;

  const LessonPage({
    super.key,
    required this.lessonTitle,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int currentIndex = 0;
  int? selectedIndex;
  bool checked = false;
  int score = 0;

  final List<Map<String, dynamic>> questions = [

    {
      "question": "Complete: I ___ a student.",
      "options": ["am", "is", "are", "be"],
      "answer": 0
    },

    {
      "question": "Choose correct meaning:\nGood Morning",
      "options": [
        "शुभ प्रभात",
        "शुभ रात्रि",
        "माफ़ करना",
        "धन्यवाद"
      ],
      "answer": 0
    },

    {
      "question": "Choose correct sentence:",
      "options": [
        "She go to school",
        "She goes to school",
        "She going school",
        "She gone school"
      ],
      "answer": 1
    },

    {
      "question": "Meaning of:\nHungry",
      "options": [
        "थका हुआ",
        "भूखा",
        "डरा हुआ",
        "बीमार"
      ],
      "answer": 1
    },

    {
      "question": "Complete: They ___ football every Sunday.",
      "options": [
        "plays",
        "play",
        "playing",
        "played"
      ],
      "answer": 1
    },

    {
      "question": "Choose correct meaning:\nThank You",
      "options": [
        "माफ़ करना",
        "धन्यवाद",
        "कृपया",
        "फिर मिलेंगे"
      ],
      "answer": 1
    },

    {
      "question": "Complete: He ___ reading a book.",
      "options": [
        "is",
        "are",
        "am",
        "be"
      ],
      "answer": 0
    },

    {
      "question": "Meaning of:\nBeautiful",
      "options": [
        "सुंदर",
        "कमज़ोर",
        "तेज़",
        "सस्ता"
      ],
      "answer": 0
    },

    {
      "question": "Choose correct sentence:",
      "options": [
        "I am going home",
        "I going home",
        "I goes home",
        "I goings home"
      ],
      "answer": 0
    },

    {
      "question": "Complete: She ___ my best friend.",
      "options": [
        "am",
        "is",
        "are",
        "be"
      ],
      "answer": 1
    },
  ];

  void checkAnswer() {
    if (selectedIndex == null) return;

    if (!checked) {
      checked = true;

      if (selectedIndex == questions[currentIndex]["answer"]) {
        score++;
      }

      setState(() {});
    } else {
      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          selectedIndex = null;
          checked = false;
        });
      } else {

        // RESULT PAGE OPEN
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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        minHeight: 12,
                        value: (currentIndex + 1) / questions.length,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.deepPurple,
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
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8E2DE2),
                      Color(0xFFB245FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.deepPurpleAccent,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Text(
                  q["question"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {

                    Color bg = Colors.white;
                    Color border = Colors.grey.shade300;

                    if (selectedIndex == index) {
                      bg = Colors.deepPurple.shade50;
                      border = Colors.deepPurple;
                    }

                    if (checked) {
                      if (index == correct) {
                        bg = Colors.green.shade100;
                        border = Colors.green;
                      } else if (index == selectedIndex &&
                          selectedIndex != correct) {
                        bg = Colors.red.shade100;
                        border = Colors.red;
                      }
                    }

                    return GestureDetector(
                      onTap: checked
                          ? null
                          : () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: border,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          q["options"][index],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: checkAnswer,
                  child: Text(
                    checked ? "CONTINUE" : "CHECK",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
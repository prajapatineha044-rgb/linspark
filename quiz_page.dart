import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  final String unitTitle;

  const LessonPage({super.key, required this.unitTitle});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  int currentIndex = 0;
  int? selectedIndex;
  int score = 0;

  final List<Map<String, dynamic>> questions = [

    {
      "question": "Complete the sentence: I ___ a student.",
      "options": ["am", "is", "are", "be"],
      "answer": 0
    },

    {
      "question": "Choose correct sentence:",
      "options": ["She go to school", "She goes to school", "She going school", "She gone school"],
      "answer": 1
    },

    {
      "question": "Fill in the blank: They ___ playing football.",
      "options": ["is", "am", "are", "be"],
      "answer": 2
    },

    {
      "question": "Choose correct word:",
      "options": ["I has a car", "I have a car", "I haves car", "I having car"],
      "answer": 1
    },

    {
      "question": "Complete: He ___ reading a book.",
      "options": ["is", "are", "am", "be"],
      "answer": 0
    },

    {
      "question": "Choose correct sentence:",
      "options": ["We is friends", "We are friends", "We am friends", "We be friends"],
      "answer": 1
    },

    {
      "question": "Fill in blank: She ___ खाना (eats).",
      "options": ["eat", "eats", "eating", "ate"],
      "answer": 1
    },

    {
      "question": "Choose correct sentence:",
      "options": ["He go to office", "He goes to office", "He going office", "He gone office"],
      "answer": 1
    },

    {
      "question": "Complete: I ___ happy today.",
      "options": ["is", "am", "are", "be"],
      "answer": 1
    },

    {
      "question": "Fill blank: They ___ school every day.",
      "options": ["go", "goes", "going", "gone"],
      "answer": 0
    },
  ];

  void checkAnswer() {
    if (selectedIndex == null) return;

    if (selectedIndex == questions[currentIndex]["answer"]) {
      score++;
    }

    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedIndex = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Lesson Completed 🎉"),
          content: Text("Score: $score / ${questions.length}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final q = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3FA),

      appBar: AppBar(
        title: Text(widget.unitTitle),
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // PROGRESS
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
              color: Colors.deepPurple,
              backgroundColor: Colors.grey.shade300,
            ),

            const SizedBox(height: 20),

            // QUESTION CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                q["question"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // OPTIONS
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {

                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.deepPurple.shade100
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Colors.deepPurple
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        q["options"][index],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),

            // CHECK BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.all(14),
                ),
                onPressed: checkAnswer,
                child: const Text("CHECK"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
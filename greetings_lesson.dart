import 'package:flutter/material.dart';
import 'result_page.dart';

class GreetingsLessonPage extends StatefulWidget {
  final String language;

  const GreetingsLessonPage({
    super.key,
    required this.language,
  });

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

final Map<String, List<Map<String, dynamic>>> questions = {

// ENGLISH
"English": [
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
"Nice to meet you",
"Bye",
"Sorry",
"Thanks"
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
"See you later",
"Hello",
"Good night",
"Welcome"
],
"answer": 0
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
"question": "Translate:\nTake care",
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
"Happy to meet you",
"Hungry",
"Sleepy",
"Sad"
],
"answer": 0
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
"question": "Translate:\nSee you again",
"options": [
"See you again",
"Good Luck",
"Take seat",
"Come fast"
],
"answer": 0
},
],

// HINDI
"Hindi": [
{
"question":
"शाम में मिलने पर क्या कहेंगे?",
"options": [
"शुभ रात्रि",
"शुभ संध्या",
"सुप्रभात",
"फिर मिलेंगे"
],
"answer": 1
},
{
"question": "आपसे मिलकर अच्छा लगा",
"options": [
"Nice to meet you",
"Bye",
"Sorry",
"Hello"
],
"answer": 0
},
{
"question":
"'कैसे हो?' का जवाब",
"options": [
"मैं ठीक हूँ",
"जाओ",
"नहीं",
"कुछ नहीं"
],
"answer": 0
},
{
"question": "फिर मिलेंगे",
"options": [
"See you later",
"Good night",
"Welcome",
"Morning"
],
"answer": 0
},
{
"question":
"सोने से पहले क्या कहेंगे?",
"options": [
"सुप्रभात",
"नमस्ते",
"शुभ रात्रि",
"हैलो"
],
"answer": 2
},
{
"question": "ध्यान रखना",
"options": [
"Take care",
"Come here",
"Run",
"Sit"
],
"answer": 0
},
{
"question": "औपचारिक greeting",
"options": [
"हाय",
"शुभ दोपहर",
"Yo",
"Hey"
],
"answer": 1
},
{
"question":
"आपसे मिलकर खुशी हुई",
"options": [
"Pleased to meet you",
"Sleep",
"Food",
"Bye"
],
"answer": 0
},
{
"question":
"ऑफिस से जाते समय",
"options": [
"Goodbye",
"Welcome",
"Morning",
"Sorry"
],
"answer": 0
},
{
"question": "फिर मिलेंगे",
"options": [
"See you again",
"Run",
"Sit",
"Jump"
],
"answer": 0
},
],
// FRENCH
"French": [
{
"question": "Evening greeting",
"options": ["Bonjour", "Bonsoir", "Bonne nuit", "Salut"],
"answer": 1
},
{
"question": "Nice to meet you",
"options": ["Enchanté", "Bonjour", "Merci", "Salut"],
"answer": 0
},
{
"question": "How are you?",
"options": ["Ça va", "Merci", "Oui", "Non"],
"answer": 0
},
{
"question": "See you later",
"options": ["À bientôt", "Bonjour", "Merci", "Oui"],
"answer": 0
},
{
"question": "Good night",
"options": ["Bonne nuit", "Bonsoir", "Salut", "Bonjour"],
"answer": 0
},
{
"question": "Take care",
"options": ["Prends soin", "Merci", "Bonjour", "Salut"],
"answer": 0
},
{
"question": "Formal greeting",
"options": ["Salut", "Bonjour", "Yo", "Hey"],
"answer": 1
},
{
"question": "Pleased to meet you",
"options": ["Enchanté", "Merci", "Oui", "Non"],
"answer": 0
},
{
"question": "Goodbye",
"options": ["Au revoir", "Bonjour", "Merci", "Salut"],
"answer": 0
},
{
"question": "See you again",
"options": ["À bientôt", "Bonsoir", "Salut", "Merci"],
"answer": 0
},
],

// KOREAN
"Korean": [
{
"question": "Evening greeting",
"options": ["안녕", "안녕하세요", "잘 자요", "감사합니다"],
"answer": 1
},
{
"question": "Nice to meet you",
"options": ["반갑습니다", "안녕", "미안해", "감사"],
"answer": 0
},
{
"question": "How are you?",
"options": ["잘 지내요?", "감사", "안녕", "네"],
"answer": 0
},
{
"question": "See you later",
"options": ["나중에 봐요", "안녕", "감사", "죄송"],
"answer": 0
},
{
"question": "Good night",
"options": ["잘 자요", "안녕", "좋은 아침", "감사"],
"answer": 0
},
{
"question": "Take care",
"options": ["몸조심하세요", "안녕", "감사", "네"],
"answer": 0
},
{
"question": "Formal greeting",
"options": ["Yo", "안녕하세요", "Hey", "Hi"],
"answer": 1
},
{
"question": "Pleased to meet you",
"options": ["반갑습니다", "감사", "안녕", "미안"],
"answer": 0
},
{
"question": "Goodbye",
"options": ["안녕히 가세요", "안녕", "감사", "네"],
"answer": 0
},
{
"question": "See you again",
"options": ["또 봐요", "안녕", "감사", "미안"],
"answer": 0
},
],
// JAPANESE
"Japanese": [
{
"question": "Evening greeting",
"options": ["おはよう", "こんばんは", "おやすみ", "こんにちは"],
"answer": 1
},
{
"question": "Nice to meet you",
"options": ["はじめまして", "ありがとう", "さようなら", "こんにちは"],
"answer": 0
},
{
"question": "How are you?",
"options": ["元気ですか", "ありがとう", "はい", "いいえ"],
"answer": 0
},
{
"question": "See you later",
"options": ["またね", "こんにちは", "ありがとう", "おやすみ"],
"answer": 0
},
{
"question": "Good night",
"options": ["おやすみ", "こんばんは", "こんにちは", "ありがとう"],
"answer": 0
},
{
"question": "Take care",
"options": ["気をつけて", "ありがとう", "こんにちは", "さようなら"],
"answer": 0
},
{
"question": "Formal greeting",
"options": ["Hey", "こんにちは", "Yo", "Hi"],
"answer": 1
},
{
"question": "Pleased to meet you",
"options": ["よろしくお願いします", "ありがとう", "こんにちは", "さようなら"],
"answer": 0
},
{
"question": "Goodbye",
"options": ["さようなら", "こんにちは", "ありがとう", "はい"],
"answer": 0
},
{
"question": "See you again",
"options": ["また会いましょう", "こんにちは", "ありがとう", "おやすみ"],
"answer": 0
},
],

// SPANISH
"Spanish": [
{
"question": "Evening greeting",
"options": ["Hola", "Buenas noches", "Buenos días", "Adiós"],
"answer": 1
},
{
"question": "Nice to meet you",
"options": ["Mucho gusto", "Hola", "Gracias", "Adiós"],
"answer": 0
},
{
"question": "How are you?",
"options": ["¿Cómo estás?", "Gracias", "Hola", "Sí"],
"answer": 0
},
{
"question": "See you later",
"options": ["Hasta luego", "Hola", "Gracias", "No"],
"answer": 0
},
{
"question": "Good night",
"options": ["Buenas noches", "Hola", "Buenos días", "Gracias"],
"answer": 0
},
{
"question": "Take care",
"options": ["Cuídate", "Hola", "Gracias", "Sí"],
"answer": 0
},
{
"question": "Formal greeting",
"options": ["Hola", "Buenos días", "Yo", "Hey"],
"answer": 1
},
{
"question": "Pleased to meet you",
"options": ["Mucho gusto", "Gracias", "No", "Sí"],
"answer": 0
},
{
"question": "Goodbye",
"options": ["Adiós", "Hola", "Gracias", "Sí"],
"answer": 0
},
{
"question": "See you again",
"options": ["Hasta luego", "Hola", "Gracias", "No"],
"answer": 0
},
],
  // ARABIC
  "Arabic": [
    {
      "question": "Evening greeting",
      "options": ["مرحبا", "مساء الخير", "صباح الخير", "مع السلامة"],
      "answer": 1
    },
    {
      "question": "Nice to meet you",
      "options": ["تشرفت بلقائك", "مرحبا", "شكرا", "مع السلامة"],
      "answer": 0
    },
    {
      "question": "How are you?",
      "options": ["كيف حالك؟", "شكرا", "مرحبا", "نعم"],
      "answer": 0
    },
    {
      "question": "See you later",
      "options": ["أراك لاحقاً", "مرحبا", "شكرا", "لا"],
      "answer": 0
    },
    {
      "question": "Good night",
      "options": ["تصبح على خير", "مرحبا", "صباح الخير", "شكرا"],
      "answer": 0
    },
    {
      "question": "Take care",
      "options": ["اعتن بنفسك", "مرحبا", "شكرا", "نعم"],
      "answer": 0
    },
    {
      "question": "Formal greeting",
      "options": ["Hey", "صباح الخير", "Yo", "Hi"],
      "answer": 1
    },
    {
      "question": "Pleased to meet you",
      "options": ["تشرفت بلقائك", "شكرا", "مرحبا", "مع السلامة"],
      "answer": 0
    },
    {
      "question": "Goodbye",
      "options": ["مع السلامة", "مرحبا", "شكرا", "نعم"],
      "answer": 0
    },
    {
      "question": "See you again",
      "options": ["أراك مرة أخرى", "مرحبا", "شكرا", "لا"],
      "answer": 0
    },
  ],

  // CHINESE
  "Chinese": [
    {
      "question": "Evening greeting",
      "options": ["你好", "晚上好", "早上好", "再见"],
      "answer": 1
    },
    {
      "question": "Nice to meet you",
      "options": ["很高兴认识你", "你好", "谢谢", "再见"],
      "answer": 0
    },
    {
      "question": "How are you?",
      "options": ["你好吗？", "谢谢", "你好", "是"],
      "answer": 0
    },
    {
      "question": "See you later",
      "options": ["回头见", "你好", "谢谢", "不是"],
      "answer": 0
    },
    {
      "question": "Good night",
      "options": ["晚安", "你好", "早上好", "谢谢"],
      "answer": 0
    },
    {
      "question": "Take care",
      "options": ["保重", "你好", "谢谢", "是"],
      "answer": 0
    },
    {
      "question": "Formal greeting",
      "options": ["Hey", "你好", "Yo", "Hi"],
      "answer": 1
    },
    {
      "question": "Pleased to meet you",
      "options": ["很高兴认识你", "谢谢", "你好", "再见"],
      "answer": 0
    },
    {
      "question": "Goodbye",
      "options": ["再见", "你好", "谢谢", "是"],
      "answer": 0
    },
    {
      "question": "See you again",
      "options": ["再见面", "你好", "谢谢", "不是"],
      "answer": 0
    },
  ],
};

void checkAnswer() {
  final currentQuestions =
      questions[widget.language] ?? questions["English"]!;

  if (selectedIndex == null) return;

  if (!checked) {
    checked = true;

    if (selectedIndex ==
        currentQuestions[currentIndex]["answer"]) {
      score++;
    }

    setState(() {});
  } else {
    if (currentIndex <
        currentQuestions.length - 1) {
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
            totalQuestions:
            currentQuestions.length,
          ),
        ),
      );
    }
  }
}

@override
Widget build(BuildContext context) {
  final currentQuestions =
      questions[widget.language] ??
          questions["English"]!;

  final q = currentQuestions[currentIndex];
  int correct = q["answer"];

  return Scaffold(
    backgroundColor:
    const Color(0xFFF7F3FF),

    body: SafeArea(
      child: Padding(
        padding:
        const EdgeInsets.all(18),
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
                    BorderRadius.circular(
                        20),
                    child:
                    LinearProgressIndicator(
                      minHeight: 12,
                      value:
                      (currentIndex + 1) /
                          currentQuestions
                              .length,
                      backgroundColor:
                      Colors.grey
                          .shade300,
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
              const EdgeInsets.all(
                  22),
              decoration:
              BoxDecoration(
                gradient:
                const LinearGradient(
                  colors: [
                    Color(0xFF8E2DE2),
                    Color(0xFFB245FF),
                  ],
                ),
                borderRadius:
                BorderRadius
                    .circular(25),
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
                        Colors
                            .deepPurple;
                  }

                  if (checked) {
                    if (index ==
                        correct) {
                      bg = Colors
                          .green
                          .shade100;
                      border =
                          Colors.green;
                    } else if (index ==
                        selectedIndex) {
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
                          color: border,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        q["options"]
                        [index],
                        style:
                        const TextStyle(
                          fontSize: 18,
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
                ElevatedButton
                    .styleFrom(
                  backgroundColor:
                  Colors
                      .deepPurple,
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
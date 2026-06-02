import 'package:flutter/material.dart';
import 'result_page.dart';

class LessonPage extends StatefulWidget {
  final String lessonTitle;
  final String language;

  const LessonPage({
    super.key,
    required this.lessonTitle,
    required this.language,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int currentIndex = 0;
  int? selectedIndex;
  bool checked = false;
  int score = 0;

  final Map<String, List<Map<String, dynamic>>> questions = {

    // ENGLISH
    "English": [
      {
        "question": "Complete: I ___ a student.",
        "options": ["am", "is", "are", "be"],
        "answer": 0
      },
      {
        "question": "Meaning of Good Morning",
        "options": [
          "Good Morning",
          "Good Night",
          "Sorry",
          "Thanks"
        ],
        "answer": 0
      },
      {
        "question": "Choose correct sentence",
        "options": [
          "She go to school",
          "She goes to school",
          "She going school",
          "She gone school"
        ],
        "answer": 1
      },
      {
        "question": "Meaning of Hungry",
        "options": [
          "Tired",
          "Hungry",
          "Afraid",
          "Sick"
        ],
        "answer": 1
      },
      {
        "question": "Complete: They ___ football.",
        "options": [
          "plays",
          "play",
          "playing",
          "played"
        ],
        "answer": 1
      },
      {
        "question": "Meaning of Thank You",
        "options": [
          "Sorry",
          "Thank You",
          "Please",
          "Bye"
        ],
        "answer": 1
      },
      {
        "question": "Complete: He ___ reading.",
        "options": [
          "is",
          "are",
          "am",
          "be"
        ],
        "answer": 0
      },
      {
        "question": "Meaning of Beautiful",
        "options": [
          "Beautiful",
          "Weak",
          "Fast",
          "Cheap"
        ],
        "answer": 0
      },
      {
        "question": "Choose correct sentence",
        "options": [
          "I am going home",
          "I going home",
          "I goes home",
          "I goings home"
        ],
        "answer": 0
      },
      {
        "question": "Complete: She ___ my friend.",
        "options": [
          "am",
          "is",
          "are",
          "be"
        ],
        "answer": 1
      },
    ],

    // HINDI
    "Hindi": [
      {
        "question": "पूरा करो: मैं ___ छात्र हूँ।",
        "options": ["हूँ", "है", "हो", "था"],
        "answer": 0
      },
      {
        "question": "Good Morning का मतलब",
        "options": [
          "शुभ प्रभात",
          "शुभ रात्रि",
          "माफ़ करना",
          "धन्यवाद"
        ],
        "answer": 0
      },
      {
        "question": "सही वाक्य चुनो",
        "options": [
          "वह स्कूल जाता",
          "वह स्कूल जाती है",
          "वह स्कूल जाना",
          "वह गया स्कूल"
        ],
        "answer": 1
      },
      {
        "question": "Hungry का मतलब",
        "options": [
          "थका",
          "भूखा",
          "डरा",
          "बीमार"
        ],
        "answer": 1
      },
      {
        "question": "पूरा करो: वे ___ खेलते हैं।",
        "options": [
          "खेलता",
          "खेलते",
          "खेला",
          "खेलना"
        ],
        "answer": 1
      },
      {
        "question": "Thank You का मतलब",
        "options": [
          "माफ़ करना",
          "धन्यवाद",
          "कृपया",
          "फिर मिलेंगे"
        ],
        "answer": 1
      },
      {
        "question": "पूरा करो: वह ___ किताब पढ़ रहा है।",
        "options": [
          "है",
          "हूँ",
          "हो",
          "था"
        ],
        "answer": 0
      },
      {
        "question": "Beautiful का मतलब",
        "options": [
          "सुंदर",
          "कमज़ोर",
          "तेज़",
          "सस्ता"
        ],
        "answer": 0
      },
      {
        "question": "सही वाक्य चुनो",
        "options": [
          "मैं घर जा रहा हूँ",
          "मैं घर जाना",
          "मैं घर जाते",
          "मैं घर गई"
        ],
        "answer": 0
      },
      {
        "question": "पूरा करो: वह मेरी ___ दोस्त है।",
        "options": [
          "हूँ",
          "है",
          "हो",
          "था"
        ],
        "answer": 1
      },
    ],

    // FRENCH
    "French": [
  {
    "question": "Complete: Je ___ étudiant.",
    "options": ["suis", "es", "est", "être"],
    "answer": 0
  },
  {
  "question": "Good Morning in French",
  "options": [
  "Bonjour",
  "Bonsoir",
  "Merci",
  "Salut"
  ],
  "answer": 0
},
      {
        "question": "Correct sentence",
        "options": [
          "Elle va à l'école",
          "Elle aller école",
          "Elle va école",
          "Elle allé école"
        ],
        "answer": 0
      },
      {
        "question": "Hungry in French",
        "options": [
          "Fatigué",
          "Affamé",
          "Malade",
          "Triste"
        ],
        "answer": 1
      },
      {
        "question": "They ___ football",
        "options": [
          "joue",
          "jouent",
          "jouer",
          "joué"
        ],
        "answer": 1
      },
      {
        "question": "Thank you in French",
        "options": [
          "Bonjour",
          "Merci",
          "Pardon",
          "Salut"
        ],
        "answer": 1
      },
      {
        "question": "He ___ reading",
        "options": [
          "est",
          "suis",
          "es",
          "être"
        ],
        "answer": 0
      },
      {
        "question": "Beautiful in French",
        "options": [
          "Beau",
          "Faible",
          "Rapide",
          "Cher"
        ],
        "answer": 0
      },
      {
        "question": "Correct sentence",
        "options": [
          "Je vais à la maison",
          "Je maison aller",
          "Je aller maison",
          "Je vais maison aller"
        ],
        "answer": 0
      },
      {
        "question": "She ___ my friend",
        "options": [
          "suis",
          "est",
          "es",
          "être"
        ],
        "answer": 1
      },
    ],

    // KOREAN
    "Korean": [
      {
        "question": "I am student",
        "options": ["입니다", "안녕", "감사", "잘가"],
        "answer": 0
      },
      {
        "question": "Good Morning in Korean",
        "options": [
          "좋은 아침",
          "안녕히 가세요",
          "감사합니다",
          "안녕"
        ],
        "answer": 0
      },
      {
        "question": "Correct greeting",
        "options": [
          "안녕하세요",
          "잘가",
          "싫어요",
          "아니요"
        ],
        "answer": 0
      },
      {
        "question": "Hungry in Korean",
        "options": [
          "배고파요",
          "행복",
          "슬픔",
          "아파요"
        ],
        "answer": 0
      },
      {
        "question": "Thank You",
        "options": [
          "감사합니다",
          "안녕",
          "싫어요",
          "잘가"
        ],
        "answer": 0
      },
      {
        "question": "Beautiful",
        "options": [
          "예뻐요",
          "아파요",
          "배고파요",
          "싫어요"
        ],
        "answer": 0
      },
      {
        "question": "Goodbye",
        "options": [
          "안녕히 가세요",
          "감사합니다",
          "예뻐요",
          "안녕"
        ],
        "answer": 0
      },
      {
        "question": "Friend in Korean",
        "options": [
          "친구",
          "학교",
          "집",
          "책"
        ],
        "answer": 0
      },
      {
        "question": "School in Korean",
        "options": [
          "학교",
          "친구",
          "집",
          "책"
        ],
        "answer": 0
      },
      {
        "question": "Book in Korean",
        "options": [
          "책",
          "학교",
          "집",
          "친구"
        ],
        "answer": 0
      },
    ],

    // JAPANESE
    "Japanese": [
  {
    "question": "I am student",
    "options": [
      "です",
      "こんにちは",
      "ありがとう",
      "さようなら"
    ],
    "answer": 0
  },
  {
  "question": "Good Morning in Japanese",
  "options": [
  "おはよう",
  "こんばんは",
  "ありがとう",
  "こんにちは"
  ],
  "answer": 0
},
{
"question": "Thank You",
"options": [
"ありがとう",
"こんにちは",
"さようなら",
"いいえ"
],
"answer": 0
},
{
"question": "Goodbye",
"options": [
"さようなら",
"ありがとう",
"こんにちは",
"はい"
],
"answer": 0
},
{
"question": "Friend in Japanese",
"options": [
"ともだち",
"がっこう",
"いえ",
"ほん"
],
"answer": 0
},
      {
        "question": "School in Japanese",
        "options": [
          "がっこう",
          "ともだち",
          "いえ",
          "ほん"
        ],
        "answer": 0
      },
      {
        "question": "Book in Japanese",
        "options": [
          "ほん",
          "いえ",
          "ともだち",
          "がっこう"
        ],
        "answer": 0
      },
      {
        "question": "Hello in Japanese",
        "options": [
          "こんにちは",
          "ありがとう",
          "さようなら",
          "いいえ"
        ],
        "answer": 0
      },
      {
        "question": "Hungry in Japanese",
        "options": [
          "おなかすいた",
          "うれしい",
          "かなしい",
          "ねむい"
        ],
        "answer": 0
      },
      {
        "question": "Beautiful in Japanese",
        "options": [
          "きれい",
          "かなしい",
          "おそい",
          "ねむい"
        ],
        "answer": 0
      },
    ],

    // CHINESE
    "Chinese": [
      {
        "question": "I am student",
        "options": ["我是学生", "你好", "谢谢", "再见"],
        "answer": 0
      },
      {
        "question": "Good Morning in Chinese",
        "options": [
          "早上好",
          "晚上好",
          "谢谢",
          "你好"
        ],
        "answer": 0
      },
      {
        "question": "Thank You",
        "options": [
          "谢谢",
          "你好",
          "再见",
          "不"
        ],
        "answer": 0
      },
      {
        "question": "Beautiful",
        "options": [
          "漂亮",
          "累",
          "慢",
          "难过"
        ],
        "answer": 0
      },
      {
        "question": "Goodbye",
        "options": [
          "再见",
          "谢谢",
          "你好",
          "是"
        ],
        "answer": 0
      },
      {
        "question": "Friend in Chinese",
        "options": [
          "朋友",
          "学校",
          "家",
          "书"
        ],
        "answer": 0
      },
      {
        "question": "School in Chinese",
        "options": [
          "学校",
          "朋友",
          "家",
          "书"
        ],
        "answer": 0
      },
      {
        "question": "Book in Chinese",
        "options": [
          "书",
          "家",
          "朋友",
          "学校"
        ],
        "answer": 0
      },
      {
        "question": "Hello in Chinese",
        "options": [
          "你好",
          "谢谢",
          "再见",
          "不"
        ],
        "answer": 0
      },
      {
        "question": "Hungry in Chinese",
        "options": [
          "我饿了",
          "开心",
          "难过",
          "累"
        ],
        "answer": 0
      },
    ],

    // SPANISH
    "Spanish": [
  {
    "question": "I am student",
    "options": [
      "Soy estudiante",
      "Hola",
      "Gracias",
      "Adiós"
    ],
    "answer": 0
  },
  {
  "question": "Good Morning in Spanish",
  "options": [
  "Buenos días",
  "Buenas noches",
  "Gracias",
  "Hola"
  ],
  "answer": 0
},
{
"question": "Thank You",
"options": [
"Gracias",
"Hola",
"Adiós",
"No"
],
"answer": 0
},
{
"question": "Beautiful",
"options": [
"Hermoso",
"Triste",
"Lento",
"Débil"
],
"answer": 0
},
{
"question": "Goodbye",
"options": [
"Adiós",
"Gracias",
"Hola",
"Sí"
],
"answer": 0
},
{
"question": "Friend in Spanish",
"options": [
"Amigo",
"Escuela",
"Casa",
"Libro"
],
"answer": 0
},
{
"question": "School in Spanish",
"options": [
"Escuela",
"Amigo",
"Casa",
"Libro"
],
"answer": 0
},
{
"question": "Book in Spanish",
"options": [
"Libro",
"Casa",
"Amigo",
"Escuela"
],
"answer": 0
},
{
"question": "Hello in Spanish",
"options": [
"Hola",
"Gracias",
"Adiós",
"No"
],
"answer": 0
},
{
"question": "Hungry in Spanish",
"options": [
"Hambriento",
"Feliz",
"Triste",
"Cansado"
],
"answer": 0
},
],

// ARABIC
"Arabic": [
{
"question": "I am student",
"options": [
"أنا طالب",
"مرحبا",
"شكرا",
"مع السلامة"
],
"answer": 0
},
{
"question": "Good Morning in Arabic",
"options": [
"صباح الخير",
"مساء الخير",
"شكرا",
"مرحبا"
],
"answer": 0
},
{
"question": "Thank You",
"options": [
"شكرا",
"مرحبا",
"مع السلامة",
"لا"
],
"answer": 0
},
{
"question": "Beautiful",
"options": [
"جميل",
"حزين",
"بطيء",
"ضعيف"
],
"answer": 0
},
{
"question": "Goodbye",
"options": [
"مع السلامة",
"شكرا",
"مرحبا",
"نعم"
],
"answer": 0
},
{
"question": "Friend in Arabic",
"options": [
"صديق",
"مدرسة",
"بيت",
"كتاب"
],
"answer": 0
},
{
"question": "School in Arabic",
"options": [
"مدرسة",
"صديق",
"بيت",
"كتاب"
],
"answer": 0
},
{
"question": "Book in Arabic",
"options": [
"كتاب",
"بيت",
"صديق",
"مدرسة"
],
"answer": 0
},
{
"question": "Hello in Arabic",
"options": [
"مرحبا",
"شكرا",
"مع السلامة",
"لا"
],
"answer": 0
},
{
"question": "Hungry in Arabic",
"options": [
"جائع",
"سعيد",
"حزين",
"متعب"
],
"answer": 0
},
],
};

void checkAnswer() {
final currentQuestions =
questions[widget.language] ??
questions["English"]!;

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
      backgroundColor: const Color(0xFFF7F3FF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [

              // TOP BAR
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
                            currentQuestions
                                .length,
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

              // CAT IMAGE
              Center(
                child: Image.asset(
                  "assets/cat.png",
                  height: 100,
                ),
              ),

              const SizedBox(height: 20),

              // QUESTION CARD
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
                  boxShadow: const [
                    BoxShadow(
                      color:
                      Colors.deepPurpleAccent,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
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

              // OPTIONS
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
                        bg = Colors
                            .red
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
                          vertical: 8,
                        ),
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

              // VIOLET BUTTON
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  style:
                  ElevatedButton
                      .styleFrom(
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
                        ? "CONTINUE"
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
import 'package:flutter/material.dart';
import 'result_page.dart';

class FamilyLessonPage extends StatefulWidget {
  final String language;

  const FamilyLessonPage({
    super.key,
    required this.language,
  });

  @override
  State<FamilyLessonPage> createState() =>
      _FamilyLessonPageState();
}

class _FamilyLessonPageState extends State<FamilyLessonPage> {

int currentIndex = 0;
int? selectedIndex;
bool checked = false;
int score = 0;
final Map<String, List<Map<String, dynamic>>> questions = {

  // 🇬🇧 ENGLISH (Duolingo style)
  "English": [
    {"question": "What does 'mother' refer to?", "options": ["Male parent","Female parent","Sibling","Friend"], "answer": 1},
    {"question": "Who is your father?", "options": ["Mother","Male parent","Cousin","Teacher"], "answer": 1},
    {"question": "A brother is:", "options": ["Male sibling","Female sibling","Uncle","Friend"], "answer": 0},
    {"question": "A sister is:", "options": ["Male sibling","Female sibling","Aunt","Neighbor"], "answer": 1},
    {"question": "Grandmother is:", "options": ["Mother of parent","Friend","Teacher","Cousin"], "answer": 0},
    {"question": "Grandfather is:", "options": ["Father of parent","Uncle","Friend","Brother"], "answer": 0},
    {"question": "Uncle is:", "options": ["Parent’s brother","Friend","Teacher","Neighbor"], "answer": 0},
    {"question": "Aunt is:", "options": ["Parent’s sister","Friend","Cousin","Teacher"], "answer": 0},
    {"question": "Cousin is:", "options": ["Uncle/Aunt child","Sibling","Friend","Teacher"], "answer": 0},
    {"question": "Family means:", "options": ["Relatives","Friends","School","Class"], "answer": 0},
  ],

  // 🇮🇳 HINDI
  "Hindi": [
    {"question": "माँ किसे कहते हैं?", "options": ["पुरुष अभिभावक","महिला अभिभावक","दोस्त","भाई"], "answer": 1},
    {"question": "पिता कौन होता है?", "options": ["माँ","पुरुष अभिभावक","दोस्त","चाचा"], "answer": 1},
    {"question": "भाई क्या है?", "options": ["पुरुष सहोदर","महिला सहोदर","दोस्त","मामा"], "answer": 0},
    {"question": "बहन क्या है?", "options": ["पुरुष सहोदर","महिला सहोदर","चाची","दोस्त"], "answer": 1},
    {"question": "दादी कौन है?", "options": ["माता की माँ","दोस्त","टीचर","बहन"], "answer": 0},
    {"question": "दादा कौन है?", "options": ["पिता के पिता","चाचा","दोस्त","भाई"], "answer": 0},
    {"question": "चाचा कौन है?", "options": ["पिता का भाई","मित्र","भाई","टीचर"], "answer": 0},
    {"question": "चाची कौन है?", "options": ["चाचा की पत्नी","माँ","दोस्त","बहन"], "answer": 0},
    {"question": "कज़िन कौन है?", "options": ["चाचा/मामा का बच्चा","दोस्त","टीचर","पड़ोसी"], "answer": 0},
    {"question": "परिवार क्या है?", "options": ["रिश्तेदारों का समूह","दोस्त","स्कूल","पड़ोसी"], "answer": 0},
  ],

  // 🇫🇷 FRENCH
  "French": [
    {"question": "What does 'mère' mean?", "options": ["Father","Mother","Brother","Friend"], "answer": 1},
    {"question": "What does 'père' mean?", "options": ["Mother","Father","Cousin","Teacher"], "answer": 1},
    {"question": "Frère means:", "options": ["Brother","Sister","Uncle","Friend"], "answer": 0},
    {"question": "Sœur means:", "options": ["Brother","Sister","Aunt","Neighbor"], "answer": 1},
    {"question": "Grandmother is:", "options": ["Parent’s mother","Friend","Teacher","Cousin"], "answer": 0},
    {"question": "Grandfather is:", "options": ["Parent’s father","Friend","Brother","Teacher"], "answer": 0},
    {"question": "Uncle is:", "options": ["Parent’s brother","Friend","Teacher","Neighbor"], "answer": 0},
    {"question": "Aunt is:", "options": ["Parent’s sister","Friend","Cousin","Teacher"], "answer": 0},
    {"question": "Cousin is:", "options": ["Uncle/Aunt child","Friend","Sibling","Teacher"], "answer": 0},
    {"question": "Family is:", "options": ["Relatives","Friends","School","Class"], "answer": 0},
  ],

  // 🇩🇪 GERMAN (FIXED - ADDED PROPERLY)
  "German": [
    {"question": "What does 'Mutter' mean?", "options": ["Father","Mother","Brother","Friend"], "answer": 1},
    {"question": "What does 'Vater' mean?", "options": ["Mother","Father","Cousin","Teacher"], "answer": 1},
    {"question": "Bruder means:", "options": ["Brother","Sister","Uncle","Friend"], "answer": 0},
    {"question": "Schwester means:", "options": ["Brother","Sister","Aunt","Neighbor"], "answer": 1},
    {"question": "Großmutter is:", "options": ["Grandmother","Friend","Teacher","Cousin"], "answer": 0},
    {"question": "Großvater is:", "options": ["Grandfather","Friend","Brother","Teacher"], "answer": 0},
    {"question": "Onkel means:", "options": ["Uncle","Aunt","Friend","Teacher"], "answer": 0},
    {"question": "Tante means:", "options": ["Aunt","Uncle","Friend","Cousin"], "answer": 0},
    {"question": "Cousin means:", "options": ["Cousin","Friend","Teacher","Doctor"], "answer": 0},
    {"question": "Familie means:", "options": ["Family","School","Friend","Book"], "answer": 0},
  ],

  // 🇰🇷 KOREAN
  "Korean": [
    {"question": "Mother in Korean?", "options": ["아버지","어머니","형","친구"], "answer": 1},
    {"question": "Father in Korean?", "options": ["아버지","어머니","누나","친구"], "answer": 0},
    {"question": "Brother means:", "options": ["형","누나","친구","삼촌"], "answer": 0},
    {"question": "Sister means:", "options": ["형","누나","어머니","아버지"], "answer": 1},
    {"question": "Grandmother is:", "options": ["할머니","친구","선생님","형"], "answer": 0},
    {"question": "Grandfather is:", "options": ["할아버지","친구","형","삼촌"], "answer": 0},
    {"question": "Uncle means:", "options": ["삼촌","이모","친구","형"], "answer": 0},
    {"question": "Aunt means:", "options": ["이모","삼촌","친구","형"], "answer": 0},
    {"question": "Cousin means:", "options": ["사촌","선생님","의사","친구"], "answer": 0},
    {"question": "Family means:", "options": ["가족","학교","친구","책"], "answer": 0},
  ],

  // 🇨🇳 CHINESE
  "Chinese": [
    {"question": "Mother?", "options": ["爸爸","妈妈","哥哥","姐姐"], "answer": 1},
    {"question": "Father?", "options": ["爸爸","妈妈","哥哥","朋友"], "answer": 0},
    {"question": "Brother means:", "options": ["哥哥","姐姐","叔叔","朋友"], "answer": 0},
    {"question": "Sister means:", "options": ["哥哥","姐姐","妈妈","爸爸"], "answer": 1},
    {"question": "Grandmother:", "options": ["奶奶","朋友","老师","哥哥"], "answer": 0},
    {"question": "Grandfather:", "options": ["爷爷","朋友","叔叔","哥哥"], "answer": 0},
    {"question": "Uncle:", "options": ["叔叔","阿姨","哥哥","朋友"], "answer": 0},
    {"question": "Aunt:", "options": ["阿姨","叔叔","朋友","哥哥"], "answer": 0},
    {"question": "Cousin:", "options": ["表兄弟","老师","医生","朋友"], "answer": 0},
    {"question": "Family:", "options": ["家庭","学校","朋友","书"], "answer": 0},
  ],

  // 🇪🇸 SPANISH
  "Spanish": [
    {"question": "Mother means:", "options": ["Padre","Madre","Hermano","Amigo"], "answer": 1},
    {"question": "Father means:", "options": ["Padre","Madre","Hermano","Amigo"], "answer": 0},
    {"question": "Brother means:", "options": ["Hermano","Hermana","Tío","Amigo"], "answer": 0},
    {"question": "Sister means:", "options": ["Hermano","Hermana","Madre","Padre"], "answer": 1},
    {"question": "Grandmother:", "options": ["Abuela","Amigo","Profesor","Hermano"], "answer": 0},
    {"question": "Grandfather:", "options": ["Abuelo","Amigo","Profesor","Hermano"], "answer": 0},
    {"question": "Uncle:", "options": ["Tío","Tía","Amigo","Hermano"], "answer": 0},
    {"question": "Aunt:", "options": ["Tía","Tío","Amigo","Hermano"], "answer": 0},
    {"question": "Cousin:", "options": ["Primo","Profesor","Doctor","Amigo"], "answer": 0},
    {"question": "Family:", "options": ["Familia","Escuela","Amigo","Libro"], "answer": 0},
  ],

  // 🇸🇦 ARABIC
  "Arabic": [
    {"question": "Mother?", "options": ["أب","أم","أخ","صديق"], "answer": 1},
    {"question": "Father?", "options": ["أب","أم","أخ","صديق"], "answer": 0},
    {"question": "Brother:", "options": ["أخ","أخت","عم","صديق"], "answer": 0},
    {"question": "Sister:", "options": ["أخت","أخ","أب","أم"], "answer": 0},
    {"question": "Grandmother:", "options": ["جدة","أب","صديق","أخ"], "answer": 0},
    {"question": "Grandfather:", "options": ["جد","أب","أخ","صديق"], "answer": 0},
    {"question": "Uncle:", "options": ["عم","عمة","صديق","أخ"], "answer": 0},
    {"question": "Aunt:", "options": ["عمة","عم","أخ","صديق"], "answer": 0},
    {"question": "Cousin:", "options": ["ابن العم","صديق","معلم","طبيب"], "answer": 0},
    {"question": "Family:", "options": ["عائلة","مدرسة","كتاب","صديق"], "answer": 0},
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
if (currentIndex < currentQuestions.length - 1) {
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
totalQuestions: currentQuestions.length,
),
),
);
}
}
}
@override
Widget build(BuildContext context) {
  final currentQuestions =
      questions[widget.language] ?? questions["English"]!;

  final q = currentQuestions[currentIndex];
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
                      value: (currentIndex + 1) /
                          currentQuestions.length,
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
                        border: Border.all(color: border, width: 2),
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
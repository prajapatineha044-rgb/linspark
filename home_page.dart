import 'package:flutter/material.dart';
import 'lesson_page.dart';
import 'greetings_lesson.dart';
import 'family_lesson.dart';

class HomePage extends StatelessWidget {
  final String userName;
  final String selectedLanguage;

  const HomePage({
    super.key,
    required this.userName,
    required this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> lessons = [
      {"title": "Basics", "icon": Icons.star},
      {"title": "Greetings", "icon": Icons.chat},
      {"title": "Family", "icon": Icons.favorite},
      {"title": "Food", "icon": Icons.restaurant},
      {"title": "Travel", "icon": Icons.flight},

      {"title": "School", "icon": Icons.school},
      {"title": "Friends", "icon": Icons.people},
      {"title": "Shopping", "icon": Icons.shopping_bag},
      {"title": "Nature", "icon": Icons.park},
      {"title": "Music", "icon": Icons.music_note},

      {"title": "Sports", "icon": Icons.sports_soccer},
      {"title": "Health", "icon": Icons.health_and_safety},
      {"title": "Animals", "icon": Icons.pets},
      {"title": "Work", "icon": Icons.work},
      {"title": "Movies", "icon": Icons.movie},

      {"title": "Technology", "icon": Icons.computer},
      {"title": "Culture", "icon": Icons.public},
      {"title": "Weather", "icon": Icons.cloud},
      {"title": "Transport", "icon": Icons.directions_bus},
      {"title": "Festival", "icon": Icons.celebration},

      {"title": "Grammar", "icon": Icons.menu_book},
      {"title": "Conversation", "icon": Icons.record_voice_over},
      {"title": "Daily Life", "icon": Icons.home},
      {"title": "Business", "icon": Icons.business},
      {"title": "Pronunciation", "icon": Icons.mic},

      {"title": "Writing", "icon": Icons.edit},
      {"title": "Reading", "icon": Icons.book},
      {"title": "Advanced", "icon": Icons.auto_awesome},
      {"title": "Challenge", "icon": Icons.emoji_events},
      {"title": "Mastery", "icon": Icons.workspace_premium},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3FA),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.startFloat,

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        icon: const Icon(Icons.play_arrow, color: Colors.black),
        label: const Text(
          "START LESSON",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Lessons"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.deepPurple),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Hi $userName 👋",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.local_fire_department, color: Colors.orange),
                          SizedBox(width: 5),
                          Text("14"),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8E2DE2), Color(0xFFB245FF)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30 Lesson Journey",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Complete units step by step",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    final lesson = lessons[index];
                    int unit = (index ~/ 5) + 1;

                    return Column(
                      children: [

                        if (index % 5 == 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "UNIT $unit",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),

                        InkWell(
                          onTap: () {

                            if (lesson["title"] == "Basics") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => LessonPage(
                                    lessonTitle: lesson["title"],
                                    language: selectedLanguage,
                                  ),
                                ),
                              );
                            }

                            else if (lesson["title"] == "Greetings") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => GreetingsLessonPage(
                                    language: selectedLanguage,
                                  ),
                                ),
                              );
                            }

                            else if (lesson["title"] == "Family") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => FamilyLessonPage(
                                    language: selectedLanguage,
                                  ),
                                ),
                              );
                            }
                          },

                          child: Container(
                            margin: EdgeInsets.only(
                              left: index % 2 == 0 ? 0 : 70,
                              right: index % 2 == 0 ? 70 : 0,
                            ),
                            child: Column(
                              children: [

                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.primaries[
                                    index % Colors.primaries.length],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    lesson["icon"],
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  lesson["title"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        if (index != lessons.length - 1)
                          Container(
                            width: 4,
                            height: 40,
                            color: Colors.deepPurple.shade100,
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

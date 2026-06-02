import 'package:flutter/material.dart';
import 'home_page.dart';

class GoalPage extends StatefulWidget {
  final String userName;
  final String selectedLanguage;

  const GoalPage({
    super.key,
    required this.userName,
    required this.selectedLanguage,
  });

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  String selectedGoal = "";

  final List<Map<String, String>> goals = [
    {"title": "Travel", "emoji": "✈️"},
    {"title": "Career", "emoji": "💼"},
    {"title": "Study", "emoji": "📚"},
    {"title": "Friends", "emoji": "💬"},
    {"title": "Culture", "emoji": "🎵"},
    {"title": "Daily Practice", "emoji": "🔥"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Choose Goal",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Image.asset(
            'assets/cat.png',
            height: 140,
          ),

          const SizedBox(height: 15),

          const Text(
            "Why are you learning?",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "Pick your learning goal",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: goals.map((goal) {
                return goalTile(
                  goal["title"]!,
                  goal["emoji"]!,
                );
              }).toList(),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: () {
                  if (selectedGoal.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select a goal"),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          userName: widget.userName,
                          selectedLanguage: widget.selectedLanguage,
                        ),
                      ),
                    );
                  }
                },

                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget goalTile(String title, String emoji) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGoal = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selectedGoal == title
                ? Colors.deepPurple
                : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            if (selectedGoal == title)
              const Icon(
                Icons.check_circle,
                color: Colors.deepPurple,
              ),
          ],
        ),
      ),
    );
  }
}
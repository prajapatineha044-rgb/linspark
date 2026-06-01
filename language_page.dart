import 'package:flutter/material.dart';
import 'goal_page.dart';

class LanguagePage extends StatefulWidget {
  final String userName;

  const LanguagePage({super.key, required this.userName});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selected = "French";

  final List<Map<String, String>> languages = [
    {"name": "Spanish", "flag": "🇪🇸"},
    {"name": "French", "flag": "🇫🇷"},
    {"name": "German", "flag": "🇩🇪"},
    {"name": "Japanese", "flag": "🇯🇵"},
    {"name": "Italian", "flag": "🇮🇹"},
    {"name": "Chinese", "flag": "🇨🇳"},
    {"name": "English", "flag": "🇬🇧"},
    {"name": "Korean", "flag": "🇰🇷"},
    {"name": "Hindi", "flag": "🇮🇳"},
    {"name": "Arabic", "flag": "🇸🇦"},
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
          "Choose Language",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Image.asset(
            'assets/cat.png',
            height: 150,
          ),

          const SizedBox(height: 15),

          const Text(
            "Select your language",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            "You can change this later",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: languages.map((lang) {
                return languageTile(
                  lang["name"]!,
                  lang["flag"]!,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalPage(
                        userName: widget.userName,
                      ),
                    ),
                  );
                },

                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget languageTile(String lang, String flag) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = lang;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: selected == lang
                ? Colors.deepPurple
                : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 15),
            Text(lang, style: const TextStyle(fontSize: 18)),
            const Spacer(),
            if (selected == lang)
              const Icon(Icons.check_circle, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
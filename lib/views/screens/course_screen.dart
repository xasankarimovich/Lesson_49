import 'package:flutter/material.dart';
import 'package:lesson_49/views/screens/todo_screen.dart';

import 'courses/flutter_course.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen(
      {super.key,
      required ValueChanged<bool> onThemeChanged,
      required ValueChanged<String> onImageChanged});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return ToDoScreen(
                    onThemeChanged: (bool value) {},
                    onImageChanged: (String value) {},
                  );
                },
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Online Ta'lim",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return FlutterInfo(
                        onThemeChanged: (bool value) {},
                        onImageChanged: (String value) {},
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white),
                child: Text(
                  "Flutter",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Text(
                "PHP",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Text(
                "ChatGPT",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

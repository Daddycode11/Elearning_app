import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_reviewer/styles/pallete.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modules"),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: PrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: PrimaryBG,
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                  height: 100,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Modules",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  LessonGridItem(
                    image: 'assets/images/book1.png',
                    title: 'Chapter1',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_1.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book2.png',
                    title: 'Chapter2',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_2.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book3.png',
                    title: 'Chapter3',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_3.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book4.png',
                    title: 'Chapter 4',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book5.png',
                    title: 'Chapter 5',
                    onTap: () {
                      context.push("/student/lessons/${"_chapter_5.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book6.png',
                    title: 'Chapter 6',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_6.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book7.png',
                    title: 'Chapter 7',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_7.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book8.png',
                    title: 'Chapter 8',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_8.pdf"}");
                    },
                  ),
                  LessonGridItem(
                    image: 'assets/images/book9.png',
                    title: 'Chapter 9',
                    onTap: () {
                      context.push("/student/lessons/${"chapter_9.pdf"}");
                    },
                  ),
                  LessonGridItem(
                      image: 'assets/images/book10.png',
                      title: "Chapter 10",
                      onTap: () {
                        context.push("/student/lessons/${"chapter_10.pdf"}");
                      }),
                  LessonGridItem(
                      image: 'assets/images/book11.png',
                      title: "Chapter 11",
                      onTap: () {
                        context.push("/student/lessons/${"chapter_11.pdf"}");
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LessonGridItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const LessonGridItem(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

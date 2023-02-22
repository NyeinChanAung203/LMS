import 'package:flutter/material.dart';
import '../../services/course_service.dart';
import '../../themes/styles.dart';
import '../../widgets/course_card.dart';
import '../course_detail_screen.dart';
import '../../dummy_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CourseService.getAllCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                    ),
                    child: Text(
                      'Start Your Learning Journey',
                      textAlign: TextAlign.center,
                      style: titleTextStyle(context).copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ...dummyData
                      .map((model) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CourseDetailScreen(),
                                      settings:
                                          RouteSettings(arguments: model)),
                                );
                              },
                              child: CourseCard(
                                courseModel: model,
                                inDetail: false,
                              ),
                            ),
                          ))
                      .toList(),
                ],
              ))
            ],
          );
        });
  }
}

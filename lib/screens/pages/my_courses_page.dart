import 'package:flutter/material.dart';
import 'package:lms/models/course_model.dart';

import '../../dummy_data.dart';

import '../../themes/styles.dart';
import '../../widgets/my_course_card.dart';
import '../course_detail_screen.dart';
import '../../themes/styles.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
              ),
              child: Text(
                'My Learning Courses',
                textAlign: TextAlign.center,
                style: titleTextStyle(context).copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18,
              ),
              child: Text(
                'Keep learning to make progress',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            /* Courses List */
            ...dummyData
                .map(
                  (model) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CourseDetailScreen(),
                                settings: RouteSettings(arguments: model)),
                          );
                        },
                        child: MyCourseCard(
                          courseModel: model,
                        )),
                  ),
                )
                .toList(),
            /* Floation Action Button */
            Column(
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    CourseModel model = CourseModel(
                        created: DateTime.now(),
                        description:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        title: "Test Course Title",
                        imageUrl:
                            "https://images.pexels.com/photos/433205/pexels-photo-433205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");

                    setState(() {
                      dummyData.add(model);
                    });
                    // AuthService auth = AuthService();
                    // await auth.signUp();
                    // await auth.login();
                  },
                  elevation: 0,
                  child: const Icon(Icons.add),
                ),
                Text(
                  'Add New Course',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ))
      ],
    );
  }
}

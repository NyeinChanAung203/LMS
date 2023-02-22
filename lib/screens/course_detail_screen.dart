import 'package:flutter/material.dart';
import '../themes/styles.dart';
import '../models/course_model.dart';
import '../widgets/course_card.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CourseModel courseModel =
        ModalRoute.of(context)?.settings.arguments as CourseModel;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            iconSize: 35,
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
            bottom: 20,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 18,
              ),
              child: Text(
                courseModel.title,
                style: titleTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ),
            CourseCard(
              courseModel: courseModel,
              inDetail: true,
            ),
          ],
        ));
  }
}

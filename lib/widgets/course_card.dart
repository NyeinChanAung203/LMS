import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/course_model.dart';
import '../themes/styles.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.courseModel,
    required this.inDetail,
  });

  final CourseModel courseModel;
  final bool inDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffb5b5b5), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /* Cover Image */
          Hero(
            tag: courseModel.title,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(courseModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          /* Title */
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Text(
              courseModel.title,
              style: titleTextStyle(context),
              textAlign: TextAlign.start,
            ),
          ),
          /* Description */
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Text(
              courseModel.description,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: inDetail ? null : 5,
              overflow: inDetail ? null : TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Text(
              DateFormat.yMMMd('en_US').format(courseModel.created),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
          ),
          inDetail
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 21, horizontal: 12),
                  child: ElevatedButton(
                    child: Text(
                      'Enroll Now',
                      style: btnTextStyle(context),
                    ),
                    onPressed: () {},
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

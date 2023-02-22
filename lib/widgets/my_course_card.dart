import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/course_model.dart';

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({
    super.key,
    required this.courseModel,
  });

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Ink(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xfff4f4f4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
        ),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            /* Image */
            Hero(
              tag: courseModel.title,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.23,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      courseModel.imageUrl,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.52,
              // color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    DateFormat.yMMMd('en_US').format(courseModel.created),
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

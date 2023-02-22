import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../services/course_service.dart';

class CourseProvider with ChangeNotifier {
  List<CourseModel> courses = [];
  void getAllCourses() async {
    courses.addAll(await CourseService.getAllCourses());
    print(courses);
  }
}

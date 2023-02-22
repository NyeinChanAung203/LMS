import 'dart:convert';
import 'dart:developer';

import 'package:lms/models/course_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CourseService {
  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');
    return token;
  }

  static Future<List<CourseModel>> getAllCourses() async {
    final token = await getToken();
    final response = await http
        .get(Uri.parse("http://192.168.0.114:9090/api/course/get"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return jsonDecode(response.body);
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const String _host = "192.168.0.114";
  static const String _port = "9090";

  static Future<bool> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("http://$_host:$_port/api/auth/user/login"),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"email": email, "password": password}),
      );
      log(response.body);
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', decodedData['token']);
      return decodedData.containsKey('token');
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> signUp(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("http://$_host:$_port/api/user"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(
            {"fullName": name, "email": email, "password": password}),
      );
      log(response.body);
      Map<String, dynamic> decodedData = jsonDecode(response.body);
      return decodedData.containsKey('id');
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}


// sign up response
//{"id":5,"fullName":"Nyein","email":"nca@gmail.com","password":"$2a$10$5W.JyfDEGWZh7xFmZb.Nau52UY0iERvZYP/uY2NgR1UHQr5OKIrHG","roles":[{"id":2,"name":"ROLE_USER"}]}

// login resonse
// {"token":"eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiI1Iiwic3ViIjoibmNhQGdtYWlsLmNvbSIsInJvbGVzIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjc2OTUyMDM4LCJleHAiOjE2NzcwMzg0Mzh9.3wFIfM8dM1pL8I78gvKqw6y8SRKWHvbSn2712RKhmlu7BzR-ydHMIsFqiERQhjXtr2AbZwQv3UsBjHAMqYXMYA","expiredAt":"2023-02-22T04:00:38.782+00:00"}
import 'dart:developer';

import 'package:flutter/material.dart';
import 'providers/auth_provider.dart';
import 'themes/my_theme.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  log(token ?? 'no token');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: "LMS",
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(),
        home: const SignUpScreen(),
      ),
    );
  }
}

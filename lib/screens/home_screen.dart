import 'package:flutter/material.dart';
import '../services/course_service.dart';
import '../themes/styles.dart';
import './pages/home_page.dart';
import 'pages/my_courses_page.dart';
import './pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> index = ValueNotifier(0);

  void changeIndex(int value) {
    index.value = value;
  }

  @override
  void initState() {
    super.initState();
    CourseService.getAllCourses();
  }

  @override
  void dispose() {
    index.dispose();
    super.dispose();
  }

  List<Widget> pageList = [
    const HomePage(),
    const CoursesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: index,
            builder: (context, int value, child) {
              return pageList[value];
            }),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: index,
        builder: (context, int value, child) {
          return BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 18,
              currentIndex: value,
              selectedItemColor: kPrimaryColor,
              unselectedItemColor: Colors.black,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 30,
              type: BottomNavigationBarType.fixed,
              onTap: changeIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                    tooltip: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'My Courses',
                    tooltip: 'My Courses'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle),
                    label: 'Profile',
                    tooltip: 'Profile'),
              ]);
        },
      ),
    );
  }
}

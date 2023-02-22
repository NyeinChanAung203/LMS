import 'package:flutter/material.dart';
import '../../dummy_data.dart';
import '../../themes/styles.dart';
import '../../widgets/my_course_card.dart';
import '../course_detail_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: titleTextStyle(context),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(35),
            padding: const EdgeInsets.only(
              bottom: 35,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xffb5b5b5), width: 1),
            ),
            child: Column(
              children: [
                Container(
                  height: 156,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: kPrimaryColor.withOpacity(0.28)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: const [
                      Positioned(
                        bottom: -50,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://icons-for-free.com/iconfiles/png/512/avatar+human+people+profile+user+icon-1320168139431219590.png"),
                            radius: 48,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 55),
                Text(
                  'Thaw Thar Phway',
                  style: titleTextStyle(context),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      color: Color(0xff565656),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Mandalay',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Icon(
                      Icons.cake,
                      color: Color(0xff565656),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '25 years old',
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24, left: 20),
                  child: Row(
                    children: [
                      Text(
                        "Taken Course List",
                        textAlign: TextAlign.start,
                        style: titleTextStyle(context),
                      ),
                    ],
                  ),
                ),
                ...dummyData
                    .map(
                      (model) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20,
                          left: 20,
                          right: 20,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

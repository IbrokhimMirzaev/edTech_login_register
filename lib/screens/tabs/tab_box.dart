import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preference/screens/tabs/profile_screen.dart';
import 'package:shared_preference/screens/tabs/settings_screen.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import 'courses/courses_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List<Widget> screens = [
    const CoursesScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(22), topLeft: Radius.circular(22)),
        child: SizedBox(
          height: 95,
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            selectedItemColor: MyColors.primaryColor,
            unselectedItemColor: MyColors.inkGrey,
            selectedIconTheme: const IconThemeData(color: MyColors.primaryColor),
            unselectedIconTheme: const IconThemeData(color: MyColors.inkGrey),
            unselectedFontSize: 14,
            backgroundColor: Theme.of(context).backgroundColor,
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                label: "Courses",
                activeIcon: SvgPicture.asset(
                  MyIcons.book,
                  width: 45,
                  height: 45,
                  color: MyColors.primaryColor,
                ),
                icon: SvgPicture.asset(
                  MyIcons.book,
                  width: 45,
                  height: 45,
                  color: MyColors.inkGrey,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                activeIcon: SvgPicture.asset(
                  MyIcons.profile,
                  width: 45,
                  height: 45,
                  color: MyColors.primaryColor,
                ),
                icon: SvgPicture.asset(
                  MyIcons.profile,
                  width: 45,
                  height: 45,
                  color: MyColors.inkGrey,
                ),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                activeIcon: SvgPicture.asset(
                  MyIcons.settings,
                  width: 45,
                  height: 45,
                  color: MyColors.primaryColor,
                ),
                icon: SvgPicture.asset(
                  MyIcons.settings,
                  width: 45,
                  height: 45,
                  color: MyColors.inkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}

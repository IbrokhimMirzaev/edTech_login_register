import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/screens/register_screen.dart';

import '../local_data/storage.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Theme.of(context)
              .appBarTheme
              .systemOverlayStyle!
              .statusBarIconBrightness,
          statusBarColor:
              Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
          statusBarBrightness: Theme.of(context)
              .appBarTheme
              .systemOverlayStyle!
              .statusBarBrightness,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Text("Profile",
            style: GoogleFonts.rubik().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.headline1!.color)),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            SystemNavigator.pop();
          },
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 15),
            child: SvgPicture.asset(
              MyIcons.back,
              color: Theme.of(context).iconTheme.color,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          children: [
            Image.asset(
              MyIcons.avatar,
              width: 140,
              height: 140,
            ),
            const SizedBox(height: 30),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MyColors.inkGrey)),
              child: Center(
                child: Text(
                  "Your Courses",
                  style: GoogleFonts.rubik().copyWith(
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MyColors.inkGrey)),
              child: Center(
                child: Text(
                  "Saved",
                  style: GoogleFonts.rubik().copyWith(
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: MyColors.inkGrey)),
              child: Center(
                child: Text(
                  "Payment",
                  style: GoogleFonts.rubik().copyWith(
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const RegisterScreen();
                }));
                StorageRepository.deleteString("email");
                StorageRepository.deleteString("password");
                StorageRepository.deleteBool("isLogged");
              },
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                backgroundColor: Colors.red, // Text Color
              ),
              child: Text(
                "Log out",
                style: GoogleFonts.roboto().copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

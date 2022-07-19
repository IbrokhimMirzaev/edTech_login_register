import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/screens/home_page.dart';
import 'package:shared_preference/screens/login_screen.dart';

import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    Future.delayed(const Duration(seconds: 3), () {
      bool isLogged = StorageRepository.getBool("isLogged");
      print("IS LOGGED:$isLogged");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return isLogged ? const MyHomePage() : const LoginScreen();
      }));
    });
    super.initState();
  }

  Future<void> _init() async {
    await StorageRepository.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarIconBrightness,
      statusBarBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarBrightness,
      statusBarColor: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
    ));
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/loading.json"),
            Text(
              "CodeFactory",
              style: GoogleFonts.rubik().copyWith(
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}

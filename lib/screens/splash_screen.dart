import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/screens/home_page.dart';
import 'package:shared_preference/screens/login_screen.dart';

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
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Center(
          child: Lottie.asset("assets/lottie/loading.json"),
        ),
      ),
    );
  }
}

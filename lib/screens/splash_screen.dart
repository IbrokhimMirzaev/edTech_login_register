import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/screens/home_page.dart';
import 'package:shared_preference/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
        return (StorageRepository.getBool("isLogged")) == true ? const MyHomePage() : const RegisterScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Lottie.asset("assets/lottie/loading.json"),
      ),
    );
  }
}

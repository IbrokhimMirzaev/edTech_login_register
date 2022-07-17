import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/screens/register_screen.dart';

import '../local_data/storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  String email = "";
  String password = "";

  Future<void> init() async {
    await StorageRepository.getInstance();
    setState((){
      email = StorageRepository.getString("email");
      password = StorageRepository.getString("password");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Home Page'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/lottie/user.json",
                repeat: false, height: 150, width: 150),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          email,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset(
                        "assets/images/gmail.png",
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "password: $password",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset(
                        "assets/images/lock.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const RegisterScreen();
                }));
                StorageRepository.deleteString("email");
                StorageRepository.deleteString("password");
              },
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                backgroundColor: Colors.red, // Text Color
              ),
              child: Text(
                "Log Out",
                style: GoogleFonts.roboto().copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

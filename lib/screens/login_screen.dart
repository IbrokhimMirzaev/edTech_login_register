import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/screens/home_page.dart';
import 'package:shared_preference/screens/register_screen.dart';
import 'package:shared_preference/utils/utility_functions.dart';

import '../global_widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.password, required this.email}) : super(key: key);

  final String password, email;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String inputEmail = "";
  String inputPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.orange, title: const Text("Login Screen")),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Login",
              style: GoogleFonts.roboto().copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.orange,
              ),
            ),
            Center(
                child: Lottie.asset("assets/lottie/login.json",
                    width: 220, height: 220, fit: BoxFit.fill)),
            const Expanded(child: SizedBox()),
            MyTextField(
              onChanged: (value) {
                print("email = ${widget.email}");
                inputEmail = value;
              },
              labelText: "Enter your email address",
              icon: Icons.email,
              keyType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onChanged: (value) {
                print("parol = ${widget.password}");
                inputPassword = value;
              },
              labelText: "Enter your password",
              icon: Icons.remove_red_eye_rounded,
              keyType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forgot Password?",
                  style: GoogleFonts.roboto().copyWith(
                      fontWeight: FontWeight.w700, color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SvgPicture.asset("assets/svg/google.svg",
                    width: 60, height: 60),
                SvgPicture.asset("assets/svg/facebook.svg",
                    width: 60, height: 60),
                SvgPicture.asset("assets/svg/apple.svg", width: 60, height: 60),
              ],
            ),
            const SizedBox(height: 13),
            GestureDetector(
              onTap: () async {
                if (inputPassword == widget.password && inputEmail == widget.email) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const MyHomePage();
                  }));
                  await StorageRepository.putBool("isLogged", true);
                } else {
                  UtilityFunctions.getMyToast(
                      message: "Your email or password is incorrect!");
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.orange),
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: GoogleFonts.roboto().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you new here?",
                  style: GoogleFonts.roboto().copyWith(
                      color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const RegisterScreen();
                    }));
                  },
                  child: Text(
                    "Register",
                    style: GoogleFonts.roboto().copyWith(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

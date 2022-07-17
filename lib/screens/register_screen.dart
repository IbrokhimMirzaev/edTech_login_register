import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/global_widgets/my_text_field.dart';
import 'package:shared_preference/screens/login_screen.dart';
import 'package:shared_preference/utils/utility_functions.dart';

import '../local_data/storage.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String pas1 = "", pas2 = "", name = "", email = "";
  String password = "", email2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Registration Screen")),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Register",
              style: GoogleFonts.roboto().copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 30),
            MyTextField(
              onChanged: (value) async {
                await StorageRepository.putString(key: "email", value: value);
                email = value;
                setState((){
                  email2 = value;
                });
              },
              labelText: "Enter your email address",
              icon: Icons.email,
              keyType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onChanged: (value) {
                name = value;
              },
              labelText: "Enter your full name",
              icon: Icons.account_circle,
              keyType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onChanged: (value) async {
                await StorageRepository.putString(
                    key: "password", value: value);
                pas1 = value;
                setState((){
                  password = value;
                });
              },
              labelText: "Enter your password",
              icon: Icons.lock,
              keyType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20),
            MyTextField(
                onChanged: (value) {
                  pas2 = value;
                },
                labelText: "Enter confirmation password",
                icon: Icons.lock_person,
                keyType: TextInputType.visiblePassword),
            const SizedBox(height: 40),
            Text(
              "Continue with",
              style: GoogleFonts.roboto().copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const SizedBox(height: 13),
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
              onTap: () {
                if (email != "" && name != "" && pas1 != "" && pas2 != "") {
                  if (pas1 == pas2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LoginScreen(password: password, email: email2,);
                    }));
                    UtilityFunctions.getMyToast(
                        message: "You are successfully registered");
                  } else {
                    UtilityFunctions.getMyToast(
                        message: "Your confirmation password is not matched");
                  }
                } else {
                  UtilityFunctions.getMyToast(
                      message: "You must fill all inputs to register!");
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
                    "REGISTER",
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
                  "Already have an account?",
                  style: GoogleFonts.roboto().copyWith(
                      color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                      return LoginScreen(password: password, email: email2,);
                    }));
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.roboto().copyWith(
                        color: Colors.black,
                        fontSize: 18,
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

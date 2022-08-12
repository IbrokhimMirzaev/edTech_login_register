import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/screens/tabs/tab_box.dart';
import 'package:shared_preference/screens/login/register_screen.dart';
import 'package:shared_preference/utils/colors.dart';
import 'package:shared_preference/utils/focusChange.dart';
import 'package:shared_preference/utils/icons.dart';
import 'package:shared_preference/utils/utility_functions.dart';
import 'package:shared_preference/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Login Screen",
            style: GoogleFonts.rubik().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: MyColors.inkDark)),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/lottie/login.json",
              width: 220,
              height: 220,
              fit: BoxFit.fill,
            ),
            Text(
              "Log in",
              style: GoogleFonts.rubik().copyWith(
                  color: MyColors.inkDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              "Login with social networks",
              style: GoogleFonts.rubik()
                  .copyWith(color: MyColors.inkDarkGrey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(MyIcons.facebook, width: 40, height: 40),
                const SizedBox(width: 12),
                SvgPicture.asset(MyIcons.insta, width: 40, height: 40),
                const SizedBox(width: 12),
                SvgPicture.asset(MyIcons.google, width: 40, height: 40),
              ],
            ),
            const SizedBox(height: 16),
            MyTextField(
              onSubmitted: (value) {
                if (value != "") {
                  MyUtils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                }
              },
              focusNode: emailFocusNode,
              controller: emailController,
              labelText: "Email",
              icon: Icon(Icons.email,
                  color: (emailFocusNode.hasPrimaryFocus)
                      ? MyColors.primaryColor
                      : MyColors.inkDarkGrey),
              keyType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onSubmitted: (value) {
                if (value != "") {
                  passwordFocusNode.unfocus();
                }
              },
              focusNode: passwordFocusNode,
              controller: passwordController,
              labelText: "Password",
              icon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: isObscure
                    ? SvgPicture.asset(
                        MyIcons.invisible,
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                        color: (emailFocusNode.hasFocus)
                            ? MyColors.primaryColor
                            : MyColors.inkDarkGrey,
                      )
                    : SvgPicture.asset(
                        MyIcons.visible,
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                        color: (emailFocusNode.hasFocus)
                            ? MyColors.primaryColor
                            : MyColors.inkDarkGrey,
                      ),
              ),
              isObscure: isObscure,
              keyType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            Text(
              "Forgot Password?",
              style: GoogleFonts.rubik().copyWith(
                  fontWeight: FontWeight.w700, color: MyColors.inkDarkGrey),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () async {
                String password = passwordController.text;
                String email = emailController.text;

                String savedEmail = StorageRepository.getString("email");
                String savedPassword = StorageRepository.getString("password");

                debugPrint("EMAIL:$savedEmail");
                debugPrint("PASSWORD:$savedPassword");

                bool isRegistered = StorageRepository.getBool("isRegistered");
                if (password == savedPassword &&
                    email == savedEmail &&
                    password.isNotEmpty &&
                    email.isNotEmpty) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const MyHomePage();
                  }));
                  UtilityFunctions.getMyToast(message: "You are successfully logged in");
                  await StorageRepository.putBool("isLogged", true);
                } else {
                  (isRegistered == false)
                      ? UtilityFunctions.getMyToast(
                          message: "You should register first!")
                      : UtilityFunctions.getMyToast(
                          message: "Your email or password is incorrect!");
                }
              },
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyColors.primaryColor),
                child: Center(
                  child: Text(
                    "Log in",
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

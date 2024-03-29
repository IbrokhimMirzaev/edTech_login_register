import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/widgets/my_text_field.dart';
import 'package:shared_preference/screens/login/login_screen.dart';
import 'package:shared_preference/utils/utility_functions.dart';
import '../../local_data/storage.dart';
import '../../utils/colors.dart';
import '../../utils/focusChange.dart';
import '../../utils/icons.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController pass1Controller = TextEditingController();
  final TextEditingController pass2Controller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  String pas1 = "", pas2 = "", name = "", email = "";
  String password = "", email2 = "";

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Register Screen",
            style: GoogleFonts.rubik().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: MyColors.inkDark)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(MyIcons.registerGirl, height: 210),
            const SizedBox(height: 16),
            Text(
              "Register",
              style: GoogleFonts.rubik().copyWith(
                  color: MyColors.inkDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              "Create your account",
              style: GoogleFonts.rubik()
                  .copyWith(color: MyColors.inkDarkGrey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            MyTextField(
              onSubmitted: (value) {
                if (value != "") {
                  MyUtils.fieldFocusChange(context, focusNode1, focusNode2);
                }
              },
              focusNode: focusNode1,
              controller: emailController,
              labelText: "Email",
              icon: const Icon(Icons.email),
              keyType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onSubmitted: (value) {
                if (value != "") {
                  MyUtils.fieldFocusChange(context, focusNode2, focusNode3);
                }
              },
              focusNode: focusNode2,
              controller: nameController,
              labelText: "Name",
              icon: const Icon(Icons.account_circle),
              keyType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onSubmitted: (value) {
                if (value != "") {
                  MyUtils.fieldFocusChange(context, focusNode3, focusNode4);
                }
              },
              focusNode: focusNode3,
              controller: pass1Controller,
              labelText: "Password",
              icon: const Icon(Icons.lock),
              keyType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20),
            MyTextField(
              onSubmitted: (v) {
                if (v != "") {
                  focusNode4.unfocus();
                }
              },
              focusNode: focusNode4,
              controller: pass2Controller,
              labelText: "Confirmation password",
              icon: const Icon(Icons.lock_person),
              keyType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                email = emailController.text;
                name = nameController.text;
                pas1 = pass1Controller.text;
                pas2 = pass2Controller.text;

                if (email != "" && name != "" && pas1 != "" && pas2 != "") {
                  if (pas1.length >= 8) {
                    if (pas1 == pas2) {
                      await StorageRepository.putString(
                          key: "password", value: pas1);
                      await StorageRepository.putString(
                          key: "email", value: email);
                      await StorageRepository.putString(
                          key: "name", value: name);

                      UtilityFunctions.getMyToast(
                          message: "You are successfully registered");

                      await StorageRepository.putBool("isRegistered", true);

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                    } else {
                      UtilityFunctions.getMyToast(
                          message: "Your confirmation password is not matched");
                    }
                  } else {
                    UtilityFunctions.getMyToast(
                        message:
                            "Your password should contain at least 8 symbols");
                  }
                } else {
                  UtilityFunctions.getMyToast(
                      message: "You must fill all inputs to register!");
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
                    "Register",
                    style: GoogleFonts.roboto().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.roboto().copyWith(
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const LoginScreen();
                    }));
                  },
                  child: Text(
                    "Log in",
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

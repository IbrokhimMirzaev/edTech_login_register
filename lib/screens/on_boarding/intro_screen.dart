import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/screens/login/login_screen.dart';
import 'package:shared_preference/utils/icons.dart';
import '../../utils/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  final PageController pageController = PageController();
  String buttonText = "Next";

  List<Widget> pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(MyIcons.intro1),
        const Expanded(child: SizedBox()),
        Text(
          "Learn anytime\n and anywhere",
          style: GoogleFonts.rubik().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: MyColors.inkDark,
            letterSpacing: 0.8,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          "Quarantine is the perfect time to spend your\n day learning something new, from anywhere!",
          style: GoogleFonts.rubik()
              .copyWith(color: MyColors.inkDarkGrey, height: 1.7),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          MyIcons.intro2,
          fit: BoxFit.cover,
        ),
        const Expanded(child: SizedBox()),
        Text(
          "Find a course\n for you",
          style: GoogleFonts.rubik().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: MyColors.inkDark,
            letterSpacing: 0.8,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          "Quarantine is the perfect time to spend your\n day learning something new, from anywhere!",
          style: GoogleFonts.rubik()
              .copyWith(color: MyColors.inkDarkGrey, height: 1.7),
          textAlign: TextAlign.center,
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(MyIcons.intro3),
        const Expanded(child: SizedBox()),
        Text(
          "Improve your skills",
          style: GoogleFonts.rubik().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: MyColors.inkDark,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          "Quarantine is the perfect time to spend your\n day learning something new, from anywhere!",
          style: GoogleFonts.rubik()
              .copyWith(color: MyColors.inkDarkGrey, height: 1.7),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
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
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext c){
                        return const LoginScreen();
                      }));
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.rubik().copyWith(
                        color: MyColors.inkDarkGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 380,
                        child: PageView(
                          controller: pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: pages,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: (currentIndex == 0)
                                  ? MyColors.secondaryColor
                                  : const Color(0xFFD5D4D4),
                              borderRadius: (currentIndex == 0)
                                  ? BorderRadius.circular(4)
                                  : BorderRadius.circular(50),
                            ),
                            height: 6,
                            width: (currentIndex == 0) ? 16 : 6,
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: (currentIndex == 1)
                                  ? MyColors.secondaryColor
                                  : const Color(0xFFD5D4D4),
                              borderRadius: (currentIndex == 0)
                                  ? BorderRadius.circular(4)
                                  : BorderRadius.circular(50),
                            ),
                            width: (currentIndex == 1) ? 16 : 6,
                          ),
                          const SizedBox(width: 12),
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: (currentIndex == 2)
                                  ? MyColors.secondaryColor
                                  : const Color(0xFFD5D4D4),
                              borderRadius: (currentIndex == 0)
                                  ? BorderRadius.circular(4)
                                  : BorderRadius.circular(50),
                            ),
                            width: (currentIndex == 2) ? 16 : 6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (currentIndex < 2) {
                        currentIndex++;
                        pageController.jumpToPage(currentIndex);
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext c) {
                          return const LoginScreen();
                        }));
                      }

                      if (currentIndex == 2){
                        buttonText = "Let's Start";
                      }
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: MyColors.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: GoogleFonts.rubik().copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

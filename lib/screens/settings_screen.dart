import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/global_widgets/account_info_bar.dart';
import 'package:shared_preference/local_data/storage.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String name = StorageRepository.getString("name");
  String email = StorageRepository.getString("email");
  String password = StorageRepository.getString("password");
  bool isOn = StorageRepository.getBool("isDark");

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
        title: Text("Settings",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(MyIcons.onWheels),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 82,
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.inkGrey),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    SvgPicture.asset(MyIcons.blueNotif),
                    const SizedBox(width: 12),
                    Text(
                      "Dark Mode",
                      style: GoogleFonts.rubik().copyWith(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    const Expanded(child: SizedBox()),
                    Switch(
                      value: isOn,
                      onChanged: (value) async {
                        setState(() {
                          isOn = value;
                        });
                        if (value == true) {
                          AdaptiveTheme.of(context).setDark();
                          await StorageRepository.putBool("isDark", true);
                        } else {
                          AdaptiveTheme.of(context).setLight();
                          await StorageRepository.putBool("isDark", false);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text("Account Information",
                  style: GoogleFonts.rubik().copyWith(
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              const SizedBox(height: 16),
              AccountInfo(
                  title: "Name",
                  subTitle: name,
                  icon: SvgPicture.asset(MyIcons.name)),
              const SizedBox(height: 16),
              AccountInfo(
                  title: "Email",
                  subTitle: email,
                  icon: SvgPicture.asset(MyIcons.email)),
              const SizedBox(height: 16),
              AccountInfo(
                  title: "Password",
                  subTitle: password,
                  icon: SvgPicture.asset(MyIcons.password)),
            ],
          ),
        ),
      ),
    );
  }
}

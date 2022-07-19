import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key, required this.title, required this.subTitle, required this.icon}) : super(key: key);

  final String title, subTitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 82,
      decoration:
      BoxDecoration(border: Border.all(color: MyColors.inkGrey), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.rubik().copyWith(color: Theme.of(context).textTheme.headline1!.color, fontWeight: FontWeight.w600, fontSize: 20)),
              const SizedBox(height: 3),
              Text(subTitle, style: GoogleFonts.rubik().copyWith(color: Theme.of(context).textTheme.headline1!.color)),
            ],
          ),
          const Expanded(child: SizedBox()),
          SizedBox(width: 24, height: 24, child: SvgPicture.asset(MyIcons.next, fit: BoxFit.scaleDown)),
        ],
      ),
    );
  }
}

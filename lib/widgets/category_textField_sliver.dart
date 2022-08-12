import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/utils/icons.dart';

class CategoryTextFieldSliver extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TextField(
      style: GoogleFonts.roboto().copyWith(fontWeight: FontWeight.w600, fontSize: 13),
      cursorColor: Colors.orange,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: SizedBox(
          width: 20,
          height: 20,
          child: SvgPicture.asset(
            MyIcons.search,
            fit: BoxFit.scaleDown,
          ),
        ),
        labelText: "Search Course",
        labelStyle: TextStyle(
          color: Theme.of(context).canvasColor,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.orange,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}

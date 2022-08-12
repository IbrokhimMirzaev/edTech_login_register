import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/utils/colors.dart';

class TagsSliver extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.inkLightGrey,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
            ),
            child: Center(child: Text("Lessons", style: GoogleFonts.inter().copyWith(fontSize: 16, color: MyColors.inkDark))),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.inkLightGrey,
            ),
            child: Center(child: Text("Tests", style: GoogleFonts.inter().copyWith(fontSize: 16, color: MyColors.inkDark))),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: MyColors.inkLightGrey,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
            ),
            child: Center(child: Text("Discuss", style: GoogleFonts.inter().copyWith(fontSize: 16, color: MyColors.inkDark))),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
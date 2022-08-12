import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/utils/icons.dart';

class MySliverRow extends SliverPersistentHeaderDelegate {

  MySliverRow({required this.name});

  final String name;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello,", style: GoogleFonts.rubik().copyWith(fontSize: 16, color: Theme.of(context).textTheme.headline1!.color)),
            const SizedBox(height: 4),
            Text(name, style: GoogleFonts.rubik().copyWith(fontSize: 32, fontWeight: FontWeight.w900, color: Theme.of(context).textTheme.headline1!.color)),
          ],
        ),
        SvgPicture.asset(MyIcons.notif, color: Theme.of(context).iconTheme.color),
      ],
    );
  }

  @override
  double get maxExtent => 61;

  @override
  double get minExtent => 61;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
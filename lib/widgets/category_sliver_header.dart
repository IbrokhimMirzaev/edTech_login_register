import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/model/category_item.dart';
import 'package:shared_preference/utils/colors.dart';

class CategorySliverHeader extends SliverPersistentHeaderDelegate {

  CategorySliverHeader({required this.categories});

  List<CategoryItem> categories;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      children: [
        Text("Category:", style: GoogleFonts.rubik().copyWith(color: Theme.of(context).canvasColor)),
        const SizedBox(width: 16),
        Expanded(
          child: SizedBox(
            height: 25,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(
                categories.length, (index) => Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 54,
                  decoration: BoxDecoration(
                    color: MyColors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      categories[index].text,
                      style: GoogleFonts.rubik().copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 25;

  @override
  double get minExtent => 25;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
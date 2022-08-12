import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/model/card_item.dart';
import 'package:shared_preference/utils/colors.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({
    Key? key,
    required this.card,
    required this.onTap,
  }) : super(key: key);

  final CardItem card;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 300,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MyColors.inkGrey)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: MyColors.inkLightGrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(card.imgPath, height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 54,
                          height: 24,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: MyColors.secondaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "\$ ${card.price}",
                              style: GoogleFonts.rubik().copyWith(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(card.hours,
                        style: GoogleFonts.rubik().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color:
                                Theme.of(context).textTheme.headline2!.color)),
                    Text(card.name,
                        style: GoogleFonts.rubik().copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color:
                                Theme.of(context).textTheme.headline1!.color)),
                    Text(card.desc,
                        style: GoogleFonts.rubik().copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.headline3!.color)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/data/cardItem_repository.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/model/category_item.dart';

import '../model/card_item.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<CardItem> cards = CardRepository.getCards();
  final List<CategoryItem> categories = CardRepository.getCategories();

  final String name = StorageRepository.getString("name");

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("Hello,",
                style: GoogleFonts.rubik().copyWith(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.headline1!.color)),
            const SizedBox(height: 4),
            Text(
              name,
              style: GoogleFonts.rubik().copyWith(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).textTheme.headline1!.color,
              ),
            ),
          ],
        ),
        actions: [
          SvgPicture.asset(MyIcons.notif, color: Theme.of(context).iconTheme.color),
          const SizedBox(width: 15),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              style: GoogleFonts.roboto()
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 13),
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
            ),
            const SizedBox(height: 13),
            Row(
              children: [
                Text("Category:",
                    style: GoogleFonts.rubik()
                        .copyWith(color: Theme.of(context).canvasColor)),
                const SizedBox(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 25,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        categories.length,
                        (index) => Container(
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
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  cards.length,
                  (index) => Container(
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
                                Image.asset(cards[index].imgPath, height: 150),
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
                                          "\$ ${cards[index].price}",
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
                                Text(cards[index].hours,
                                    style: GoogleFonts.rubik().copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Theme.of(context).textTheme.headline2!.color)),
                                Text(cards[index].name,
                                    style: GoogleFonts.rubik().copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Theme.of(context).textTheme.headline1!.color)),
                                Text(cards[index].desc,
                                    style: GoogleFonts.rubik().copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Theme.of(context).textTheme.headline3!.color)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

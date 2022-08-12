import 'package:flutter/material.dart';
import 'package:shared_preference/data/cardItem_repository.dart';
import 'package:shared_preference/local_data/storage.dart';
import 'package:shared_preference/model/category_item.dart';
import 'package:shared_preference/screens/tabs/courses/course_info_page.dart';
import 'package:shared_preference/widgets/card_list_item.dart';
import 'package:shared_preference/widgets/category_sliver_header.dart';
import 'package:shared_preference/widgets/category_textField_sliver.dart';
import 'package:shared_preference/widgets/my_sliver_row.dart';
import '../../../model/card_item.dart';


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
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarIconBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarIconBrightness,
      //     statusBarColor: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarColor,
      //     statusBarBrightness: Theme.of(context).appBarTheme.systemOverlayStyle!.statusBarBrightness,
      //   ),
      //   backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      //   elevation: 0,
      //   actions: [
      //     SvgPicture.asset(MyIcons.notif, color: Theme.of(context).iconTheme.color),
      //     const SizedBox(width: 15),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(delegate: MySliverRow(name: name)),
              const SliverToBoxAdapter(child: SizedBox(height: 6)),
              SliverPersistentHeader(delegate: CategoryTextFieldSliver()),
              const SliverToBoxAdapter(child: SizedBox(height: 13)),
              SliverPersistentHeader(
                  delegate: CategorySliverHeader(categories: categories), pinned: true),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    cards.length,
                    (index) => CardListItem(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => CourseInfoPage(
                              card: cards[index],
                            ),
                          ),
                        );
                      },
                      card: cards[index],
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

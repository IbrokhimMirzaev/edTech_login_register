import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preference/model/card_item.dart';
import 'package:shared_preference/utils/colors.dart';
import 'package:shared_preference/widgets/arrow_back.dart';
import 'package:shared_preference/widgets/course_video_sliver.dart';
import 'package:shared_preference/widgets/tags_sliver.dart';

class CourseInfoPage extends StatefulWidget {
  const CourseInfoPage({
    Key? key,
    required this.card,
  }) : super(key: key);

  final CardItem card;

  @override
  State<CourseInfoPage> createState() => _CourseInfoPageState();
}

class _CourseInfoPageState extends State<CourseInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.card.name, style: GoogleFonts.rubik(fontWeight: FontWeight.w500, fontSize: 24, color: MyColors.inkDark)),
                  centerTitle: true,
                ),
                leading: ArrowBack(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 35)),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Tags For Headers",
                    style: GoogleFonts.inter().copyWith(
                      fontSize: 24,
                      color: MyColors.inkDark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "3 of 11 lessons",
                    style: GoogleFonts.inter().copyWith(
                      color: MyColors.inkDarkGrey,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 15)),
              SliverPersistentHeader(delegate: TagsSliver(), pinned: true),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPersistentHeader(delegate: CourseVideoSliver()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Text(
                  "Introduction",
                  style: GoogleFonts.rubik().copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: MyColors.inkDark,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              SliverToBoxAdapter(
                child: Text(
                  "You can launch a new career in web development today by learning HTML & CSS."
                  "You don't need a computer science degree or expensive software. All you need is a computer, "
                  "a bit of time, a lot of determination, and a teacher you trust. Once the form data has been "
                  "validated on the client-side, it is okay to submit the form. And, since we covered validation "
                  "in the previous article, we're ready to submit! This article looks at what happens when a user "
                  "submits a form — where does the data go, and how do we handle it when it gets there? W"
                  "e also look at some of the security concerns.You can launch a new career in web development today by learning HTML & CSS. "
                  "You don't need a computer science degree or expensive software. All you need is a computer,"
                  "a bit of time, a lot of determination, and a teacher you trust. Once the form data has been"
                  "validated on the client-side, it is okay to submit the form. And, since we covered validation "
                  "in the previous article, we're ready to submit! This article looks at what happens when a user"
                  "submits a form — where does the data go, and how do we handle it when it gets there? W"
                  "e also look at some of the security concerns."
                  "You can launch a new career in web development today by learning HTML & CSS."
                  "You don't need a computer science degree or expensive software. All you need is a computer, "
                  "a bit of time, a lot of determination, and a teacher you trust. Once the form data has been "
                  "validated on the client-side, it is okay to submit the form. And, since we covered validation "
                  "in the previous article, we're ready to submit! This article looks at what happens when a user "
                  "submits a form — where does the data go, and how do we handle it when it gets there? W"
                  "e also look at some of the security concerns.You can launch a new career in web development today by learning HTML & CSS. "
                  "You don't need a computer science degree or expensive software. All you need is a computer,"
                  "a bit of time, a lot of determination, and a teacher you trust. Once the form data has been"
                  "validated on the client-side, it is okay to submit the form. And, since we covered validation "
                  "in the previous article, we're ready to submit! This article looks at what happens when a user",
                  style: GoogleFonts.rubik().copyWith(
                    color: MyColors.inkGrey,
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

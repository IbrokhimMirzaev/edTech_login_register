import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preference/utils/icons.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
    );
  }
}

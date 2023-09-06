import 'package:bookly/core/constant/colors.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRatingBookitems extends StatelessWidget {
  const CustomRatingBookitems({super.key, required this.pageCount});

  final int pageCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 15,
          color: AppColors.kyellowColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            "4.9",
            style: Styles.textStyle14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 2),
          child: Text(
            pageCount.toString(),
            style: Styles.textStyle14.copyWith(color: AppColors.kGreyColor),
          ),
        ),
      ],
    );
  }
}

import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/constant/colors.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookDetailsRating extends StatelessWidget {
  const CustomBookDetailsRating({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 15,
          color: AppColors.kyellowColor,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            "4.8",
            style: Styles.textStyle14,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 2),
          child: Text(
            "${bookModel.volumeInfo!.pageCount} Page",
            style: Styles.textStyle14.copyWith(color: AppColors.kGreyColor),
          ),
        ),
      ],
    );
  }
}

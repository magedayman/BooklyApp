import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/core/constant/colors.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButtonBookDeatils extends StatelessWidget {
  const CustomButtonBookDeatils({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: SizedBox(
            height: 48,
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              color: AppColors.kwhiteColor,
              onPressed: () {},
              child: Text(
                "Free",
                style:
                    Styles.textStyle16.copyWith(color: AppColors.kPrimryColor),
              ),
            ),
          )),
          Expanded(
              child: SizedBox(
            height: 48,
            child: MaterialButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))),
              color: AppColors.kSimonColor,
              onPressed: () async {
                Uri url = Uri.parse("${bookModel.volumeInfo!.previewLink}");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print("Error data view internet");
                }
              },
              child: Text(
                "Free preview",
                style: Styles.textStyle16.copyWith(
                    color: AppColors.kwhiteColor, fontWeight: FontWeight.w500),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

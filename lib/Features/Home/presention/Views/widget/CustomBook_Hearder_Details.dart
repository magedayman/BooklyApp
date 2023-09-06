import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/styles.dart';
import 'CustomBook_details_rating.dart';
import 'Custom_bookDetails_item.dart';

class CustomBookHeaderDeatils extends StatelessWidget {
  const CustomBookHeaderDeatils({super.key, required this.bookmodel});
  final BookModel bookmodel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.close_sharp, size: 30)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, size: 25))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .29),
          child: CustomBookDetailsitem(bookmodel: bookmodel),
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          bookmodel.volumeInfo!.title.toString(),
          style: Styles.textStyle20
              .copyWith(fontFamily: "GT Sectra Fine", fontSize: 30),
        ),
        const SizedBox(
          height: 8,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookmodel.volumeInfo!.authors![0],
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 14),
        Center(
            child: CustomBookDetailsRating(
          bookModel: bookmodel,
        ))
      ],
    );
  }
}

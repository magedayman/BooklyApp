import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Features/Home/presention/Views/widget/Custom_items_header.dart';
import 'package:bookly/Features/Home/presention/Views/widget/Custom_ratingBook.dart';
import 'package:bookly/core/constant/Routes.dart';
import 'package:bookly/core/constant/colors.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListViewItems extends StatelessWidget {
  const CustomListViewItems({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.bookDetails, extra: bookModel);
      },
      child: SizedBox(
        height: 160,
        child: Row(
          children: [
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            //   child: AspectRatio(
            //     aspectRatio: 2.9 / 4,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8),
            //           image: const DecorationImage(
            //               image: AssetImage(AppAssets.testbook2),
            //               fit: BoxFit.fill)),
            //     ),
            //   ),
            // ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomItemsListHeader(
                  imagUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? ""),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      "${bookModel.volumeInfo?.title}",
                      style: Styles.textStyle20.copyWith(
                        fontFamily: "GT Sectra Fine",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "${bookModel.volumeInfo!.authors?[0]}",
                    style: Styles.textStyle14
                        .copyWith(color: AppColors.kGreyColor),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                            child: Text(
                          "Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        )),
                        const Spacer(),
                        CustomRatingBookitems(
                          pageCount: bookModel.volumeInfo!.pageCount!,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

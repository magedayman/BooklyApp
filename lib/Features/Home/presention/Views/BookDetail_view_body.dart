import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Features/Home/presention/Views/widget/CustomBookDetails.dart';
import 'package:bookly/Features/Home/presention/Views/widget/CustomBook_Hearder_Details.dart';
import 'package:bookly/Features/Home/presention/Views/widget/CustomButtonBookDetails.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                CustomBookHeaderDeatils(bookmodel: bookModel),
                const SizedBox(height: 30),
                CustomButtonBookDeatils(
                  bookModel: bookModel,
                ),
                const Expanded(child: SizedBox(height: 50)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  child: const Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("You can also like", style: Styles.textStyle18)),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: CustomBookDetails(),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

import 'package:bookly/Features/Home/presention/Views/widget/Custom_Progress_Indicator.dart';
import 'package:bookly/Features/Home/presention/Views/widget/Custom_items_header.dart';
import 'package:bookly/Features/Home/presention/Views/widget/custom_fauiler_book.dart';
import 'package:bookly/Features/Home/presention/manger/fetch_similler_books_cubit/fetch_simller_Books_state.dart';
import 'package:bookly/Features/Home/presention/manger/fetch_similler_books_cubit/fetch_simller_books_Cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBookDetails extends StatelessWidget {
  const CustomBookDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureSimillerBooksCubit, FeatureSimillerBookState>(
      builder: (context, state) {
        if (state is FeatureSimilarBookStateSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.simillerbook.length,
              itemBuilder: (context, index) {
                return CustomItemsListHeader(
                  imagUrl: state.simillerbook[index].volumeInfo!.imageLinks
                          ?.thumbnail ??
                      "",
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            ),
          );
        } else if (state is FeatureSimilarBookStateFailure) {
          return CustomFauilerBook(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}

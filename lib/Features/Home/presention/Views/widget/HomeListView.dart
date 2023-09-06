import 'package:bookly/Features/Home/presention/Views/widget/Custom_items_header.dart';
import 'package:bookly/Features/Home/presention/Views/widget/custom_fauiler_book.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_cubit/FeatureBookCubit.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_cubit/FeatureBookState.dart';
import 'package:bookly/core/constant/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Custom_Progress_Indicator.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit, FeatureBookState>(
      builder: (context, state) {
        if (state is FeatureBookStateSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.book.length,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRoutes.bookDetails, extra: state.book[index]);
                  },
                  child: CustomItemsListHeader(
                    imagUrl:
                        "${state.book[index].volumeInfo?.imageLinks?.thumbnail}",
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15),
            ),
          );
        } else if (state is FeatureBookStateFailure) {
          return CustomFauilerBook(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}

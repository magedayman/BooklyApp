import 'package:bookly/Features/Home/presention/Views/widget/Custom_ListView_items.dart';
import 'package:bookly/Features/Home/presention/Views/widget/Custom_Progress_Indicator.dart';
import 'package:bookly/Features/Home/presention/Views/widget/custom_fauiler_book.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_bestseller_cubit/FeatureBookbestSellerCubit.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_bestseller_cubit/FeatureBookbestSellerState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookbestSellerCubit, FeatureBookBestSellerState>(
      builder: (context, state) {
        if (state is FeatureBookBestSellerSuccess) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20),
            separatorBuilder: (context, index) => const SizedBox(height: 30),
            itemCount: 4,
            itemBuilder: (context, index) {
              return CustomListViewItems(
                  bookModel: state.bestSellerBooks[index]);
            },
          );
        } else if (state is FeatureBookBestSellerFailure) {
          return CustomFauilerBook(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}

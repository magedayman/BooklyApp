import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Home/presention/Views/widget/Custom_ListView_items.dart';
import '../../../../Home/presention/Views/widget/Custom_Progress_Indicator.dart';
import '../../../../Home/presention/Views/widget/custom_fauiler_book.dart';
import '../../../../Home/presention/manger/fetch_similler_books_cubit/fetch_simller_Books_state.dart';
import '../../../../Home/presention/manger/fetch_similler_books_cubit/fetch_simller_books_Cubit.dart';

class SearchItemListVeiw extends StatelessWidget {
  const SearchItemListVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureSimillerBooksCubit, FeatureSimillerBookState>(
      builder: (context, state) {
        if (state is FeatureSimilarBookStateSuccess) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            separatorBuilder: (context, index) => const SizedBox(height: 30),
            itemCount: state.simillerbook.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child:
                    CustomListViewItems(bookModel: state.simillerbook[index]),
              );
            },
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

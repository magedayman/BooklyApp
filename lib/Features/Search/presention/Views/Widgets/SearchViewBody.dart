import 'package:bookly/Features/Home/data/Repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/presention/manger/fetch_similler_books_cubit/fetch_simller_books_Cubit.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:bookly/core/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CustomTextFiledSearchView.dart';
import 'SearchItemListVeiw.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeatureSimillerBooksCubit(getIt.get<HomeRepoImpl>())
        ..getSimilarBooksData(category: ""),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CustomTextFiledSearchView(),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              alignment: Alignment.centerLeft,
              child: Text(
                "Search Result",
                style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Expanded(child: SearchItemListVeiw())
          ],
        ),
      ),
    );
  }
}

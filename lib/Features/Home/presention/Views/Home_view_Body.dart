import 'package:bookly/Features/Home/presention/Views/widget/Best_seller_Listview.dart';
import 'package:bookly/Features/Home/presention/Views/widget/Custom_AppBar.dart';
import 'package:bookly/Features/Home/presention/Views/widget/HomeListView.dart';
import 'package:bookly/core/constant/styles.dart';
import 'package:flutter/material.dart';

class HomwViewBody extends StatelessWidget {
  const HomwViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const HomeListView(),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    "Best Seller",
                    style: Styles.textStyle18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SliverFillRemaining(
          child: BestSellerListview(),
        ),
      ],
    );
  }
}

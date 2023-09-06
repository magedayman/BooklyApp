import 'package:bookly/Features/Home/data/Repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_bestseller_cubit/FeatureBookbestSellerCubit.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_cubit/FeatureBookCubit.dart';
import 'package:bookly/core/constant/Routes.dart';
import 'package:bookly/core/constant/colors.dart';
import 'package:bookly/core/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBookCubit(getIt.get<HomeRepoImpl>())
            ..fetcFeatureHeadreBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FeatureBookbestSellerCubit(getIt.get<HomeRepoImpl>())
                ..fetchBestSellerBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.kPrimryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}

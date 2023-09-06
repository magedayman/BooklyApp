import 'package:bookly/Features/Home/data/Repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:bookly/Features/Home/presention/Views/BookDetails_view.dart';
import 'package:bookly/Features/Home/presention/Views/Home_view.dart';
import 'package:bookly/Features/Home/presention/manger/fetch_similler_books_cubit/fetch_simller_books_Cubit.dart';
import 'package:bookly/Features/Search/presention/Views/Search_View.dart';
import 'package:bookly/Features/Splash/presention/Views/Splash_Screen.dart';
import 'package:bookly/core/shared/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String homeViewRoute = "/HomeView";
  static const String bookDetails = "/Bookdetails";
  static const String searchView = "/SearchView";

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeViewRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: bookDetails,
        builder: (context, state) => BlocProvider(
            create: (context) =>
                FeatureSimillerBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(bookmodel: state.extra as BookModel)),
      ),
    ],
  );
}

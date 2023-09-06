import 'package:bookly/Features/Home/data/Repos/home_repos.dart';
import 'package:bookly/Features/Home/presention/manger/fetch_similler_books_cubit/fetch_simller_Books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureSimillerBooksCubit extends Cubit<FeatureSimillerBookState> {
  FeatureSimillerBooksCubit(this.homeRepo)
      : super(FeatureSimilarBookStateIntial());

  final HomeRepository homeRepo;
  Future<void> getSimilarBooksData({required String category}) async {
    emit(FeatureSimilarBookStateLoading());

    var response = await homeRepo.fetchSimillerBooks(category: category);

    response.fold((l) => emit(FeatureSimilarBookStateFailure(l.errorMessage)),
        (r) => emit(FeatureSimilarBookStateSuccess(r)));
  }
}

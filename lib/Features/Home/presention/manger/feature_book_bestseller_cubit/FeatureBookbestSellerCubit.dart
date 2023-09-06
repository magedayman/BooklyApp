import 'package:bookly/Features/Home/data/Repos/home_repos.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_bestseller_cubit/FeatureBookbestSellerState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookbestSellerCubit extends Cubit<FeatureBookBestSellerState> {
  FeatureBookbestSellerCubit(this.homeRepo)
      : super(FeatureBookBestSellerIntial());

  final HomeRepository homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(FeatureBookBestSellerLoading());

    var result = await homeRepo.fetchBestSellerBooksList();

    result.fold((fauiler) {
      emit(FeatureBookBestSellerFailure(fauiler.errorMessage));
    }, (books) {
      emit(FeatureBookBestSellerSuccess(books));
    });
  }
}

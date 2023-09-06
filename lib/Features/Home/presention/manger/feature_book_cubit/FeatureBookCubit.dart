import 'package:bookly/Features/Home/data/Repos/home_repos.dart';
import 'package:bookly/Features/Home/presention/manger/feature_book_cubit/FeatureBookState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBookState> {
  FeatureBookCubit(this.homeRepo) : super(FeatureBookStateIntial());

  final HomeRepository homeRepo;

  Future<void> fetcFeatureHeadreBooks() async {
    emit(FeatureBookStateLoading());
    var result = await homeRepo.fetchBookDataItemsHeader();

    result.fold((Failure) {
      emit(FeatureBookStateFailure(Failure.errorMessage));
    }, (books) {
      emit(FeatureBookStateSuccess(books));
    });
  }
}

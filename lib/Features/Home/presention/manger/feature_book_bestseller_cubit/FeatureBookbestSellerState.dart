import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBookBestSellerState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FeatureBookBestSellerIntial extends FeatureBookBestSellerState {}

class FeatureBookBestSellerLoading extends FeatureBookBestSellerState {}

class FeatureBookBestSellerFailure extends FeatureBookBestSellerState {
  final String errMessage;
  FeatureBookBestSellerFailure(this.errMessage);
}

class FeatureBookBestSellerSuccess extends FeatureBookBestSellerState {
  final List<BookModel> bestSellerBooks;
  FeatureBookBestSellerSuccess(this.bestSellerBooks);
}

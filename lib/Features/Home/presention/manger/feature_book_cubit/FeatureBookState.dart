import 'package:bookly/Features/Home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBookState extends Equatable {
  const FeatureBookState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FeatureBookStateIntial extends FeatureBookState {}

class FeatureBookStateLoading extends FeatureBookState {}

class FeatureBookStateFailure extends FeatureBookState {
  final String errMessage;
  const FeatureBookStateFailure(this.errMessage);
}

class FeatureBookStateSuccess extends FeatureBookState {
  final List<BookModel> book;
  const FeatureBookStateSuccess(this.book);
}

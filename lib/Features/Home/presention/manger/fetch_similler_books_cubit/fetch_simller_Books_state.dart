import 'package:equatable/equatable.dart';

import '../../../data/model/book_model/book_model.dart';

abstract class FeatureSimillerBookState extends Equatable {
  const FeatureSimillerBookState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FeatureSimilarBookStateIntial extends FeatureSimillerBookState {}

class FeatureSimilarBookStateLoading extends FeatureSimillerBookState {}

class FeatureSimilarBookStateFailure extends FeatureSimillerBookState {
  final String errMessage;
  const FeatureSimilarBookStateFailure(this.errMessage);
}

class FeatureSimilarBookStateSuccess extends FeatureSimillerBookState {
  final List<BookModel> simillerbook;
  const FeatureSimilarBookStateSuccess(this.simillerbook);
}

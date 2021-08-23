import 'package:equatable/equatable.dart';
import 'package:patterns_block_real_api/model/contact_model.dart';

abstract class ListPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<Contact> posts;
  final bool isDeleted;

  ListPostLoaded({this.posts, this.isDeleted});
}

class ListPostError extends ListPostState {
  final error;

  ListPostError({this.error});
}
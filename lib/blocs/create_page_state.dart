import 'package:equatable/equatable.dart';

abstract class CreatePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreatePageInit extends CreatePageState {}

class CreatePageLoading extends CreatePageState {}

class CreatePageLoaded extends CreatePageState {
  final bool isCreated;

  CreatePageLoaded({this.isCreated});
}

class CreatePageError extends CreatePageState {
  final error;

  CreatePageError({this.error});
}
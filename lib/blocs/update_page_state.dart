import 'package:equatable/equatable.dart';

abstract class UpdatePageState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdatePageInit extends UpdatePageState {}

class UpdatePageLoading extends UpdatePageState {}

class UpdatePageLoaded extends UpdatePageState {
  final bool isUpdate;

  UpdatePageLoaded({this.isUpdate});
}

class UpdatePageError extends UpdatePageState {
  final error;

  UpdatePageError({this.error});
}
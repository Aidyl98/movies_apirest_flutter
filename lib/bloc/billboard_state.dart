part of 'billboard_bloc.dart';

@immutable
abstract class BillboardState {
  const BillboardState();
}

class BillboardInitial extends BillboardState {}

class BillboardLoadingState extends BillboardState {
  final String message;

  const BillboardLoadingState({
    required this.message,
  });
}

class BillboardSuccessState extends BillboardState {
  final List<BillBoardModel> billBoardMoviesList;

  const BillboardSuccessState({
    required this.billBoardMoviesList,
  });
}

class BillboardErrorState extends BillboardState {
  final String error;

  const BillboardErrorState({
    required this.error,
  });
}

part of 'movies_bloc.dart';

@immutable
abstract class MoviesState {
  const MoviesState();
}

class MoviesInitial extends MoviesState {}

class MoviesLoadingState extends MoviesState {
  final String message;

  const MoviesLoadingState({
    required this.message,
  });
}

class MoviesSuccessState extends MoviesState {
  final List<MoviesModel> moviesList;

  const MoviesSuccessState({
    required this.moviesList,
  });
}

class MoviesErrorState extends MoviesState {
  final String error;

  const MoviesErrorState({
    required this.error,
  });
}

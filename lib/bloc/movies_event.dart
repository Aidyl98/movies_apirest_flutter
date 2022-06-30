part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {
  const MoviesEvent();
}

class BillboardFetchEvent extends MoviesEvent {
  const BillboardFetchEvent();
}

class PopularMoviesFetchEvent extends MoviesEvent {
  const PopularMoviesFetchEvent();
}

class ChildMoviesFetchEvent extends MoviesEvent {
  const ChildMoviesFetchEvent();
}

class SearchMoviesFetchEvent extends MoviesEvent {
  String textSearch;

  SearchMoviesFetchEvent(
    this.textSearch,
  );
}

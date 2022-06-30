part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {
  const MoviesEvent();
}

class BillboardFetchEvent extends MoviesEvent {
  const BillboardFetchEvent();
}

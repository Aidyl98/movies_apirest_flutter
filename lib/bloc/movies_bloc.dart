import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movies_apirest_flutter/data/model/movies_model.dart';
import 'package:movies_apirest_flutter/data/repository/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  late MoviesRepository moviesRepository;
  int page = 1;
  bool isFetching = false;

  MoviesBloc() : super(MoviesInitial()) {
    moviesRepository = Get.find<MoviesRepository>();
  }

  void fetch() {
    isFetching = true;
    add(const BillboardFetchEvent());
  }

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is BillboardFetchEvent) {
      try {
        yield const MoviesLoadingState(message: 'Loading Movies');
        isFetching = true;
        final response = await moviesRepository.getBillBoardMovies(page);
        isFetching = false;
        yield MoviesSuccessState(
          moviesList: response.toList(),
        );
        page++;
      } on Exception catch (exc) {
        isFetching = false;
        yield BMoviesErrorState(
          error: exc.toString().replaceAll("Exception: ", ""),
        );
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movies_apirest_flutter/data/model/movies_model.dart';
import 'package:movies_apirest_flutter/data/repository/movies_repository.dart';
import 'package:movies_apirest_flutter/utils/fetch_type_enum.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  late MoviesRepository moviesRepository;
  int pageBillboard = 1;
  int pagePopular = 1;
  int pageChildPopular = 1;
  int pageSearch = 1;

  bool isFetching = false;

  MoviesBloc() : super(MoviesInitial()) {
    moviesRepository = Get.find<MoviesRepository>();
  }

  void fetch(FetchType fetchType, {String textSearch = ""}) {
    isFetching = true;
    switch (fetchType) {
      case FetchType.BillBoard:
        add(const BillboardFetchEvent());
        break;
      case FetchType.Popular:
        add(const PopularMoviesFetchEvent());
        break;
      case FetchType.ChildPopular:
        add(const ChildMoviesFetchEvent());
        break;
      case FetchType.Search:
        add(SearchMoviesFetchEvent(textSearch));
        break;
      default:
    }
  }

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    try {
      if (event is BillboardFetchEvent) {
        yield const MoviesLoadingState(message: 'Loading Movies');
        isFetching = true;
        final response =
            await moviesRepository.getBillBoardMovies(pageBillboard);
        isFetching = false;
        yield MoviesSuccessState(
          moviesList: response.toList(),
        );
        pageBillboard++;
      } else if (event is PopularMoviesFetchEvent) {
        yield const MoviesLoadingState(message: 'Loading Movies');
        isFetching = true;
        final response = await moviesRepository.getPopularMovies(pagePopular);
        isFetching = false;
        yield MoviesSuccessState(
          moviesList: response.toList(),
        );
        pagePopular++;
      } else if (event is ChildMoviesFetchEvent) {
        yield const MoviesLoadingState(message: 'Loading Movies');
        isFetching = true;
        final response =
            await moviesRepository.getChildMovies(pageChildPopular);
        isFetching = false;
        yield MoviesSuccessState(
          moviesList: response.toList(),
        );
        pageChildPopular++;
      } else if (event is SearchMoviesFetchEvent) {
        yield const MoviesLoadingState(message: 'Loading Movies');
        isFetching = true;
        final response = await moviesRepository.searchMovies(
          pageSearch,
          event.textSearch,
        );
        isFetching = false;
        yield MoviesSuccessState(
          moviesList: response.toList(),
        );
        pageSearch++;
      }
    } on Exception catch (exc) {
      isFetching = false;
      yield MoviesErrorState(
        error: exc.toString().replaceAll("Exception: ", ""),
      );
    }
  }
}

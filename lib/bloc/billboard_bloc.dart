import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movies_apirest_flutter/data/model/billboard_model.dart';
import 'package:movies_apirest_flutter/data/repository/movies_repository.dart';

part 'billboard_event.dart';
part 'billboard_state.dart';

class BillboardBloc extends Bloc<BillboardEvent, BillboardState> {
  late MoviesRepository moviesRepository;
  int page = 1;
  bool isFetching = false;

  BillboardBloc() : super(BillboardInitial()) {
    moviesRepository = Get.find<MoviesRepository>();
  }

  void fetch() {
    isFetching = true;
    add(const BillboardFetchEvent());
  }

  @override
  Stream<BillboardState> mapEventToState(BillboardEvent event) async* {
    if (event is BillboardFetchEvent) {
      try {
        yield const BillboardLoadingState(message: 'Loading Characters');
        isFetching = true;
        final response = await moviesRepository.getBillBoardMovies(page);
        isFetching = false;
        yield BillboardSuccessState(
          billBoardMoviesList: response.toList(),
        );
        page++;
      } on Exception catch (exc) {
        isFetching = false;
        yield BillboardErrorState(
          error: exc.toString().replaceAll("Exception: ", ""),
        );
      }
    }
  }
}

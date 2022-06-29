import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apirest_flutter/bloc/billboard_bloc.dart';
import 'package:movies_apirest_flutter/data/model/billboard_model.dart';
import 'package:movies_apirest_flutter/view/screens/movies_detail_screen.dart';
import 'package:movies_apirest_flutter/view/widgets/movies_poster.dart';
import 'package:movies_apirest_flutter/view/widgets/widget_utils.dart';

class MoviesBody extends StatefulWidget {
  const MoviesBody({Key? key}) : super(key: key);

  @override
  _MoviesBodyState createState() => _MoviesBodyState();
}

class _MoviesBodyState extends State<MoviesBody> {
  final List<BillBoardModel> _billboardMoviesList = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: BlocConsumer<BillboardBloc, BillboardState>(
        listener: (context, billboardState) {
          // Loading Data.
          if (billboardState is BillboardLoadingState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: WidgetUtils.buildInfoText(
                  text: billboardState.message,
                  context: context,
                  size: size,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            );
            // Get Data, end of the list.
          } else if (billboardState is BillboardSuccessState &&
              billboardState.billBoardMoviesList.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: WidgetUtils.buildInfoText(
                  text: 'No more movies.',
                  context: context,
                  size: size,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            );
            // Get Data Error.
          } else if (billboardState is BillboardErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: WidgetUtils.buildInfoText(
                  text: billboardState.error,
                  context: context,
                  size: size,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return;
        },
        builder: (context, billboardState) {
          // Loading Data
          if (billboardState is BillboardInitial ||
              billboardState is BillboardLoadingState &&
                  _billboardMoviesList.isEmpty) {
            return WidgetUtils.buildCircularProgressIndicator(context);
            // Add the fetched data to the list.
          } else if (billboardState is BillboardSuccessState) {
            _billboardMoviesList.addAll(billboardState.billBoardMoviesList);
            ScaffoldMessenger.of(context).clearSnackBars();
            // Error View.
          } else if (billboardState is BillboardErrorState &&
              _billboardMoviesList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Reload recuest.
                IconButton(
                  iconSize: size.width / 5,
                  color: Theme.of(context).colorScheme.secondary,
                  splashColor: Theme.of(context).colorScheme.background,
                  tooltip: "Try to fetch the data.",
                  onPressed: () {
                    BlocProvider.of<BillboardBloc>(context)
                        .add(const BillboardFetchEvent());
                  },
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
                // Show text error.
                const SizedBox(height: 15),
                WidgetUtils.buildInfoText(
                  text: billboardState.error,
                  context: context,
                  size: size,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
          return GridView.builder(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<BillboardBloc>(context).isFetching) {
                  BlocProvider.of<BillboardBloc>(context).fetch();
                }
              }),
            itemCount: _billboardMoviesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) => _buildOpenContainer(
              index,
              size,
            ),
          );
        },
      ),
    );
  }

  _buildOpenContainer(int index, Size size) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(index, size),
        openBuilder: (context, action) => _buildOpen(index),
        closedColor: Theme.of(context).colorScheme.primary,
        middleColor: Theme.of(context).colorScheme.background,
      ),
    );
  }

  // Tile that shows the list of characters.
  _buildClosed(int index, Size size) {
    return Card(
      child: GridTile(
        // Movie Poster.
        child: MoviesPoster(
          moviePoster: _billboardMoviesList[index].posterPath,
        ),
        // Movie Title.
        footer: WidgetUtils.buildInfoText(
          text: _billboardMoviesList[index].title,
          context: context,
          size: size,
          maxLines: 1,
        ),
      ),
    );
  }

  // Shows the Detail Screen of the selected character.
  _buildOpen(int index) {
    return MoviesDetailScreen(billBoardModel: _billboardMoviesList[index]);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

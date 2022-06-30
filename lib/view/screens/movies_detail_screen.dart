import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movies_apirest_flutter/data/api_constants.dart';
import 'package:movies_apirest_flutter/data/model/movies_model.dart';
import 'package:movies_apirest_flutter/view/widgets/movies_poster.dart';
import 'package:movies_apirest_flutter/view/widgets/widget_utils.dart';

class MoviesDetailScreen extends StatelessWidget {
  final MoviesModel billBoardModel;

  const MoviesDetailScreen({
    Key? key,
    required this.billBoardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// [MediaQuery] for responsive ui.
    final Size size = MediaQuery.of(context).size;

    /// Space between the indicator and his info.
    final double sizeBoxHeight = size.height / 120;

    /// [Row] that contain the popularity and the count of the votes of a given movie.
    _buildPublicVotes() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              // Popularity Info.
              SizedBox(height: sizeBoxHeight),
              WidgetUtils.buildIndicatorText('Popularity:', context, size),
              WidgetUtils.buildInfoText(
                text:
                    (billBoardModel.voteAverage * 10).toStringAsFixed(0) + "%",
                context: context,
                size: size,
                maxLines: 1,
              ),
            ],
          ),
          Column(
            children: [
              // Count of Votes Info.
              SizedBox(height: sizeBoxHeight),
              WidgetUtils.buildIndicatorText('Count of Votes:', context, size),
              WidgetUtils.buildInfoText(
                text: billBoardModel.voteCount.toString(),
                context: context,
                size: size,
                maxLines: 1,
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                // Movie Poster.
                SizedBox(
                  height: size.height / 2,
                  width: size.width,
                  child: MoviesPoster(
                    moviePoster:
                        ApiConstants.imageEndPoint + billBoardModel.posterPath,
                    boxFit: BoxFit.fill,
                  ),
                ),

                SizedBox(height: sizeBoxHeight),

                // Movie Title.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: AutoSizeText(
                    billBoardModel.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: size.width / 11,
                        ),
                    maxLines: 3,
                  ),
                ),

                SizedBox(height: sizeBoxHeight),

                AutoSizeText(
                  'Movie Details',
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: size.width / 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                        decorationColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// [Row] that contain the popularity and
                /// the count of the votes of a given movie.
                _buildPublicVotes(),

                SizedBox(height: sizeBoxHeight),

                // Overview Info.
                WidgetUtils.buildIndicatorText('Overview:', context, size),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: WidgetUtils.buildInfoText(
                    text: billBoardModel.overview,
                    context: context,
                    size: size,
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: sizeBoxHeight * 2),
              ],
            ),
            Positioned(
              top: 35,
              left: 10,
              child: WidgetUtils.circularButtonWithIcon(
                onPressed: () => null,
                backgroundColor: Theme.of(context).colorScheme.background,
                child: const BackButton(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

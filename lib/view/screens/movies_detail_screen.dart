import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movies_apirest_flutter/data/model/billboard_model.dart';
import 'package:movies_apirest_flutter/view/widgets/movies_poster.dart';
import 'package:movies_apirest_flutter/view/widgets/widget_utils.dart';

class MoviesDetailScreen extends StatelessWidget {
  final BillBoardModel billBoardModel;

  const MoviesDetailScreen({
    Key? key,
    required this.billBoardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double sizeBoxHeight = size.height / 120;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Stack(
            children: [
              Column(
                children: [
                  // Movie Poster.
                  MoviesPoster(
                    moviePoster: billBoardModel.posterPath,
                  ),

                  SizedBox(
                    height: size.height / 12,
                  ),

                  // Movie Title.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AutoSizeText(
                      billBoardModel.title,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            fontSize: size.width / 9,
                          ),
                      maxLines: 1,
                    ),
                  ),

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

                  // Overview Info.
                  WidgetUtils.buildIndicatorText('Overview:', context, size),
                  WidgetUtils.buildInfoText(
                    text: billBoardModel.overview,
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),

                  // Popularity Info.
                  SizedBox(height: sizeBoxHeight),
                  WidgetUtils.buildIndicatorText('Popularity:', context, size),
                  WidgetUtils.buildInfoText(
                    text: billBoardModel.popularity.toString(),
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),
                  // Count of Votes Info.
                  SizedBox(height: sizeBoxHeight),
                  WidgetUtils.buildIndicatorText(
                      'Count of Votes:', context, size),
                  WidgetUtils.buildInfoText(
                    text: billBoardModel.voteCount.toString(),
                    context: context,
                    size: size,
                    maxLines: 1,
                  ),
                ],
              ),
              const Positioned(
                top: 5,
                left: 5,
                child: BackButton(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

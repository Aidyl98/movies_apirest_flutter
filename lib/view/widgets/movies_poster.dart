import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_apirest_flutter/view/widgets/widget_utils.dart';

class MoviesPoster extends StatelessWidget {
  final String moviePoster;
  final double radiusImage;

  const MoviesPoster({
    Key? key,
    required this.moviePoster,
    this.radiusImage = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: moviePoster,
      placeholder: (context, url) =>
          WidgetUtils.buildCircularProgressIndicator(context),
      errorWidget: (context, url, error) => const Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/images/image_error.png'),
      ),
    );
  }
}

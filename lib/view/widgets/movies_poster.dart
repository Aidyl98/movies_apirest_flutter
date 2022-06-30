import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_apirest_flutter/data/api_constants.dart';
import 'package:movies_apirest_flutter/view/widgets/widget_utils.dart';

class MoviesPoster extends StatelessWidget {
  final String moviePoster;
  final BoxFit boxFit;

  const MoviesPoster({
    Key? key,
    required this.moviePoster,
    this.boxFit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      imageUrl: ApiConstants.imageEndPoint + moviePoster,
      placeholder: (context, url) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          WidgetUtils.buildCircularProgressIndicator(context),
        ],
      ),
      errorWidget: (context, url, error) => Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SizedBox(
              height: 70,
              width: 70,
              child: Image.asset(
                'assets/images/camera_gray.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

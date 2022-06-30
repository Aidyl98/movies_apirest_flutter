import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class WidgetUtils {
  static buildInfoText({
    required String text,
    required BuildContext context,
    required Size size,
    TextAlign? textAlign,
    Color? color,
    int? maxLines,
  }) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontSize: size.width / 15,
            color: color,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  static buildIndicatorText(
    String text,
    BuildContext context,
    Size size,
  ) {
    return AutoSizeText(
      text,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontSize: size.width / 14,
          ),
    );
  }

  static buildCircularProgressIndicator(BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).colorScheme.secondary,
      strokeWidth: 8,
    );
  }

  static Widget circularButtonWithIcon({
    required Function()? onPressed,
    String heroTag = '<FloatingActionButton: circularButtonWithIcon>',
    Color splashColor = Colors.blueGrey,
    Color backgroundColor = Colors.lightBlue,
    Widget child = const Icon(Icons.settings_backup_restore_rounded),
    double size = 56,
  }) {
    return SizedBox(
      height: size,
      width: size,
      child: FloatingActionButton(
        heroTag: heroTag,
        // The color of the circle.
        backgroundColor: backgroundColor,
        // The elevation of the button.
        elevation: 20,
        // Highlight elevation is the elevation of the button when tapped.
        highlightElevation: 50,
        // The color of the splash.
        splashColor: splashColor,
        // What is supouse to happend when is pressed.
        onPressed: onPressed,
        // The icon with the animation that the button is going to have.
        child: child,
      ),
    );
  }
}

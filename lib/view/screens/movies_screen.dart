import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apirest_flutter/bloc/movies_bloc.dart';
import 'package:movies_apirest_flutter/utils/fetch_type_enum.dart';
import 'package:movies_apirest_flutter/view/widgets/movies_body.dart';
import 'package:movies_apirest_flutter/view/widgets/ui_drawer.dart';

class MoviesScreen extends StatelessWidget {
  final FetchType fetchType;

  const MoviesScreen({
    Key? key,
    required this.fetchType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _getAppBarTitle() {
      switch (fetchType) {
        case FetchType.BillBoard:
          return "BillBoard of Movies.";

        case FetchType.Popular:
          return "Most Popular Movies.";

        case FetchType.ChildPopular:
          return "Popular Child Movies.";

        case FetchType.Search:
          return "Search Movie.";
        default:
          return "Movies Wiki.";
      }
    }

    return BlocProvider(
      create: (context) => MoviesBloc()..fetch(fetchType),
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            _getAppBarTitle(),
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
          ),
        ),
        drawer: const UIDrawer(),
        body: MoviesBody(
          fetchType: fetchType,
          key: key,
        ),
      ),
    );
  }
}

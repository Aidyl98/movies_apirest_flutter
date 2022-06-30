import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apirest_flutter/bloc/movies_bloc.dart';
import 'package:movies_apirest_flutter/view/widgets/movies_body.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc()..add(const BillboardFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: AutoSizeText(
            'Movies Wiki',
            style: Theme.of(context).textTheme.headline6,
            maxLines: 1,
          ),
        ),
        body: const MoviesBody(),
      ),
    );
  }
}
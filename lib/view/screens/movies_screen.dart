import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_apirest_flutter/bloc/movies_bloc.dart';
import 'package:movies_apirest_flutter/utils/fetch_type_enum.dart';
import 'package:movies_apirest_flutter/view/widgets/movies_body.dart';
import 'package:movies_apirest_flutter/view/widgets/ui_drawer.dart';

class MoviesScreen extends StatefulWidget {
  final FetchType fetchType;
  final String searchText;

  const MoviesScreen({
    Key? key,
    required this.fetchType,
    this.searchText = "a",
  }) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  bool _searchBoolean = false;

  final TextEditingController textEditingController = TextEditingController();

  String _getAppBarTitle() {
    switch (widget.fetchType) {
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

  _buildSearchTextField() {
    return TextField(
        controller: textEditingController,
        autofocus: true,
        textInputAction: TextInputAction.search,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          hintText: "Search a Movie...",
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        onEditingComplete: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/search',
              arguments: {
                'fetchType': FetchType.Search,
                'search': textEditingController.text,
              },
              (Route<dynamic> route) => false);
        });
  }

  _buildTitle() {
    return AutoSizeText(
      _getAppBarTitle(),
      style: Theme.of(context).textTheme.headline6,
      maxLines: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesBloc()..fetch(widget.fetchType, textSearch: widget.searchText),
      child: Scaffold(
        appBar: AppBar(
          title: _searchBoolean ? _buildSearchTextField() : _buildTitle(),
          actions: widget.fetchType == FetchType.Search
              ? [
                  !_searchBoolean
                      ? IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              _searchBoolean = true;
                            });
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _searchBoolean = false;
                            });
                          },
                        )
                ]
              : [],
        ),
        drawer: const UIDrawer(),
        body: MoviesBody(
          fetchType: widget.fetchType,
          searchText: widget.searchText,
          key: widget.key,
        ),
      ),
    );
  }
}

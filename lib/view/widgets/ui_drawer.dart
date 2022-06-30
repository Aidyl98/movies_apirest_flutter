import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_apirest_flutter/utils/fetch_type_enum.dart';

class UIDrawer extends StatelessWidget {
  const UIDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconsSize = size.width / 13;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              image: AssetImage('assets/images/drawer.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(color: Colors.white),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AutoSizeText(
                    'Menu:',
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: size.width / 4,
                        ),
                    maxLines: 1,
                  ),
                ),
                _buildListTile(
                  context: context,
                  size: size,
                  title: "BillBoard of Movies.",
                  leading: Icon(
                    FontAwesomeIcons.list,
                    size: iconsSize,
                  ),
                  tapHandler: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/movies',
                          arguments: {
                            'fetchType': FetchType.BillBoard,
                          },
                          (Route<dynamic> route) => false),
                ),
                _buildListTile(
                  context: context,
                  size: size,
                  title: "Most Popular Movies.",
                  leading: Icon(
                    FontAwesomeIcons.star,
                    size: iconsSize,
                  ),
                  tapHandler: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/movies',
                          arguments: {
                            'fetchType': FetchType.Popular,
                          },
                          (Route<dynamic> route) => false),
                ),
                _buildListTile(
                  context: context,
                  size: size,
                  title: "Popular Child Movies",
                  leading: Icon(
                    FontAwesomeIcons.child,
                    size: iconsSize,
                  ),
                  tapHandler: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/movies',
                          arguments: {
                            'fetchType': FetchType.ChildPopular,
                          },
                          (Route<dynamic> route) => false),
                ),
                _buildListTile(
                  context: context,
                  size: size,
                  title: "Search Movie.",
                  leading: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: iconsSize,
                  ),
                  tapHandler: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/movies',
                          arguments: {
                            'fetchType': FetchType.Search,
                          },
                          (Route<dynamic> route) => false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildListTile({
    required String title,
    required Widget leading,
    required Function tapHandler,
    required Size size,
    required BuildContext context,
  }) {
    return ListTile(
      leading: leading,
      minLeadingWidth: size.width / 15,
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          fontSize: size.width / 15,
          shadows: [
            Shadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 10.0,
              offset: const Offset(3.0, 3.0),
            ),
            Shadow(
              color: Theme.of(context).colorScheme.background,
              blurRadius: 10.0,
              offset: const Offset(-3.0, 3.0),
            ),
          ],
        ),
      ),
      onTap: () => tapHandler(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/constants/constants.dart';

class AppbarDefault extends StatelessWidget implements PreferredSizeWidget {
  const AppbarDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
        ),
      ),
      title: Image.asset(
        xxiLogo,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 7,
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {}, icon: FaIcon(FontAwesomeIcons.arrowsRotate))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

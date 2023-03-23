import 'package:clone_mtix/module/mymtix/view/mymtix_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../shared/utils/constants/constants.dart';

class AppbarDefault extends StatelessWidget implements PreferredSizeWidget {
  bool isMtixScreen;
  AppbarDefault({
    Key? key,
    this.isMtixScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      title: Image.asset(
        xxiLogo,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height / 7,
      ),
      centerTitle: true,
      actions: [
        (isMtixScreen)
            ? Container()
            : IconButton(
                onPressed: () {}, icon: FaIcon(FontAwesomeIcons.arrowsRotate))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

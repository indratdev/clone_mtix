import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../shared/utils/colors/colors_app.dart';

class DrawerDashboardWidget extends StatelessWidget {
  const DrawerDashboardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome, [Guest]",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "v5.2.1",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: ColorsApp.greenApp,
              ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            shrinkWrap: true,
            itemCount: listDrawer.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: listDrawer[index]["iconColor"],
                  child: (listDrawer[index]["iconLeter"] != "")
                      ? Text(listDrawer[index]["iconLeter"])
                      : listDrawer[index]["icon"],
                ),
                title: (listDrawer[index]["hasBadge"] == false)
                    ? Text(listDrawer[index]["name"])
                    : Badge(
                        showBadge: true,
                        stackFit: StackFit.loose,
                        position: BadgePosition.topStart(start: 70, top: -20),
                        badgeContent: Text('?'),
                        child: Text(listDrawer[index]["name"])),
                onTap: () {},
              );
            },
          )
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> listDrawer = [
  {
    "icon": FaIcon(FontAwesomeIcons.clapperboard),
    "iconColor": ColorsApp.greenApp,
    "name": "Home",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.m),
    "iconColor": Colors.orange,
    "name": "M-Tix Registration",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.chair),
    "iconColor": ColorsApp.greenApp,
    "name": "Favorite Theater",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.i),
    "iconColor": ColorsApp.greenApp,
    "name": "Imax Theater",
    "iconLeter": "IMAX",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.fileLines),
    "iconColor": ColorsApp.greenApp,
    "name": "Term of services/disclainer",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.question),
    "iconColor": ColorsApp.greenApp,
    "name": "FAQ",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.question),
    "iconColor": ColorsApp.greenApp,
    "name": "What's New",
    "iconLeter": "NEW",
    "hasBadge": true,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.lock),
    "iconColor": ColorsApp.greenApp,
    "name": "Privacy Policy",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
  {
    "icon": FaIcon(FontAwesomeIcons.phone),
    "iconColor": ColorsApp.greenApp,
    "name": "Contact Us",
    "iconLeter": "",
    "hasBadge": false,
    // "ontap":  Function(),
  },
];

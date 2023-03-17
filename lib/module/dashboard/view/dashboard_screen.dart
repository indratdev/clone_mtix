import 'package:clone_mtix/module/dashboard/controller/dashboard_controller.dart';
import 'package:clone_mtix/module/dashboard/view/widget/appbar_default_widget.dart';
import 'package:clone_mtix/module/dashboard/view/export.dart';
import 'package:clone_mtix/module/mfood/view/mfood_screen.dart';
import 'package:clone_mtix/module/mymtix/view/mymtix_screen.dart';
import 'package:clone_mtix/module/playing/view/playing_screen.dart';
import 'package:clone_mtix/module/theater/view/theater_screen.dart';
import 'package:clone_mtix/module/upcoming/view/upcoming_screen.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:clone_mtix/shared/utils/text_style/text_style_app.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    final _buildBody = <Widget>[
      PlayingScreen(controller: controller),
      UpcomingScreen(),
      TheaterScreen(),
      MfoodScreen(),
      MyMtixScreen(),
    ];

    return Scaffold(
      appBar: const AppbarDefault(),
      drawer: DrawerDashboardWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Playing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'UpComing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Theater',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bowlFood),
            label: 'M.Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'My m.tix',
          ),
        ],
        selectedItemColor: ColorsApp.greenApp,
        unselectedItemColor: ColorsApp.greenApp.withOpacity(0.5),
        showUnselectedLabels: true,
        currentIndex: controller.getIndexBottomNav,
        onTap: (value) {
          controller.setIndexBottomNav = value;
          setState(() {});
        },
      ),
      body: _buildBody[controller.getIndexBottomNav],
    );
  }
}

final List<Map> myProducts =
    List.generate(20, (index) => {"id": index, "name": "Product $index"})
        .toList();

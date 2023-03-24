import 'package:clone_mtix/shared/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/text_style/text_style_app.dart';

class MfoodScreen extends StatelessWidget {
  const MfoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            width: double.infinity,
            child: Image.asset(xxicafe, fit: BoxFit.cover),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    // context.read<TheaterBloc>().add(getLocationCinemaEvent());
                    // Navigator.pushNamed(
                    //     context, AppRoutes.theaterLocationScreen);
                  },
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Theaters in ",
                          style: TextStyleApp.titleTextGreen,
                        ),
                        Text(
                          "iiiiii",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleApp.textDefaultOrange,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  // alignment: Alignment.centerRight,
                  // color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.locationDot),
                          label: const Text("Near Me"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: ColorsApp.greenApp,
                            elevation: 0,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          const Divider(
              thickness: 1, color: ColorsApp.backgroundDashboardColor),
          TextField(
            decoration: InputDecoration(
                hintText: "Type a theater to search",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 1,
                  color: ColorsApp.backgroundDashboardColor,
                ))),
          ),
        ],
      ),
    );
  }
}

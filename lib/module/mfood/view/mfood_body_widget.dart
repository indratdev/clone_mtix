import 'package:clone_mtix/module/mfood/view/mfood_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/constants/constants.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../../theater/bloc/theater_bloc.dart';
import '../../theater/model/theater_model.dart';
import '../../theaterLocation/view/theater_location_screen.dart';

class MfoodBodyWidget extends StatelessWidget {
  const MfoodBodyWidget({
    Key? key,
    required this.locationCinema,
    required this.listTheaters,
  }) : super(key: key);

  final String locationCinema;
  final List<TheaterModel>? listTheaters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          width: double.infinity,
          child: Image.asset(
            xxicafe,
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: InkWell(
                onTap: () {
                  context.read<TheaterBloc>().add(getLocationCinemaEvent());

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TheaterLocationScreen(isMfood: true),
                      ));
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      const Text(
                        "Theaters in ",
                        style: TextStyleApp.titleTextGreen,
                      ),
                      Text(
                        locationCinema,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleApp.textDefaultOrange,
                      ),
                      const Icon(Icons.keyboard_arrow_down_outlined),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.locationDot),
                      label: const Text("Near Me"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: ColorsApp.greenApp,
                        elevation: 0,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        const Divider(thickness: 1, color: ColorsApp.backgroundDashboardColor),
        const TextField(
          decoration: InputDecoration(
              hintText: "Type a theater to search",
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 1,
                color: ColorsApp.backgroundDashboardColor,
              ))),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listTheaters?.length ?? 0,
            itemBuilder: (context, index) {
              TheaterModel? data = listTheaters?[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MfoodOrderScreen(data: data),
                      ));
                },
                child: ListTile(
                  minLeadingWidth: 5,
                  leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 30,
                      backgroundColor: ColorsApp.orangeMtix,
                      child: Image.asset(
                        mtixIcon,
                        height: MediaQuery.of(context).size.width / 37,
                      )),
                  title: Text(data?.name ?? ""),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

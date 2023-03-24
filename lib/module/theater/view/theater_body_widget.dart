import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/route/routes.dart';
import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/constants/constants.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../bloc/theater_bloc.dart';
import '../model/theater_model.dart';

class TheaterBodyWidget extends StatefulWidget {
  String locationCinema;
  TheaterOption selectedOption;
  List<TheaterModel>? listTheaters;
  bool isSearch;

  TheaterBodyWidget({
    Key? key,
    required this.locationCinema,
    this.selectedOption = TheaterOption.cinemaxxi,
    this.listTheaters,
    this.isSearch = false,
  }) : super(key: key);

  @override
  State<TheaterBodyWidget> createState() => _TheaterBodyWidgetState();
}

class _TheaterBodyWidgetState extends State<TheaterBodyWidget> {
  @override
  Widget build(BuildContext context) {
    // optionTheater(TheaterOption option) {
    //   if (option.name == TheaterOption.cinemaxxi.name) {
    //     widget.selectedOption = TheaterOption.cinemaxxi;
    //   } else if (option.name == TheaterOption.premiere.name) {
    //     widget.selectedOption = TheaterOption.premiere;
    //   } else if (option.name == TheaterOption.imax.name) {
    //     widget.selectedOption = TheaterOption.imax;
    //   }
    // }

    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    context.read<TheaterBloc>().add(getLocationCinemaEvent());
                    Navigator.pushNamed(
                        context, AppRoutes.theaterLocationScreen);
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
                          widget.locationCinema.toString().toUpperCase(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: (widget.selectedOption == TheaterOption.cinemaxxi)
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: ColorsApp.greenApp,
                            ),
                          ),
                          color: Colors.white,
                        )
                      : null,
                  child: TextButton(
                      onPressed: () {
                        // optionTheater(TheaterOption.cinemaxxi);
                        context.read<TheaterBloc>().add(GetTheaterEvent(
                            isSearch: false,
                            location: widget.locationCinema,
                            theaterOption: TheaterOption.cinemaxxi));
                        // (!widget.isSearch)
                        //     ? context.read<TheaterBloc>().add(GetTheaterEvent(
                        //         isSearch: false,
                        //         location: widget.locationCinema,
                        //         theaterOption: TheaterOption.cinemaxxi))
                        //     : context
                        //         .read<TheaterBloc>()
                        //         .add(SelectedLocationCinemaEvent(
                        //           locationCinema: widget.locationCinema,
                        //         ));
                      },
                      child: Text(
                        "CINEMA XXI",
                        style: TextStyleApp.titleTextGreen,
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: (widget.selectedOption == TheaterOption.premiere)
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: ColorsApp.greenApp,
                            ),
                          ),
                          color: Colors.white,
                        )
                      : null,
                  child: TextButton(
                      onPressed: () {
                        // optionTheater(TheaterOption.premiere);
                        context.read<TheaterBloc>().add(GetTheaterEvent(
                            isSearch: false,
                            location: widget.locationCinema,
                            theaterOption: TheaterOption.premiere));
                        // (!widget.isSearch)
                        //     ? context.read<TheaterBloc>().add(GetTheaterEvent(
                        //         isSearch: false,
                        //         location: widget.locationCinema,
                        //         theaterOption: TheaterOption.premiere))
                        //     : context
                        //         .read<TheaterBloc>()
                        //         .add(SelectedLocationCinemaEvent(
                        //           locationCinema: widget.locationCinema,
                        //         ));
                        // ;
                      },
                      child: Text(
                        "PREMIERE",
                        style: TextStyleApp.titleTextGreen,
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: (widget.selectedOption == TheaterOption.imax)
                      ? BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 3.0,
                              color: ColorsApp.greenApp,
                            ),
                          ),
                          color: Colors.white,
                        )
                      : null,
                  child: TextButton(
                      onPressed: () {
                        // optionTheater(TheaterOption.imax);
                        context.read<TheaterBloc>().add(GetTheaterEvent(
                            isSearch: false,
                            location: widget.locationCinema,
                            theaterOption: TheaterOption.imax));
                      },
                      child: Text(
                        "IMAX",
                        style: TextStyleApp.titleTextGreen,
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.listTheaters?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  minLeadingWidth: 5,
                  leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 30,
                      backgroundColor: ColorsApp.orangeMtix,
                      child: Image.asset(
                        mtixIcon,
                        height: MediaQuery.of(context).size.width / 37,
                      )),
                  title: Text(widget.listTheaters?[index].name ?? ""),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:clone_mtix/module/theater/bloc/theater_bloc.dart';
import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:clone_mtix/module/theaterLocation/bloc/theaterlocation_bloc.dart';
import 'package:clone_mtix/shared/route/routes.dart';
import 'package:clone_mtix/shared/utils/constants/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../model/theater_model.dart';

class TheaterScreen extends StatefulWidget {
  const TheaterScreen({super.key});

  @override
  State<TheaterScreen> createState() => _TheaterScreenState();
}

class _TheaterScreenState extends State<TheaterScreen> {
  TheaterOption _selectedOption = TheaterOption.cinemaxxi;
  TheaterController controller = TheaterController();
  String locationCinema = "jakarta";

  optionTheater(TheaterOption option) {
    if (option.name == TheaterOption.cinemaxxi.name) {
      _selectedOption = TheaterOption.cinemaxxi;
    } else if (option.name == TheaterOption.premiere.name) {
      _selectedOption = TheaterOption.premiere;
    } else if (option.name == TheaterOption.imax.name) {
      _selectedOption = TheaterOption.imax;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TheaterBloc()
              ..add(GetTheaterEvent(
                  location: "jakarta",
                  theaterOption: TheaterOption.cinemaxxi))),
        // BlocProvider(
        //   create: (context) => TheaterlocationBloc(),
        // ),
      ],
      // BlocProvider(
      //   create: (context) => TheaterBloc()
      //     ..add(GetTheaterEvent(
      //         location: "jakarta", theaterOption: TheaterOption.cinemaxxi)),
      child: BlocBuilder<TheaterBloc, TheaterState>(
        builder: (context, state) {
          print(">>> state : $state");
          if (state is SuccessSelectedTheaterLocation) {
            print("selected :: ${state.selectedLocation}");
          }

          if (state is LoadingTheater) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is SuccessTheaterCinema) {
            List<TheaterModel> listTheaters = state.theaterModel;
            locationCinema = state.location;

            return Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: InkWell(
                          onTap: () {
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
                                  locationCinema.toString().toUpperCase(),
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
                  Divider(
                    thickness: 1,
                    color: ColorsApp.backgroundDashboardColor,
                  ),
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
                          decoration:
                              (_selectedOption == TheaterOption.cinemaxxi)
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
                                optionTheater(TheaterOption.cinemaxxi);
                                context.read<TheaterBloc>().add(GetTheaterEvent(
                                    location: locationCinema,
                                    theaterOption: TheaterOption.cinemaxxi));
                              },
                              child: Text(
                                "CINEMA XXI",
                                style: TextStyleApp.titleTextGreen,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration:
                              (_selectedOption == TheaterOption.premiere)
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
                                optionTheater(TheaterOption.premiere);
                                context.read<TheaterBloc>().add(GetTheaterEvent(
                                    location: locationCinema,
                                    theaterOption: TheaterOption.premiere));
                              },
                              child: Text(
                                "PREMIERE",
                                style: TextStyleApp.titleTextGreen,
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: (_selectedOption == TheaterOption.imax)
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
                                optionTheater(TheaterOption.imax);
                                context.read<TheaterBloc>().add(GetTheaterEvent(
                                    location: locationCinema,
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
                      itemCount: listTheaters.length,
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
                          title: Text(listTheaters[index].name),
                          trailing: Icon(Icons.arrow_forward_ios_outlined),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return Container(
            child: Text("No Data"),
          );
        },
      ),
    );
  }
}

Widget buildSegment(String text) {
  return Container(
    child: Text(
      text,
      style: TextStyle(fontSize: 22, color: Colors.black),
    ),
  );
}

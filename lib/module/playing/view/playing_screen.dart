import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:clone_mtix/module/playing/bloc/playing_bloc.dart';
import 'package:clone_mtix/module/theaterLocation/view/theater_location_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../../../shared/widget/export.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../theater/bloc/theater_bloc.dart';

class PlayingScreen extends StatefulWidget {
  const PlayingScreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final DashboardController? controller;

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  String _locationPlaying = "JAKARTA";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<PlayingBloc, PlayingState>(
                  builder: (context, state) {
                    if (state is SuccessSelectedTheaterLocationPlaying) {
                      _locationPlaying = state.selectedLocation;

                      return LocationWidget(locationPlaying: _locationPlaying);
                    }
                    return LocationWidget(locationPlaying: _locationPlaying);
                  },
                ),
                Flexible(
                  flex: 3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Badge(
                            position: BadgePosition.custom(top: 0, end: 0),
                            child: const FaIcon(
                              FontAwesomeIcons.inbox,
                            ),
                          ),
                          label: const Text("Inbox"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: ColorsApp.greenApp,
                            elevation: 0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Badge(
                              badgeContent: Text("1",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              child: FaIcon(FontAwesomeIcons.ticket)),
                          label: const Text("E-Voucher"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: ColorsApp.greenApp,
                            elevation: 0,
                          ),
                        ),
                      ]),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 400.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                ),
                items: widget.controller!.getBannerMovie.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return CachedNetworkImage(
                        imageUrl: i,
                        imageBuilder: (context, imageProvider) => Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) {
                          return const Center(
                              child: CircularProgressIndicator.adaptive());
                        },
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            BlocBuilder<PlayingBloc, PlayingState>(
              builder: (context, state) {
                if (state is LoadingNowPlaying) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                if (state is FailureNowPlaying) {
                  return Text(state.info.toString());
                }

                if (state is SuccessNowPlaying) {
                  var data = state.result;
                  return ListMovieWidget(
                    data: data,
                    isUpcoming: false,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required String locationPlaying,
  })  : _locationPlaying = locationPlaying,
        super(key: key);

  final String _locationPlaying;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            context.read<TheaterBloc>().add(getLocationCinemaEvent());
            // Navigator.pushNamed(context, AppRoutes.theaterLocationScreen);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TheaterLocationScreen(isPlaying: true),
                ));
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.location_on),
              Text(_locationPlaying, style: TextStyleApp.textDefaultOrange),
              Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

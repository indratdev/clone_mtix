import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:clone_mtix/module/playing/bloc/playing_bloc.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../../../shared/widget/export.dart';
import '../../dashboard/controller/dashboard_controller.dart';

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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                      ),
                      Text(
                        "JAKARTA",
                        style: TextStyleApp.textDefaultOrange,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  // alignment: Alignment.centerRight,
                  // color: Colors.red,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.inbox),
                          label: Text("Inbox"),
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.white,
                            // foregroundColor: ColorsApp.greenApp,
                            primary: Colors.white,
                            onPrimary: ColorsApp.greenApp,
                            elevation: 0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.ticket),
                          label: Text("E-Voucher"),
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.white,
                            // foregroundColor: ColorsApp.greenApp,
                            primary: Colors.white,
                            onPrimary: ColorsApp.greenApp,
                            elevation: 0,
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ),
          Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
              ),
              items: widget.controller!.getBannerMovie.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.blue),
                      child: CachedNetworkImage(
                        imageUrl: i,
                        imageBuilder: (context, imageProvider) => Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(
                              //     Colors.red, BlendMode.colorBurn),
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
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
                return ListMovieWidget(data: data);
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

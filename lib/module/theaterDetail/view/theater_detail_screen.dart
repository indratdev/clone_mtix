import 'package:cached_network_image/cached_network_image.dart';
import 'package:clone_mtix/module/dashboard/controller/dashboard_controller.dart';
import 'package:clone_mtix/module/theater/bloc/theater_bloc.dart';
import 'package:clone_mtix/module/theater/model/theater_model.dart';
import 'package:clone_mtix/module/theaterDetail/controller/theater_detail_controller.dart';
import 'package:clone_mtix/module/theaterDetail/view/list_movie_playing_on_cinema.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:clone_mtix/shared/utils/math/math.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/constants/constants.dart';
import '../../theater/controller/theater_controller.dart';

class TheaterDetailScreen extends StatefulWidget {
  TheaterModel? theaterModel;
  TheaterDetailScreen({
    Key? key,
    this.theaterModel,
  }) : super(key: key);

  @override
  State<TheaterDetailScreen> createState() => _TheaterDetailScreenState();
}

class _TheaterDetailScreenState extends State<TheaterDetailScreen> {
  final TheaterDetailController controller = TheaterDetailController();
  final DashboardController dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<TheaterBloc>(context).add(
          GetTheaterEvent(
              isSearch: false,
              location: "jakarta",
              theaterOption: TheaterOption.cinemaxxi),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            xxiLogo,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 7,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.theaterModel?.name ?? "",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.theaterModel?.address ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                widget.theaterModel?.location ?? "",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8),
                              const Text(
                                "TELEPON : (021) 299 99999",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.amber,
                            child: Column(
                              children: [
                                Container(
                                  height: 60,
                                ),
                                Image.asset(
                                  controller.getLogoTheater(
                                      widget.theaterModel?.cinema.toString() ??
                                          ""),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: ColorsApp.greenApp,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline),
                        label: Text("Add to Favorite"),
                      ),
                      SizedBox(width: 10),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          primary: ColorsApp.greenApp,
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.location_pin),
                        label: Text("Location"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(thickness: 5),
            BlocBuilder<TheaterBloc, TheaterState>(
              builder: (context, state) {
                if (state is SuccessNowPlayingOnCinema) {
                  var datas = state.result.results;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: MathCustom().getRandomNumber(datas.length - 1),
                      itemBuilder: (context, index) {
                        var data = datas[index];
                        return Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              IntrinsicHeight(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child:
                                          // Image.asset(data.poster_path),
                                          CachedNetworkImage(
                                              imageUrl:
                                                  'https://image.tmdb.org/t/p/w500${data.poster_path}',
                                              imageBuilder: (context,
                                                      imageProvider) =>
                                                  Container(
                                                    width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            4.5,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                              placeholder: (context, url) {
                                                return const Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive());
                                              },
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error)),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          // color: Colors.red,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  child: Text(data.title)),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorsApp
                                                                    .backgroundDashboardColor)),
                                                        child: Text("2D")),
                                                    Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: ColorsApp
                                                                    .backgroundDashboardColor)),
                                                        margin:
                                                            EdgeInsets.all(8),
                                                        child: Text("SU")),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.av_timer),
                                                  Text("134 Minutes"),
                                                ],
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              ListMoviePlayingOnCinema(datePlusOne: false),
                              SizedBox(height: 20),
                              ListMoviePlayingOnCinema(datePlusOne: true),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

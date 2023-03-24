import 'package:clone_mtix/module/playing/bloc/playing_bloc.dart';
import 'package:clone_mtix/module/playing/controller/playing_controller.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:clone_mtix/shared/utils/text_style/text_style_app.dart';
import 'package:clone_mtix/shared/widget/cachedimage/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/constants/constants.dart';

class DetailPlayingScreen extends StatefulWidget {
  DetailPlayingScreen({super.key});

  @override
  State<DetailPlayingScreen> createState() => _DetailPlayingScreenState();
}

class _DetailPlayingScreenState extends State<DetailPlayingScreen> {
  bool isReadSynopsis = false;

  @override
  Widget build(BuildContext context) {
    final PlayingController controller = PlayingController();

    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<PlayingBloc>(context).add(GetNowPlayingEvent());
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
        body: BlocBuilder<PlayingBloc, PlayingState>(
          builder: (context, state) {
            if (state is PlayingInitial) {
              return Text("initial ${state.props}");
            }

            if (state is LoadingDetailNowPlayingMovie) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (state is FailureDetailNowPlayingMovie) {
              return Center(
                child: Text(state.info.toString()),
              );
            }
            if (state is SuccessDetailNowPlayingMovie) {
              var creditResult = state.creditsResult;
              var detailResult = state.detailResult;

              return Container(
                color: ColorsApp.backgroundDashboardColor,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent.shade100,
                                child: Text(
                                  (!detailResult.adult) ? "13+" : "Adult",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(detailResult.original_title.toString()),
                                  Text(controller.convertGenreListToString(
                                      detailResult.genres)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: 1),
                        Container(
                          margin: EdgeInsets.all(12),
                          height: MediaQuery.of(context).size.height / 3.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  flex: 1,
                                  child: CachedImageWidget(
                                    imageUrl: detailResult.poster_path,
                                  )),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.blue,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                          child: Row(
                                        children: <Widget>[
                                          FaIcon(FontAwesomeIcons.clock),
                                          SizedBox(width: 10),
                                          Text(
                                              "${detailResult.runtime} Minutes"),
                                        ],
                                      )),
                                      SizedBox(height: 10),
                                      SizedBox(child: Text("2D")),
                                      SizedBox(height: 40),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // height: MediaQuery.of(context).size.height / 16,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // backgroundColor: ColorsApp.greenApp,
                                            primary: ColorsApp.greenApp,
                                          ),
                                          onPressed: () {},
                                          child: Text("PLAYING AT"),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // backgroundColor: ColorsApp.greenApp,
                                            primary: ColorsApp.greenApp,
                                          ),
                                          onPressed: () {},
                                          child: Text("BUY TICKET"),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // backgroundColor: ColorsApp.greenApp,
                                            primary: ColorsApp.greenApp,
                                          ),
                                          onPressed: () {},
                                          child: Text("TRAILER"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.all(12),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (!isReadSynopsis)
                                  ? RichText(
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                        text: detailResult.overview,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        text: detailResult.overview,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                              TextButton(
                                onPressed: () {
                                  print("sinopsis klik");

                                  setState(() {
                                    if (isReadSynopsis == true) {
                                      isReadSynopsis = false;
                                    } else {
                                      isReadSynopsis = true;
                                    }
                                  });
                                },
                                child: Text(
                                    (isReadSynopsis) ? "HIDE" : "READ SYNOPSIS",
                                    style: TextStyleApp.titleTextGreen),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            ListTile(
                              title: Text("Producer :"),
                              subtitle: Text(controller
                                  .findProducerName(creditResult.crew)),
                            ),
                            ListTile(
                              title: Text("Writer :"),
                              subtitle: Text(
                                  controller.findCrewName(creditResult.crew)),
                            ),
                            ListTile(
                              title: Text("Cast :"),
                              subtitle: Text(controller
                                  .findAllCastName(creditResult.cast)
                                  .toString()),
                            ),
                            ListTile(
                              title: Text("Distributor :"),
                              subtitle: Text(controller
                                  .findProductionCompany(
                                      detailResult.production_companies)
                                  .toString()),
                            ),
                            ListTile(
                              title: Text("Website :"),
                              subtitle: Text(controller
                                  .findProductionCompany(
                                      detailResult.production_companies)
                                  .toString()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

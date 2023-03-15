import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/module/playing/bloc/playing_bloc.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:clone_mtix/shared/widget/cachedimage/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/constants/constants.dart';

class DetailPlayingScreen extends StatelessWidget {
  DetailPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayingBloc(),
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
            print(">>> state : $state");
            if (state is LoadingDetailNowPlayingMovie) {
              return Center(child: CircularProgressIndicator.adaptive());
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
                                "13+",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("tesss"),
                                Text("aaaaaaaaaa"),
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
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit",
                                )),
                            Flexible(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.blue,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(child: Text("130 menit")),
                                    SizedBox(height: 10),
                                    SizedBox(child: Text("2D")),
                                    SizedBox(height: 40),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
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
                                      width: MediaQuery.of(context).size.width,
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
                                      width: MediaQuery.of(context).size.width,
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
                        child: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: "tessss",
                            // text: result?.overview ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 35),
                      Container(
                        margin: EdgeInsets.all(12),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              "Producer :",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

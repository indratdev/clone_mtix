import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/movie/movie_model.dart';
import '../../../module/playing/bloc/playing_bloc.dart';
import '../../../module/playing/view/detail_playing_screen.dart';
import '../../utils/colors/colors_app.dart';
import '../../utils/text_style/text_style_app.dart';

class ListMovieWidget extends StatelessWidget {
  bool isUpcoming;

  ListMovieWidget({
    Key? key,
    required this.data,
    this.isUpcoming = false,
  }) : super(key: key);

  final MovieModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.backgroundDashboardColor,
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20),
          itemCount: data.results.length,
          itemBuilder: (BuildContext ctx, index) {
            var item = data.results;
            return InkWell(
              onTap: () {
                print(">>> tap : Movie_id : ${item[index].id}");

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (newContext) => BlocProvider.value(
                    value: BlocProvider.of<PlayingBloc>(context)
                      ..add(GetDetailNowPlayingEvent(idMovie: item[index].id)),
                    child: DetailPlayingScreen(isUpcoming: isUpcoming),
                  ),
                ));
              },
              child: Material(
                elevation: 10,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: CachedNetworkImage(
                            imageUrl:
                                // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit', // dummy
                                'https://image.tmdb.org/t/p/w500${item[index].poster_path}',
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text(
                          item[index].title,
                          style: TextStyleApp.titleText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "2D",
                              style: TextStyleApp.titleTextGreen,
                            ),
                            Text(
                              "R13+",
                              style: TextStyleApp.titleTextGreen,
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "* Advance Ticket Sales",
                            style: TextStyleApp.infoWarningText,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

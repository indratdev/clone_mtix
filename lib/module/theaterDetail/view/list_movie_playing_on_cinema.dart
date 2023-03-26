import 'package:flutter/material.dart';

import '../controller/theater_detail_controller.dart';

class ListMoviePlayingOnCinema extends StatefulWidget {
  bool datePlusOne;

  ListMoviePlayingOnCinema({
    Key? key,
    this.datePlusOne = false,
  }) : super(key: key);

  @override
  State<ListMoviePlayingOnCinema> createState() =>
      _ListMoviePlayingOnCinemaState();
}

class _ListMoviePlayingOnCinemaState extends State<ListMoviePlayingOnCinema> {
  final TheaterDetailController controller = TheaterDetailController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                (widget.datePlusOne)
                    ? controller.getDateTime(1)
                    : controller.getDateTime(0),
              ),
              const Text("Rp. 30000"),
            ],
          ),
          SizedBox(
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.movieShowTime.length,
                itemBuilder: (context, index) {
                  var data = controller.movieShowTime[index];
                  return Container(
                      margin: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.blueAccent,
                      )),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          data.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

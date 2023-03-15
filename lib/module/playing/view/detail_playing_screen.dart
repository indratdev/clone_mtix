import 'package:clone_mtix/model/movie/movie_model.dart';
import 'package:clone_mtix/shared/utils/colors/colors_app.dart';
import 'package:clone_mtix/shared/widget/cachedimage/cached_image_widget.dart';
import 'package:flutter/material.dart';

import '../../../shared/utils/constants/constants.dart';

class DetailPlayingScreen extends StatelessWidget {
  Results? result;

  DetailPlayingScreen({
    super.key,
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    print(">>> hasil : ${result!.poster_path}");
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          xxiLogo,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 7,
        ),
        centerTitle: true,
      ),
      body: Container(
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
                        Text(result?.title.toString() ?? ""),
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
                        child:
                            CachedImageWidget(imageUrl: result!.poster_path)),
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
                                  backgroundColor: ColorsApp.greenApp,
                                ),
                                onPressed: () {},
                                child: Text("PLAYING AT"),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp.greenApp,
                                ),
                                onPressed: () {},
                                child: Text("BUY TICKET"),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorsApp.greenApp,
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
                    text: result?.overview ?? "",
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
      ),
    );
  }
}

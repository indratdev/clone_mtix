import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../dashboard/view/dashboard_screen.dart';

class PlayingScreen extends StatelessWidget {
  const PlayingScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

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
                            backgroundColor: Colors.white,
                            foregroundColor: ColorsApp.greenApp,
                            elevation: 0,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.ticket),
                          label: Text("E-Voucher"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: ColorsApp.greenApp,
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
              items: controller.getBannerMovie.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(color: Colors.blue),
                      child: CachedNetworkImage(
                        imageUrl: i,
                        imageBuilder: (context, imageProvider) => Container(
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
          Container(
            color: ColorsApp.backgroundDashboardColor,
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20),
                itemCount: myProducts.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Material(
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
                                    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit', // dummy
                                imageBuilder: (context, imageProvider) =>
                                    Container(
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
                              "shazam fury of the gods",
                              style: TextStyleApp.titleText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
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
                  );
                }),
          ),
        ],
      ),
    );
  }
}

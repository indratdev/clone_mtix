import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/colors/colors_app.dart';
import '../../../shared/utils/text_style/text_style_app.dart';
import '../bloc/mfood_bloc.dart';
import '../controller/mfood_controller.dart';

class MfoodListOrderWidget extends StatefulWidget {
  ListGroupFood groupFood;
  List<Map<int, dynamic>> listFood;

  MfoodListOrderWidget(
      {Key? key, required this.groupFood, required this.listFood})
      : super(key: key);

  // final MfoodController controller;

  @override
  State<MfoodListOrderWidget> createState() => _MfoodListOrderWidgetState();
}

class _MfoodListOrderWidgetState extends State<MfoodListOrderWidget> {
  final MfoodController controller = MfoodController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<MfoodBloc>(context).add(
          GetTheaterFoodEvent(
            location: "jakarta",
            isSearch: false,
          ),
        );
        return true;
      },
      child: Expanded(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 21,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.listFood.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> data = controller.listFood[index];

                  return InkWell(
                    onTap: () {
                      BlocProvider.of<MfoodBloc>(context).add(
                          SelectedGroupFoodEvent(
                              listGroupFood: data.values.first));
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: (widget.groupFood == data.values.first)
                            ? const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 3.0,
                                    color: ColorsApp.greenApp,
                                  ),
                                ),
                                color: Colors.white,
                              )
                            : null,
                        child: Text(
                          data.entries.first.key.toString(),
                          style: TextStyleApp.titleTextGreen,
                        )),
                  );
                },
              ),
            ),
            Expanded(
                child: Container(
              color: ColorsApp.backgroundDashboardColor,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listFood.length,
                itemBuilder: (context, index) {
                  // var data = widget.controller.listFoodPromo[index].entries.first;
                  var data = widget.listFood[index].entries.first;

                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 4,
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width / 2.8,
                            height: MediaQuery.of(context).size.height / 4.5,
                            child: Image.asset(
                              data.value["image"],
                              fit: BoxFit.cover,
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text(data.value["name"],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Text(
                                        "Rp. ${data.value["amount"]}",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(data.value["detail"]),
                                const SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.av_timer,
                                        size:
                                            MediaQuery.of(context).size.height /
                                                45),
                                    Text(
                                        "${"Estimated ${data.value["timeServe"]}"} minutes")
                                  ],
                                ),
                                const Divider()
                              ],
                            ),
                            // Text("Ramadan")
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}

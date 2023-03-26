import 'package:clone_mtix/module/mfood/bloc/mfood_bloc.dart';
import 'package:clone_mtix/module/mfood/controller/mfood_controller.dart';
import 'package:clone_mtix/module/mfood/view/mfood_list_order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/utils/constants/constants.dart';
import '../../theater/model/theater_model.dart';

class MfoodOrderScreen extends StatefulWidget {
  TheaterModel? data;

  MfoodOrderScreen({
    Key? key,
    this.data,
    // this.selectedGroupFood = ListGroupFood.promo,
  }) : super(key: key);

  @override
  State<MfoodOrderScreen> createState() => _MfoodOrderScreenState();
}

class _MfoodOrderScreenState extends State<MfoodOrderScreen> {
  final MfoodController controller = MfoodController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          xxiLogo,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 7,
        ),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<MfoodBloc>(context).add(
                  GetTheaterFoodEvent(
                    location: "jakarta",
                    isSearch: false,
                  ),
                );
              },
              icon: const FaIcon(FontAwesomeIcons.rotate))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(xxicafe),
                  fit: BoxFit.cover,
                  opacity: 1,
                  colorFilter: ColorFilter.mode(
                    Colors.grey,
                    BlendMode.modulate,
                  )),
            ),
            height: MediaQuery.of(context).size.height / 7,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.data?.name.toString() ?? "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Opening Hours : 11.30 - 21.25",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Location",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MfoodBloc, MfoodState>(
            builder: (context, state) {
              if (state is LoadingSelectGroupFood) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
              if (state is FailureSelectGroupFood) {
                return Center(child: Text(state.info.toString()));
              }
              if (state is SuccessSelectGroupFood) {
                ListGroupFood groupFood = state.groupFood;
                List<Map<int, dynamic>> listFood = state.listFood;

                return MfoodListOrderWidget(
                  groupFood: groupFood,
                  listFood: listFood,
                );
              }
              return MfoodListOrderWidget(
                groupFood: ListGroupFood.promo,
                listFood: controller.listFoodPromo,
              );
            },
          )
        ],
      ),
    );
  }
}

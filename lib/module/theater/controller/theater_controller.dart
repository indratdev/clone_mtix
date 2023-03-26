import 'package:clone_mtix/module/theater/model/theater_model.dart';

enum TheaterOption {
  cinemaxxi,
  premiere,
  imax,
}

class TheaterController {
  // Future<List<TheaterModel>> get getAllTheater => await allTheater ?? [];
  List<TheaterModel> getAllTheater() {
    return allTheater;
  }

  List<TheaterModel> getTheaterByCinema(TheaterOption cinema) {
    List<TheaterModel> datas;

    datas = allTheater
        .where((element) => element.cinema
            .toLowerCase()
            .contains(cinema.name.toLowerCase().toString()))
        .toList();
    return datas;
  }

  List<TheaterModel> getTheaterByCinemaAndLocation(
      TheaterOption cinema, String location) {
    List<TheaterModel> datas;

    datas = allTheater
        .where((element) => element.cinema
            .toLowerCase()
            .contains(cinema.name.toLowerCase().toString()))
        .toList()
        .where((element) =>
            element.location.toLowerCase().contains(location.toLowerCase()))
        .toList();
    return datas;
  }

  List<TheaterModel> getTheaterByLocation(String location) {
    List<TheaterModel> datas;

    datas = allTheater
        .where((element) =>
            element.location.toLowerCase().contains(location.toLowerCase()))
        .toList();
    return datas;
  }
}

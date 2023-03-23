import 'package:clone_mtix/module/theater/controller/theater_controller.dart';

import '../../theater/model/theater_model.dart';

class TheaterLocationController extends TheaterController {
  List<String> sortList(List<String> list) {
    List<String> sortedList = List.from(list);
    sortedList.sort();
    return sortedList;
  }

  List<String> getAllLocationTheater() {
    var seen = Set<String>();
    List<String> listLocation = [];

    allTheater.forEach(
      (element) {
        var data = seen.add(element.location);
        if (data) {
          listLocation.add(element.location);
        }
      },
    );

    return sortList(listLocation);
  }
}

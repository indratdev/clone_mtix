import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:clone_mtix/shared/utils/datetime/date_time_app.dart';

import '../../../shared/utils/constants/constants.dart';

class TheaterDetailController extends TheaterController {
  String getLogoTheater(String theaterName) {
    String imageName = "";

    if (theaterName.toLowerCase() == TheaterOption.cinemaxxi.name.toString()) {
      imageName = xxiLogo;
    } else if (theaterName.toLowerCase() ==
        TheaterOption.imax.name.toString()) {
      imageName = imaxLogo;
    } else if (theaterName.toLowerCase() ==
        TheaterOption.premiere.name.toString()) {
      imageName = premiereLogo;
    }

    return imageName;
  }

  String getDateTime(int plus) {
    return DateTimeApp().getDateTimeNow(plus);
  }

  List<String> movieShowTime = [
    "10:00",
    "13:00",
    "15:45",
    "18:30",
    "21:15",
  ];
}

import 'dart:math';

class MathCustom {
  int getRandomNumber(int maxNumber) {
    Random random = Random();

    return random.nextInt(maxNumber); // from 0 u
  }
}

import 'dart:math';

class CreateObjectUtils {
  static final random = Random();

  static int createIdRandom() {
    return random.nextInt(100000);
  }
}

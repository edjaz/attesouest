import 'package:attestation/model/settings.dart';

class FemaleUtils {
  static String toFemal(Civility civility, String string) {
    if (civility == Civility.Mme) return string + 'e';
    return string;
  }
}

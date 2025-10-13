import 'dart:math';

extension DegreeExtension on num {
  double get toRadians => this * (pi / 180.0);
}

extension RadianExtension on num {
  double get toDegrees => this * (180.0 / pi);
}
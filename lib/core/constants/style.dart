import 'package:flutter/material.dart';

abstract final class AppEmptySpace {
  static const Spacer space = Spacer();

  static const SizedBox verticalSmall = SizedBox(
    height: 4,
  );
  static const SizedBox verticalNormal = SizedBox(
    height: 8,
  );
  static const SizedBox verticalLarge = SizedBox(
    height: 12,
  );
  static const SizedBox verticalXl = SizedBox(
    height: 16,
  );
  static const SizedBox horizontalSmall = SizedBox(
    width: 4,
  );
  static const SizedBox horizontalNormal = SizedBox(
    width: 8,
  );
  static const SizedBox horizontalLarge = SizedBox(
    width: 12,
  );
  static const SizedBox horizontalXl = SizedBox(
    width: 16,
  );
}

abstract final class AppPadding {
  static const double small = 4;
  static const double normal = 8;
  static const double large = 12;
  static const double xl = 16;
}

abstract final class AppRadius {
  static const double small = 4;
  static const double normal = 8;
  static const double large = 12;
  static const double xl = 16;
}

abstract final class AppColors {
  static const Color orange = Color.fromARGB(255, 229, 110, 30);
  static const Color orangeGradiant1 = Color.fromARGB(255, 235, 140, 77);
  static const Color orangeGradiant2 = Color.fromARGB(255, 255, 237, 202);
  static const Color orangeGradiant3 = Color.fromARGB(255, 255, 241, 236);

  static const Color scaffoldBackgroundColor =
      Color.fromARGB(255, 247, 247, 247);

  static const Color black = Colors.black;
  static const Color text3 = Color.fromARGB(255, 136, 132, 132);

  static const Color white = Colors.white;
  static const Color gray = Color.fromARGB(255, 238, 233, 233);

  static const Color error = Colors.redAccent;
  static const Color transparent = Colors.transparent;
}

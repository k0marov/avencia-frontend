part of 'theme.dart';

abstract class Gradients {
  static const avenciaHorizontal = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.gradientPink,
      AppColors.gradientPurple,
    ],
  );
  static const avenciaDiagonal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.gradientPink,
      AppColors.gradientPurple,
    ],
  );
}

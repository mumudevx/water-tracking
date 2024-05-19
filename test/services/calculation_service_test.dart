import 'package:flutter_test/flutter_test.dart';
import 'package:water_tracking/services/calculation_service.dart';
import 'package:water_tracking/enums/activity_level.dart';
import 'package:water_tracking/enums/gender.dart';
import 'package:water_tracking/enums/liquid_unit.dart';
import 'package:water_tracking/enums/weather.dart';

void main() {
  final calculator = WaterIntakeCalculator();

  test(
      'calculateIdealWaterIntake for male, normal weight, age, weather, and activity level',
      () {
    final intake = calculator.calculateIdealWaterIntake(
      Gender.male,
      70,
      30,
      Weather.standard,
      ActivityLevel.sedentary,
      LiquidUnit.milliliter,
    );
    expect(intake, 2573);
  });

  test(
      'calculateIdealWaterIntake for male, 85 weight, 25 age, hot weather, and moderate activity level',
      () {
    final intake = calculator.calculateIdealWaterIntake(
      Gender.male,
      85,
      25,
      Weather.hot,
      ActivityLevel.moderately,
      LiquidUnit.milliliter,
    );
    expect(intake, 3780);
  });
}

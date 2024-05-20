import 'package:flutter_test/flutter_test.dart';
import 'package:water_tracking/models/person.dart';
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
    final person = Person(
      gender: Gender.male,
      weight: 70,
      age: 30,
      activityLevel: ActivityLevel.sedentary,
      liquidUnit: LiquidUnit.milliliter,
    );

    final intake = calculator.calculateIdealWaterIntake(
      person: person,
      weather: Weather.standard,
    );

    expect(intake, 2573);
  });

  test(
      'calculateIdealWaterIntake for male, 85 weight, 25 age, hot weather, and moderate activity level',
      () {
    final person = Person(
      gender: Gender.male,
      weight: 85,
      age: 25,
      activityLevel: ActivityLevel.moderately,
      liquidUnit: LiquidUnit.milliliter,
    );

    final intake = calculator.calculateIdealWaterIntake(
      person: person,
      weather: Weather.hot,
    );

    expect(intake, 3780);
  });
}

import 'package:water_tracking/enums/activity_level.dart';
import 'package:water_tracking/enums/gender.dart';
import 'package:water_tracking/enums/liquid_unit.dart';
import 'package:water_tracking/enums/weather.dart';
import 'package:water_tracking/utils/converter.dart';

class WaterIntakeCalculator {
  int calculateIdealWaterIntake(
    Gender gender,
    double weightInKilograms,
    int age,
    Weather weather,
    ActivityLevel activityLevel,
    LiquidUnit liquidUnit,
  ) {
    double calculatedIntake = (_weightFactor(weightInKilograms) *
        (1 + _genderFactor(gender)) *
        (1 + _activityLevelFactor(activityLevel)) *
        (1 + _weatherFactor(weather)) *
        (1 + _ageFactor(age)).round());

    int waterGoal = calculatedIntake.round();

    return switch (liquidUnit) {
      LiquidUnit.liter => mlToL(waterGoal),
      LiquidUnit.milliliter => waterGoal,
      LiquidUnit.ounce => mlToOunces(waterGoal),
      LiquidUnit.cup => mlToCups(waterGoal)
    };
  }

  double _weightFactor(double weightInKilograms) => weightInKilograms * 35;

  double _genderFactor(Gender gender) => gender == Gender.male ? 0.05 : 0;

  double _ageFactor(int age) => age <= 30 ? 0.1 : -0.1;

  double _weatherFactor(Weather weather) => weather == Weather.hot ? 0.1 : 0;

  double _activityLevelFactor(ActivityLevel activityLevel) =>
      switch (activityLevel) {
        ActivityLevel.sedentary => 0,
        ActivityLevel.moderately => 0.1,
        ActivityLevel.veryActive => 0.2
      };
}

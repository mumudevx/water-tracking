// water_goal_event.dart
import 'package:water_tracking/enums/weather.dart';
import 'package:water_tracking/models/person.dart';

abstract class WaterGoalEvent {}

class CalculateWaterGoalEvent extends WaterGoalEvent {
  final Person person;
  final Weather weather;

  CalculateWaterGoalEvent({
    required this.person,
    required this.weather,
  });
}

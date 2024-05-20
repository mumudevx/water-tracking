// water_goal_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/blocs/water_goal/water_goal_event.dart';
import 'package:water_tracking/blocs/water_goal/water_goal_state.dart';
import 'package:water_tracking/services/calculation_service.dart';

class WaterGoalBloc extends Bloc<WaterGoalEvent, WaterGoalState> {
  WaterGoalBloc() : super(WaterGoalState(waterGoal: 0)) {
    on<CalculateWaterGoalEvent>((event, emit) async {
      final int waterGoal = WaterIntakeCalculator().calculateIdealWaterIntake(
        person: event.person,
        weather: event.weather,
      );

      emit(WaterGoalState(waterGoal: waterGoal));
    });
  }
}

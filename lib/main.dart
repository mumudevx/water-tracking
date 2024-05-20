import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/blocs/water_goal/water_goal_bloc.dart';
import 'package:water_tracking/blocs/water_goal/water_goal_event.dart';
import 'package:water_tracking/blocs/water_goal/water_goal_state.dart';
import 'package:water_tracking/enums/activity_level.dart';
import 'package:water_tracking/enums/gender.dart';
import 'package:water_tracking/enums/liquid_unit.dart';
import 'package:water_tracking/enums/weather.dart';
import 'package:water_tracking/models/person.dart';

Future<void> main() async {
  final person = Person(
    gender: Gender.male,
    weight: 70,
    age: 30,
    activityLevel: ActivityLevel.moderately,
    liquidUnit: LiquidUnit.milliliter,
  );

  final waterGoalBloc = WaterGoalBloc();

  waterGoalBloc.add(CalculateWaterGoalEvent(
    person: person,
    weather: Weather.hot,
  ));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WaterGoalBloc>(
          create: (context) => waterGoalBloc,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empty Screen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty Screen App'),
      ),
      body: BlocBuilder<WaterGoalBloc, WaterGoalState>(
        builder: (context, state) {
          return Center(
            child: Text(
              'Your water goal is: ${state.waterGoal} ml',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}

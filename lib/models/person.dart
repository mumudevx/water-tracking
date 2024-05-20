import 'dart:convert';
import 'package:water_tracking/enums/activity_level.dart';
import 'package:water_tracking/enums/gender.dart';
import 'package:water_tracking/enums/liquid_unit.dart';

class Person {
  final Gender gender;
  final double weight;
  final int age;
  final ActivityLevel activityLevel;
  final LiquidUnit liquidUnit;

  Person({
    required this.gender,
    required this.weight,
    required this.age,
    required this.activityLevel,
    required this.liquidUnit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gender': gender,
      'weight': weight,
      'age': age,
      'activityLevel': activityLevel,
      'liquidUnit': liquidUnit,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      gender: map['gender'] as Gender,
      weight: map['weight'] as double,
      age: map['age'] as int,
      activityLevel: map['activityLevel'] as ActivityLevel,
      liquidUnit: map['liquidUnit'] as LiquidUnit,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}

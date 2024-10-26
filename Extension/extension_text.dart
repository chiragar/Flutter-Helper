import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "100.00",
            style: context.bodyMedium?.onPrimary(context).bold,
          ),
          10.h,
          Text("flutter".capitalize),
          Text(
              "Email Is Valid :  ${"example@gmail.com".isValidEmail().toString()}"),
          Text(11.ordinal),
          Text("Is Even : " + 10.isEven.toString()),
          Text("Round to decimal : ${3.14159.roundTo(2)}"),
          Text("Percentage : ${0.875.toPercentage()}"),
          Text("List Of Sum : ${[1, 2, 3, 4, 5].addition}"),
          Text("List Of Average : ${[1, 2, 3, 4, 5].average}"),
          Text("Day-Month-Year Format: ${DateTime.now().formatted}"),
          Text("Today Date or not : ${DateTime(2024, 10, 2).isToday}")
        ],
      )),
    );
  }
}

extension TextStyleHelper on BuildContext {
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
}

extension TextStyleColorMapping on TextStyle {
  TextStyle onPrimary(BuildContext context) {
    return copyWith(color: Theme.of(context).colorScheme.primary);
  }

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}

extension SizedBoxExtension on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension StringExtension on String {
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(this);
  }
}

extension IntExtension on int {
  String get ordinal {
    if (this >= 11 && this <= 13) {
      return '${this}th';
    }
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}

extension EvenOddChecker on int {
  bool get isEven => this % 2 == 0;
  bool get isOdd => !isEven;
}

extension DoubleExtension on double {
  double roundTo(int places) {
    final mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}

extension PercentageExtension on double {
  String toPercentage({int decimalPlaces = 1}) {
    return '${(this * 100).toStringAsFixed(decimalPlaces)}%';
  }
}

extension ListSumExtension on List {
  int get addition => fold(0, (acc, val) => val + acc);
}

extension ListAverageExtension on List {
  double get average => isEmpty ? 0.0 : sums / length;
  double get sums => fold(0.0, (acc, val) => acc + val);
}

extension DateTimeExtension on DateTime {
  String get formatted => '$day-$month-$year';
}

extension DateTimeTodayExtension on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}

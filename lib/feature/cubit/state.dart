import 'package:flutter/material.dart';

class AppState {
  final String text;
  final Color color;
  final int count;

  const AppState({
    required this.text,
    required this.color,
    required this.count,
  });

  AppState change({
    String? text,
    Color? color,
    int? count,
  }) {
    return AppState(
      text: text ?? this.text,
      color: color ?? this.color,
      count: count ?? this.count,
    );
  }
}

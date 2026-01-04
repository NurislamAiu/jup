import 'package:flutter/material.dart';

class Package {
  final String title;
  final String description;
  final Color startColor;
  final Color endColor;
  // Можно добавить другие поля, если потребуется

  const Package({
    required this.title,
    required this.description,
    required this.startColor,
    required this.endColor,
  });

  // Добавим метод для копирования, если потребуется
  Package copyWith({
    String? title,
    String? description,
    Color? startColor,
    Color? endColor,
  }) {
    return Package(
      title: title ?? this.title,
      description: description ?? this.description,
      startColor: startColor ?? this.startColor,
      endColor: endColor ?? this.endColor,
    );
  }
}

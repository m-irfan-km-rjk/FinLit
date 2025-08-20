import 'package:flutter/material.dart';

class FIconTheme extends ThemeExtension<FIconTheme> {
  final Color? backgroundColor;
  final Color? iconColor;

  const FIconTheme({
    this.backgroundColor,
    this.iconColor,
  });

  @override
  FIconTheme copyWith({Color? backgroundColor, Color? iconColor}) {
    return FIconTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  @override
  FIconTheme lerp(ThemeExtension<FIconTheme>? other, double t) {
    if (other is! FIconTheme) return this;
    return FIconTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
    );
  }
}
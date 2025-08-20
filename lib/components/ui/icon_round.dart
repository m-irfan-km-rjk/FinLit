import 'package:flutter/material.dart';
import '../themes/ficon_extension.dart';

class FIcon extends StatelessWidget {
  final IconData fIcon;

  const FIcon({super.key, required this.fIcon});

  @override
  Widget build(BuildContext context) {
    final fIconTheme = Theme.of(context).extension<FIconTheme>();

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: fIconTheme?.backgroundColor ?? Colors.grey.shade300,
      ),
      child: Center(
        child: Icon(
          fIcon,
          color: fIconTheme?.iconColor,
          size: 30,
        ),
      ),
    );
  }
}
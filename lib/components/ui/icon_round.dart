import 'package:flutter/material.dart';

class FIcon extends StatefulWidget {
  Icon fIcon;
  VoidCallback onPressed;

  FIcon({
    super.key,
    required this.fIcon,
    required this.onPressed,
  });

  @override
  State<FIcon> createState() => _FIconState();
}

class _FIconState extends State<FIcon> {

  @override
  Widget build(BuildContext context) {

    final buttonStyle = Theme.of(context).elevatedButtonTheme.style;

    return Container(
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration( // same bg as ElevatedButton
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: widget.fIcon, // your icon
    );
  }
}

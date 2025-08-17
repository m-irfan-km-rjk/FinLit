import 'package:flutter/material.dart';

class FButton extends StatefulWidget {
  Icon fIcon;
  VoidCallback onPressed;

  FButton({
    super.key,
    required this.fIcon,
    required this.onPressed,
  });

  @override
  State<FButton> createState() => _FButtonState();
}

class _FButtonState extends State<FButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(60, 60),   // width, height
        padding: const EdgeInsets.all(10), // inner padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // rounded corners
        ),
      ).merge(Theme.of(context).elevatedButtonTheme.style),
      child: widget.fIcon,
    );
  }
}

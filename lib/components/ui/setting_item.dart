import 'package:flutter/material.dart';

import 'icon_button.dart';

class SettingItem extends StatefulWidget {

  final Icon fIcon;
  final String fText;
  final Widget fWidget;

  const SettingItem({
    super.key,
    required this.fIcon,
    required this.fText,
    required this.fWidget
  });

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FButton(fIcon: widget.fIcon,onPressed: () {}),
        Text(
          widget.fText,
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
        ),
        widget.fWidget
      ],
    );
  }
}

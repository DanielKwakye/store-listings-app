import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';

class GlobalActiveMenuButton extends StatelessWidget {

  final String label;
  final Function()? onPressed;
  const GlobalActiveMenuButton({required this.label, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);

    return Container(
      decoration: BoxDecoration(
          color: kAppRed,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: kAppWhite),),
        ),
        onPressed: () => onPressed?.call(),
      ),
    );
  }
}


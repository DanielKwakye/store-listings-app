import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/functions.dart';

class GlobalInActiveMenuButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const GlobalInActiveMenuButton({required this.label, this.onPressed,  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme  = themeOf(context);
    return TextButton(
      child: Text(label, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
      onPressed: () => onPressed?.call(),
    );
  }
}

import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final Icon? icon;
  final ButtonType type;
  final VoidCallback onPressed;

  const BlaButton({
    super.key,
    required this.text,
    this.icon,
    required bool isPrimary,
    required this.onPressed,
  }) : type = isPrimary ? ButtonType.primary : ButtonType.secondary;

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == ButtonType.primary;

    final Color backgroundColor = isPrimary
        ? BlaColors.primary
        : BlaColors.white;

    final Color contentColor = isPrimary ? Colors.white : BlaColors.primary;

    return  GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
            border: isPrimary ? null : Border.all(color: BlaColors.greyLight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                IconTheme(
                  data: IconThemeData(color: contentColor),
                  child: icon!,
                ),
                const SizedBox(width: 8),
              ],
              Text(text, style: TextStyle(color: contentColor)),
            ],
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

class RideprefField extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;

  const RideprefField({
    super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric( horizontal: 18),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: BlaColors.greyLight, // line color
              width: 1, // line thickness
            ),
          )
        ),
        child: Row(
          children: [
            Icon(icon, color: BlaColors.greyLight),
            const SizedBox(width: 12),
            Expanded(child: Text(label)),
            ?trailing,
          ],
        ),
      ),
    );
  }
}


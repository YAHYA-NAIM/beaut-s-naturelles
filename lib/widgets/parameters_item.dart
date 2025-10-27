import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ParametersItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isDarkMode;

  const ParametersItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.white : AppColors.textDark;
    final iconColor = isDarkMode ? Colors.white : AppColors.iconColor;
    final arrowColor = isDarkMode
        ? Colors.white.withOpacity(0.7)
        : AppColors.iconColor.withOpacity(0.5);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  color: arrowColor,
                  size: 16,
                ),
          ],
        ),
      ),
    );
  }
}
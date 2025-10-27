import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/user_profile.dart';
import '../constants/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;
  final bool isDarkMode;

  const ProfileCard({
    super.key,
    required this.profile,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cardBg = isDarkMode ? Colors.grey[800]! : AppColors.primaryBackground;
    final textColor = isDarkMode ? Colors.white : AppColors.textDark;
    final ageColor = isDarkMode ? Colors.grey[400]! : AppColors.textBody;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black54 : Colors.grey,
            blurRadius: 7,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundImage: NetworkImage(profile.imageUrl),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: TextStyle(
                  fontFamily: 'Itim',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              Text(
                '${profile.age} ${l10n.years}',
                style: TextStyle(
                  fontFamily: 'Itim',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: ageColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../presenters/parameters_presenter.dart';
import '../widgets/Parameters_item.dart';
import '../widgets/profile_card.dart';
import '../constants/app_colors.dart';
import '../constants/app_icons.dart';
import '../l10n/app_localizations.dart';

class AppDrawer extends StatefulWidget {
  final UserProfile profile;
  final ParametersPresenter presenter;

  const AppDrawer({
    super.key,
    required this.profile,
    required this.presenter,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    widget.presenter.loadDarkMode().then((value) {
      if (mounted) {
        setState(() {
          _isDarkMode = value;
        });
      }
    });
  }

  void _onDarkModeChanged(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    widget.presenter.toggleDarkMode(value);
  }

  Color _cardBackgroundColor() => _isDarkMode ? Colors.grey[800]! : AppColors.primaryBackground;
  Color _dividerColor() => _isDarkMode ? Colors.grey[800]! : Colors.white;
  Color _textColor() => _isDarkMode ? Colors.white : AppColors.textDark;
  Color _iconColor() => _isDarkMode ? Colors.white : AppColors.iconColor;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final drawerBgColor = _isDarkMode ? Colors.black : Colors.white;

    return Drawer(
      child: Container(
        color: drawerBgColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: _cardBackgroundColor(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      child: Image.asset('assets/logo.png'),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      l10n.menu,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _textColor(),
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(AppIcons.bell, color: _iconColor(), size: 28),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.notificationDot,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  ProfileCard(profile: widget.profile, isDarkMode: _isDarkMode),
                  const SizedBox(height: 5),
                  _buildParametesSection(l10n),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/vector.png',
                        width: 70,
                        height: 70,
                        color: _isDarkMode ? Colors.white : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParametesSection(AppLocalizations l10n) {
    return Column(
      children: [
        _buildParametesGroup([
          _ParametesItem(l10n.editProfile, AppIcons.edit),
          _divider(),
          _ParametesItem(l10n.shareApp, AppIcons.share),
        ]),
        const SizedBox(height: 6),
        _buildParametesGroup([
          _ParametesItem(l10n.pointsBadges, AppIcons.medal),
          _divider(),
          _ParametesItem(l10n.recommendations, AppIcons.chef),
          _divider(),
          _ParametesItem(l10n.favoriteRecipes, AppIcons.heart),
          _divider(),
          _ParametesItem(l10n.result, AppIcons.clipboard),
        ]),
        const SizedBox(height: 6),
        _buildParametesGroup([
          _ParametesItem(l10n.language, AppIcons.globe),
          _divider(),
          _ParametesItem(l10n.darkMode, AppIcons.sun, isDarkModeToggle: true),
          _divider(),
          _ParametesItem(l10n.notifications, AppIcons.bell),
        ]),
        const SizedBox(height: 6),
        _buildParametesGroup([
          _ParametesItem(l10n.logout, AppIcons.logout),
        ])
      ],
    );
  }

  Widget _buildParametesGroup(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: _cardBackgroundColor(),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _isDarkMode ? Colors.black54 : Colors.grey,
            blurRadius: 7,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 1,
      color: _dividerColor(),
    );
  }

  Widget _ParametesItem(String title, IconData icon, {bool isDarkModeToggle = false}) {
    if (isDarkModeToggle) {
      return ParametersItem(
        title: title,
        icon: icon,
        isDarkMode: _isDarkMode,
        trailing: SizedBox(
          width: 48,
          height: 24,
          child: Transform.scale(
            scale: 0.75,
            child: Switch(
              value: _isDarkMode,
              onChanged: _onDarkModeChanged,
              activeColor: _isDarkMode ? Colors.white : AppColors.textDark,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      );
    }
    return ParametersItem(
      title: title,
      icon: icon,
      isDarkMode: _isDarkMode,
      onTap: () {
        Navigator.of(context).pop();
        widget.presenter.onMenuItemTap(title);
      },
    );
  }
}
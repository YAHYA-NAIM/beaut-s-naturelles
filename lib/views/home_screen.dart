import 'package:beaute_naturelle/views/parameters_view.dart';
import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../presenters/parameters_presenter.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final profile = UserProfile(
      name: 'YAHYA',
      age: '23',
      imageUrl: 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1331',
    );
    final presenter = ParametersPresenter(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 0.85;

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Theme(
      data: Theme.of(context).copyWith(
        drawerTheme: DrawerThemeData(width: drawerWidth),
      ),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(l10n.appTitle),
        ),
        drawer: AppDrawer(profile: profile, presenter: presenter),
        body: Center(child: Text(l10n.mainContent)),
      ),
    );
  }
}
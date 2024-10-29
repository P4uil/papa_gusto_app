import 'package:flutter/material.dart';
import 'package:papa_gusto_app/components/my_drawer_title.dart';
import 'package:papa_gusto_app/pages/settings_page.dart';
import 'package:papa_gusto_app/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
              'lib/images/logo/logo.png',
              width: 100,
              height: 100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list title
          MyDrawerTile(
              text: 'ДОМОЙ',
              icon: Icons.home,
              onTap: () => Navigator.pop(context)),

          //settings list title
          MyDrawerTile(
              text: 'НАСТРОЙКИ',
              icon: Icons.settings,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()))),

          const Spacer(),

          //logout list title
          MyDrawerTile(
            text: 'ВЫХОД',
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserFavoritesPage extends StatelessWidget {
  const UserFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Placeholder(
          child: Text('Favorites'),
        ),
      ),
    );
  }
}

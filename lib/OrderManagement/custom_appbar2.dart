import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/app_styles.dart';

class AppBarToHome extends StatelessWidget {
  final String title;

  const AppBarToHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: AppStyles.colorScheme.primary,
      elevation: 1.5,
      shadowColor: AppStyles.colorScheme.tertiary.withOpacity(0.2),
      clipper: const ShapeBorderClipper(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      child: SizedBox(
        height: 75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/Main/left.png',
                  height: 40,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: AppStyles.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: AppStyles.colorScheme.primary,
      elevation: 1.5,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  'assets/WaterWaysIcon.png',
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppStyles.colorScheme.tertiary.withOpacity(0.15),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/Main/search2.png',
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

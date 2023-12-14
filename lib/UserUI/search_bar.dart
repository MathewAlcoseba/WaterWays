import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const CustomSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppStyles.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: AppStyles.colorScheme.inversePrimary.withOpacity(0.12),
            offset: const Offset(0.0, 2.0),
            blurRadius: 1.5,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: AppStyles.bodyText3,
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none),
                    // errorBorder: border,
                    // disabledBorder: border,
                    // focusedBorder: border,
                    // focusedErrorBorder: border,
                    hintStyle: AppStyles.bodyText2.copyWith(
                        color: AppStyles.colorScheme.tertiary,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/Main/search2.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

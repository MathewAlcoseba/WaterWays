import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppStyles.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: AppStyles.colorScheme.inversePrimary.withOpacity(0.051),
            offset: const Offset(0.0, 3.0),
            blurRadius: 24.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: AppStyles.bodyText2,
              controller: TextEditingController(),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  // errorBorder: border,
                  // disabledBorder: border,
                  // focusedBorder: border,
                  // focusedErrorBorder: border,
                  hintStyle: AppStyles.bodyText1
                      .copyWith(color: AppStyles.colorScheme.tertiary)),
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
    );
  }
}

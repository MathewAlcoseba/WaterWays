import 'package:flutter/material.dart';
import 'package:waterways/UserUI/stores_list_view.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/custom_appbar.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            backgroundColor: AppStyles.colorScheme.background,
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(75.0),
              child: CustomAppBar(title: '',),
            ),
            body: const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tag(),
                  SizedBox(
                    height: 16.0,
                  ),
                  AvailableStoresListView(),
                ],
              ),
            )));
  }
}

class Rating extends StatelessWidget {
  final int starCount;

  const Rating({
    Key? key,
    required this.starCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingIcon = List.generate(5, (index) {
      return Icon(
        index < starCount ? Icons.star : Icons.star_outline,
        color: const Color(0xffFEC600),
        size: 20.0,
      );
    });

    return SizedBox(child: Row(children: ratingIcon));
  }
}

class Tag extends StatelessWidget {
  const Tag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 120,
      decoration: BoxDecoration(
        color: AppStyles.colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: AppStyles.colorScheme.inversePrimary.withOpacity(0.20),
            offset: const Offset(0.0, 2.0),
            blurRadius: 2.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Location',
              style: AppStyles.bodyText3.copyWith(
                  color: AppStyles.colorScheme.secondary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Center(
              child: Icon(
                Icons.close_rounded,
                color: AppStyles.colorScheme.secondary,
              ),
            ),
            iconSize: 18,
          )
        ],
      ),
    );
  }
}

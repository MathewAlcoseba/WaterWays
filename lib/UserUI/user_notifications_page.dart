import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class UserNotificationsPage extends StatelessWidget {
  const UserNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppStyles.colorScheme.background,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
          title: Text(
            'Notification',
            style: AppStyles.headline2.copyWith(fontSize: 26),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal,
            ),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                decoration:
                    BoxDecoration(color: AppStyles.colorScheme.tertiary),
              );
            },
          ),
        ),
      ),
    );
  }
}

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
          backgroundColor: AppStyles.colorScheme.primary,
          surfaceTintColor: AppStyles.colorScheme.primary,
          toolbarHeight: 75,
          title: Text(
            'Notifications',
            style: AppStyles.headline2.copyWith(fontSize: 26),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text('About Us',
                      style: AppStyles.bodyText1
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 8,
                  ),
                  const NotificationsListView(),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Yesterday',
                      style: AppStyles.bodyText1
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 8,
                  ),
                  const NotificationsListView(),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Past Week',
                      style: AppStyles.bodyText1
                          .copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 8,
                  ),
                  const NotificationsListView(),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.normal,
      ),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
                height: 90,
                decoration:
                    BoxDecoration(color: AppStyles.colorScheme.background),
                child: Row(
                  children: [
                    Container(
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppStyles.colorScheme.secondary,
                          image: const DecorationImage(
                              image: AssetImage('assets/Main/boss-natski.jpg'),
                              fit: BoxFit.cover,
                              alignment: Alignment.center),
                        )),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  'Boss Natski',
                                  style: AppStyles.bodyText2
                                      .copyWith(fontWeight: FontWeight.w700),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  ' has ordered.',
                                  style: AppStyles.bodyText2,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          '9:20 am',
                          style: AppStyles.bodyText3,
                        ),
                      ],
                    )
                  ],
                )),
            Divider(indent: 75, color: Colors.grey.withOpacity(0.2))
          ],
        );
      },
    );
  }
}

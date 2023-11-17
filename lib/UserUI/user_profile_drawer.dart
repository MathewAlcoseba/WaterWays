import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class UserProfileDrawer extends StatelessWidget {
  const UserProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: AppStyles.colorScheme.secondary,
                image: const DecorationImage(
                  image: AssetImage('assets/Main/sample-profile-cover.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.85),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: AppStyles.colorScheme.primary,
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: AssetImage(
                                  'assets/Main/sample-profile.png',
                                ),
                              )),
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Boss AAh',
                                style: AppStyles.headline2.copyWith(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    color: AppStyles.colorScheme.primary),
                                overflow: TextOverflow.ellipsis),
                            Text('09950066821',
                                style: AppStyles.bodyText3.copyWith(
                                    color: AppStyles.colorScheme.primary)),
                            Text(
                              'bossaamigo@gmail.com',
                              style: AppStyles.bodyText3.copyWith(
                                  color: AppStyles.colorScheme.primary),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )),
          const EditProfile(),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: AppStyles.colorScheme.secondary,
            ),
            title: Text('Settings', style: AppStyles.bodyText2),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_support_outlined,
              color: AppStyles.colorScheme.secondary,
            ),
            title: Text('FAQs', style: AppStyles.bodyText2),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.support_agent_outlined,
              color: AppStyles.colorScheme.secondary,
            ),
            title: Text('Customer Support', style: AppStyles.bodyText2),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.read_more_outlined,
              color: AppStyles.colorScheme.secondary,
            ),
            title: Text('Terms & Conditions', style: AppStyles.bodyText2),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_rounded,
              color: AppStyles.colorScheme.secondary,
            ),
            title: Text('Logout', style: AppStyles.bodyText2),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: AppStyles.colorScheme.tertiary,
      collapsedIconColor: AppStyles.colorScheme.tertiary,
      onExpansionChanged: (bool expanded) {
        setState(() {
          isExpanded = expanded;
        });
      },
      title: Text(isExpanded ? 'Edit Profile' : 'Profile',
          style: isExpanded
              ? AppStyles.headline3.copyWith(fontSize: 20)
              : AppStyles.bodyText2),
      leading: isExpanded
          ? Icon(
              Icons.edit_outlined,
              color: AppStyles.colorScheme.secondary,
            )
          : Icon(Icons.account_circle_outlined,
              color: AppStyles.colorScheme.secondary),
      children: <Widget>[
        ListTile(
          title: Text(
            'Edit Username',
            style: AppStyles.bodyText2,
          ),
          subtitle: Text(
            'bossaamigo',
            style: AppStyles.bodyText3,
          ),
        ),
        ListTile(
          title: Text(
            'Edit Phone No.',
            style: AppStyles.bodyText2,
          ),
          subtitle: Text(
            '09950066821',
            style: AppStyles.bodyText3,
          ),
        ),
        ListTile(
          title: Text(
            'Edit Email',
            style: AppStyles.bodyText2,
          ),
          subtitle: Text(
            'bossaamigo@gmail.com',
            style: AppStyles.bodyText3,
          ),
        ),
        ListTile(
          title: Text(
            'Edit Address',
            style: AppStyles.bodyText2,
          ),
          subtitle: Text(
            '123 St., Capitol Site, Cebu City',
            style: AppStyles.bodyText3,
          ),
        ),
      ],
    );
  }
}

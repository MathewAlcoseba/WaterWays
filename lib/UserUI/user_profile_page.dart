import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppStyles.colorScheme.background,
        appBar: AppBar(
          toolbarHeight: 75,
          backgroundColor: AppStyles.colorScheme.primary,
          surfaceTintColor: AppStyles.colorScheme.primary,
          title: Text(
            'User Profile',
            style: AppStyles.headline2.copyWith(fontSize: 26),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/Main/sample-profile-cover.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, bottom: 8.0),
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppStyles.colorScheme.primary,
                                    width: 1.5,
                                    style: BorderStyle.solid,
                                  ),
                                  color: const Color(0xffeeeeee),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(4),
                                  icon: Icon(
                                    Icons.camera_alt_rounded,
                                    color: AppStyles.colorScheme.inversePrimary,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed!');
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Text('Boss AAh', style: AppStyles.headline2),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppStyles.colorScheme.inversePrimary,
                                size: 20,
                              ),
                              onPressed: () {
                                print('IconButton pressed!');
                              },
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Email',
                          style: AppStyles.bodyText2,
                        ),
                        subtitle: Text(
                          'bossaamigo@gmail.com',
                          style: AppStyles.bodyText3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppStyles.colorScheme.inversePrimary,
                            size: 16,
                          ),
                          onPressed: () {
                            print('IconButton pressed!');
                          },
                        ),
                      ),
                      buildListTile(
                        title: 'Phone',
                        subtitle: '09950066821',
                        onPressed: () {
                          showTextInputDialog(
                            context,
                            'Phone',
                            'Enter new phone number',
                            (value) {
                              // Handle the entered value
                              print('New phone number: $value');
                            },
                          );
                        },
                      ),
                      buildListTile(
                        title: 'Address',
                        subtitle: '123 St., Capitol Site, Cebu City',
                        onPressed: () {
                          showTextInputDialog(
                            context,
                            'Address',
                            'Enter new address',
                            (value) {
                              // Handle the entered value
                              print('New address: $value');
                            },
                          );
                        },
                      ),
                      ListTile(
                        title: Text(
                          'Change Password',
                          style: AppStyles.bodyText2,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppStyles.colorScheme.inversePrimary,
                            size: 16,
                          ),
                          onPressed: () {
                            print('IconButton pressed!');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showConfirmationDialog(context);
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            side: BorderSide(color: Colors.red)),
                        child: Text(
                          'Delete Account',
                          style:
                              AppStyles.bodyText1.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 75,
                    child: Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppStyles.colorScheme.primary,
                          width: 4.0,
                          style: BorderStyle.solid,
                        ),
                        color: AppStyles.colorScheme.primary,
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/Main/sample-profile.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 120,
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppStyles.colorScheme.primary,
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                        color: const Color(0xffeeeeee),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(4),
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: AppStyles.colorScheme.inversePrimary,
                          size: 24,
                        ),
                        onPressed: () {
                          print('IconButton pressed!');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.bodyText2,
      ),
      subtitle: Text(
        subtitle,
        style: AppStyles.bodyText3,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppStyles.colorScheme.inversePrimary,
          size: 16,
        ),
        onPressed: onPressed,
      ),
    );
  }

  Future<void> showTextInputDialog(
    BuildContext context,
    String title,
    String hint,
    Function(String) onSubmitted,
  ) async {
    String result = '';
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            decoration: InputDecoration(
                hintText: hint, labelStyle: AppStyles.bodyText2),
            onChanged: (value) {
              result = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onSubmitted(result);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print('Account Deleted');
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

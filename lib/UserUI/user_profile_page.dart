import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:waterways/models/users.dart';

class UserProfilePage extends StatelessWidget {
  final Customer customer;

  const UserProfilePage({super.key, required this.customer});

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
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage(customer.coverImg ??
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
                                  onPressed: () async {
                                    File? imageFile = await pickImage();
                                    if (imageFile != null) {}
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
                            Text(customer.firstname ?? '',
                                style: AppStyles.headline2),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppStyles.colorScheme.inversePrimary,
                                size: 20,
                              ),
                              onPressed: () {
                                showEditNameInputDialog(
                                    context, 'Edit Account Name', (p0) => null);
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
                          customer.email ?? '',
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
                            showConfirmationDialog(
                                context,
                                'Update Email',
                                'Are you sure you want to change your email?',
                                'Email updated');
                          },
                        ),
                      ),
                      buildListTile(
                        title: 'Phone',
                        subtitle: customer.phone ?? '',
                        onPressed: () {
                          showTextInputDialog(
                            context,
                            'Phone',
                            'Enter new phone number',
                            (value) {
                              print('New phone number: $value');
                            },
                          );
                        },
                      ),
                      buildListTile(
                        title: 'Address',
                        subtitle: customer.address ?? '',
                        onPressed: () {
                          showTextInputDialog(
                            context,
                            'Address',
                            'Enter new address',
                            (value) {
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
                            showConfirmationDialog(
                                context,
                                'Change Password',
                                'Are you sure you want to change your password?',
                                'Password Changed');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          showConfirmationDialog(
                              context,
                              'Delete Account',
                              'Are you sure you want to delete this account?',
                              'Account Deleted');
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            side: const BorderSide(color: Colors.red)),
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
                        image: DecorationImage(
                          image: AssetImage(customer.profileImg ??
                              'assets/Main/sample-profile.png'),
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
                        onPressed: () async {
                          File? imageFile = await pickImage();
                          if (imageFile != null) {}
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
          title: Text(
            'Edit $title',
            style: AppStyles.bodyText1.copyWith(
                color: AppStyles.colorScheme.inversePrimary, fontSize: 20.0),
          ),
          content: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppStyles.bodyText1.copyWith(fontSize: 14),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppStyles.colorScheme.inversePrimary),
              ),
            ),
            cursorColor: AppStyles.colorScheme.inversePrimary,
            onChanged: (value) {
              result = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: AppStyles.bodyText2),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onSubmitted(result);
              },
              child: Text('Save', style: AppStyles.bodyText2),
            ),
          ],
        );
      },
    );
  }

  Future<void> showEditNameInputDialog(
    BuildContext context,
    String accountName,
    Function(String) onSubmitted,
  ) async {
    String result = '';
    String newLastName = '';
    String newFirstName = '';

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            accountName,
            style: AppStyles.bodyText1.copyWith(
                color: AppStyles.colorScheme.inversePrimary, fontSize: 20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'New Last Name',
                  hintStyle: AppStyles.bodyText1.copyWith(fontSize: 14),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.colorScheme.inversePrimary),
                  ),
                ),
                cursorColor: AppStyles.colorScheme.inversePrimary,
                onChanged: (value) {
                  newLastName = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'New First Name',
                  hintStyle: AppStyles.bodyText1.copyWith(fontSize: 14),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppStyles.colorScheme.inversePrimary),
                  ),
                ),
                cursorColor: AppStyles.colorScheme.inversePrimary,
                onChanged: (value) {
                  newFirstName = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: AppStyles.bodyText2),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                result = '$newFirstName $newLastName';
                onSubmitted(result);
                print(result);
              },
              child: Text('Save', style: AppStyles.bodyText2),
            ),
          ],
        );
      },
    );
  }

  Future<void> showConfirmationDialog(BuildContext context, String title,
      String content, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: AppStyles.bodyText1.copyWith(
                  color: AppStyles.colorScheme.inversePrimary, fontSize: 20.0)),
          content: Text(
            content,
            style: AppStyles.bodyText2,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: AppStyles.bodyText2),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print(message);
              },
              child: Text('Yes', style: AppStyles.bodyText2),
            ),
          ],
        );
      },
    );
  }
}

Future<File?> pickImage() async {
  final ImagePicker imagePicker = ImagePicker();
  final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}

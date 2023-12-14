import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:waterways/models/users.dart';

class UserProfilePage extends StatefulWidget {
  final Customer customer;
  const UserProfilePage({super.key, required this.customer});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late Customer customer;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  bool _uploading = false;

  @override
  void initState() {
    super.initState();
    customer = widget.customer;
  }

  void updateCustomerInfo(BuildContext context, String field, String newValue) {
    String userId = customer.custId ?? '';

    FirebaseFirestore.instance
        .collection('Customers')
        .doc(userId)
        .update({field: newValue}).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User information updated successfully")),
      );
      fetchUpdatedUserData(userId);
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update user information: $error")),
      );
    });
  }

  Future<void> _updateProfileImage() async {
    String? downloadUrl = await _uploadImage();

    if (downloadUrl != null) {
      String userId = customer.custId ?? '';

      try {
        await FirebaseFirestore.instance
            .collection('Customers')
            .doc(userId)
            .update({'profileImg': downloadUrl});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile image updated successfully")),
        );
        fetchUpdatedUserData(userId);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update profile image: $error")),
        );
      }
    }
  }

  Future<void> updateCustomerName(BuildContext context, String userId,
      Map<String, dynamic> custNameFields) async {
    try {
      await FirebaseFirestore.instance
          .collection('Customers')
          .doc(userId)
          .update(custNameFields);
      fetchUpdatedUserData(userId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User information updated successfully")),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update user information: $error")),
      );
    }
  }

  void fetchUpdatedUserData(String userId) async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection('Customers')
          .doc(userId)
          .get();
      Customer updatedCustomer =
          Customer.fromMap(doc.data() as Map<String, dynamic>);

      setState(() {
        customer = updatedCustomer;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching updated user data: $e")),
      );
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
      _showPreviewDialog();
    }
  }

  Future<String?> _uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No image selected")),
      );
      return null;
    }

    setState(() {
      _uploading = true;
    });

    File file = File(_image!.path);
    try {
      final storageRef = FirebaseStorage.instanceFor(
              bucket: 'gs://waterways-7c3c8.appspot.com')
          .ref()
          .child('uploads/${_image!.name}');
      await storageRef.putFile(file);
      final downloadUrl = await storageRef.getDownloadURL();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Photo uploaded")),
      );
      return downloadUrl;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Upload failed: $e")),
      );
    } finally {
      setState(() {
        _uploading = false;
      });
    }
  }

  void _showPreviewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Preview and Upload"),
          content: _image == null ? SizedBox() : Image.file(File(_image!.path)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: AppStyles.bodyText2,
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _uploadImage();
              },
              child: Text(
                'Save',
                style: AppStyles.bodyText2,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String customerFullName =
        '${customer.firstname ?? ''} ${customer.lastname ?? ''}';

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
                              image: NetworkImage(customer.coverImg ?? '',
                                  scale: 1.0),
                              fit: BoxFit.cover),
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
                            Text(customerFullName, style: AppStyles.headline2),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppStyles.colorScheme.inversePrimary,
                                size: 20,
                              ),
                              onPressed: () {
                                showEditNameInputDialog(
                                    context,
                                    'Edit Account Name',
                                    widget.customer.custId ?? '');
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
                              updateCustomerInfo(context, 'phone', value);
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
                              updateCustomerInfo(context, 'address', value);
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
                            image: NetworkImage(customer.profileImg ?? '',
                                scale: 1.0),
                            fit: BoxFit.cover),
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Upload Image"),
                                  content: Text("Choose an action"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await _pickImage();
                                      },
                                      child: Text('Add Photo',
                                          style: AppStyles.bodyText3),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await _updateProfileImage();
                                      },
                                      child: Text('Save',
                                          style: AppStyles.bodyText3),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        )),
                  ),
                  if (_uploading)
                    Container(
                      color: Colors.white.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppStyles.colorScheme.secondary,
                          ),
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
    String userId,
  ) async {
    String newFirstName = '';
    String newLastName = '';

    showDialog(
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
              const SizedBox(
                height: 20,
              ),
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
              onPressed: () async {
                if (newFirstName.isNotEmpty && newLastName.isNotEmpty) {
                  Map<String, dynamic> fieldsToUpdate = {
                    'firstname': newFirstName,
                    'lastname': newLastName,
                  };

                  await updateCustomerName(context, userId, fieldsToUpdate);

                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Both fields are required")),
                  );
                }
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
                deleteCustomerAccount(context, widget.customer.custId ?? '');
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

Future<void> deleteCustomerAccount(
    BuildContext context, String customerId) async {
  try {
    CollectionReference customers =
        FirebaseFirestore.instance.collection('Customers');
    await customers.doc(customerId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Customer account deleted successfully'),
        duration: Duration(seconds: 3),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error deleting customer account: $e'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

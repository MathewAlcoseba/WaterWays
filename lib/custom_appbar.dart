import 'package:flutter/material.dart';
import 'package:waterways/app_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return PhysicalShape(
      color: AppStyles.colorScheme.primary,
      elevation: 1.5,
      shadowColor: AppStyles.colorScheme.tertiary.withOpacity(0.2),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/WaterWaysIcon.png',
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color:
                              AppStyles.colorScheme.tertiary.withOpacity(0.15),
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          showSearchBottomSheet(context);
                        },
                        icon: Image.asset(
                          'assets/Main/appbar-search.png',
                          width: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          color:
                              AppStyles.colorScheme.tertiary.withOpacity(0.15),
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/Main/appbar-chat.png',
                          width: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

void showSearchBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: AppStyles.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListTile(
                  leading: const Icon(Icons.search, color: Colors.grey),
                  title: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      focusedBorder: InputBorder.none,
                    ),
                    autofocus: true,
                    cursorColor: AppStyles.colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:waterways/UserUI/search_bar.dart';
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
    isScrollControlled: true,
    builder: (BuildContext bc) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (_, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CustomSearchBar(),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

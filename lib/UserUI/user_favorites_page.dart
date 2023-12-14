import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/models/users.dart';

class UserFavoritesPage extends StatelessWidget {
  final Customer customer;

  const UserFavoritesPage({super.key, required this.customer});

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
            'Favorite Stores',
            style: AppStyles.headline2.copyWith(fontSize: 26),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: Column(
              children: [
                SizedBox(height: 16.0),
                FavoriteStoresListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteStoresListView extends StatelessWidget {
  const FavoriteStoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.normal,
      ),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: AppStyles.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppStyles.colorScheme.inversePrimary.withOpacity(0.05),
                  offset: const Offset(0.0, 2.0),
                  blurRadius: 4,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: const DecorationImage(
                            image: AssetImage('assets/Main/AquaAtlan.png'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Aqua Atlan',
                          style: AppStyles.bodyText1.copyWith(
                              color: AppStyles.colorScheme.inversePrimary,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Container(
                          width: 55,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppStyles.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'open',
                              style: AppStyles.bodyText3.copyWith(
                                  color: AppStyles.colorScheme.primary),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Text(
                          'Basak, Pardo' '  •  ',
                          style: AppStyles.bodyText3.copyWith(
                              color: AppStyles.colorScheme.tertiary,
                              fontWeight: FontWeight.w400),
                        ),
                        Text('${cSymbol("PHP")}' '0.014/Liter',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppStyles.colorScheme.tertiary)),
                      ],
                    ),
                    const Rating(starCount: 4)
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          padding: const EdgeInsets.all(14.0),
                          iconSize: 26,
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline_rounded)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

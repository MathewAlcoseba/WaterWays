import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waterways/UserUI/user_home_page.dart';
import 'package:waterways/app_styles.dart';

class AvailableStoresListView extends StatelessWidget {
  const AvailableStoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppStyles.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyles.colorScheme.inversePrimary
                              .withOpacity(0.05),
                          offset: const Offset(0.0, 2.0),
                          blurRadius: 2,
                          spreadRadius: 0.5,
                        )
                      ],
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        child: Stack(children: [
                          Image.asset(
                            'assets/Main/AquaAtlan.png',
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.2),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 16, bottom: 12, right: 16),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                'Aqua Atlan',
                                style: AppStyles.bodyText1.copyWith(
                                    color: AppStyles.colorScheme.inversePrimary,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 12.0),
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
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Basak, Pardo' '  •  ',
                                style: AppStyles.bodyText2.copyWith(
                                    color: AppStyles.colorScheme.tertiary,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text('${cSymbol("PHP")}' '0.014/Liter',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: AppStyles.colorScheme.tertiary)),
                            ],
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                          const Rating(starCount: 4),
                        ]),
                      ),
                    ]),
                  ),
                  Positioned(
                      left: MediaQuery.of(context).size.width - 80,
                      top: 14,
                      child: Container(
                          width: 28,
                          decoration: BoxDecoration(
                            color:
                                AppStyles.colorScheme.primary.withOpacity(0.60),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(4),
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: AppStyles.colorScheme.inversePrimary,
                              size: 20,
                            ),
                            onPressed: () {
                              print('IconButton pressed!');
                            }, //handle onPressed here
                          ))),
                  Positioned(
                    left: MediaQuery.of(context).size.width - 80,
                    top: 224,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppStyles.colorScheme.inversePrimary,
                      size: 28,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width - 90,
                    top: 140,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_outline_rounded,
                        color: AppStyles.colorScheme.primary,
                        size: 28,
                      ),
                      onPressed: () {
                        print('IconButton pressed!');
                      }, // handle onPressed here
                    ),
                  )
                ]),
              );
            }));
  }
}

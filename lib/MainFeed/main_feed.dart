import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:waterways/MainFeed/search_bar.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/bottom_navbar.dart';
import 'package:waterways/custom_appbar.dart';

class MainFeed extends StatefulWidget {
  const MainFeed({super.key});

  @override
  MainFeedState createState() => MainFeedState();
}

class MainFeedState extends State<MainFeed> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      backgroundColor: AppStyles.colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(height: 16.0),
              AvailableStoresListView(),
              // Text(
              //   '$selectedIndex',
              //   style: const TextStyle(
              //       color: Colors.black,
              //       fontSize: 120.0,
              //       fontWeight: FontWeight.bold),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
          )),
    ));
  }
}

class AvailableStoresListView extends StatelessWidget {
  const AvailableStoresListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 545,
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
                    height: 290,
                    decoration: BoxDecoration(
                      color: AppStyles.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppStyles.colorScheme.inversePrimary
                              .withOpacity(0.12),
                          offset: const Offset(0.0, 2.0),
                          blurRadius: 1.5,
                          spreadRadius: 0.0,
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
                              Text(
                                '${cSymbol("PHP")}' '0.014/Liter',
                                style: AppStyles.bodyText2.copyWith(
                                    color: AppStyles.colorScheme.tertiary,
                                    fontWeight: FontWeight.w400),
                              ),
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
                    left: MediaQuery.of(context).size.width - 86,
                    top: 16,
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              AppStyles.colorScheme.primary.withOpacity(0.75),
                          shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.more_horiz_rounded,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width - 80,
                    top: 224,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppStyles.colorScheme.inversePrimary,
                      size: 28,
                    ),
                  )
                ]),
              );
            }));
  }
}

class Rating extends StatelessWidget {
  final int starCount;

  const Rating({
    Key? key,
    required this.starCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> ratingIcon = List.generate(5, (index) {
      return Icon(
        index < starCount ? Icons.star : Icons.star_outline,
        color: const Color(0xffFEC600),
        size: 20.0,
      );
    });

    return SizedBox(child: Row(children: ratingIcon));
  }
}

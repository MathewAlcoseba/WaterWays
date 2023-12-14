import 'package:flutter/material.dart';
import 'package:waterways/UserUI/stores_list_view.dart';
import 'package:waterways/app_styles.dart';
import 'package:waterways/custom_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waterways/models/users.dart';

class UserHomePage extends StatefulWidget {
  final Customer customer;
  const UserHomePage({super.key, required this.customer});

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  // This function will be triggered when the search is submitted
  void _onSearchSubmitted(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppStyles.colorScheme.background,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75.0),
          child: CustomAppBar(
            customer: widget.customer,
            searchController:
                _searchController, // Pass the controller to the CustomAppBar
            onSearchSubmitted:
                _onSearchSubmitted, // Pass the search submission function
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvailableStoresListView(
                customer: widget.customer,
                searchQuery:
                    _searchQuery, // Use the state's _searchQuery for filtering
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rating extends StatelessWidget {
  final int starCount;

  const Rating({
    super.key,
    required this.starCount,
  });

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

class Tag extends StatelessWidget {
  const Tag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 120,
      decoration: BoxDecoration(
        color: AppStyles.colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: AppStyles.colorScheme.inversePrimary.withOpacity(0.20),
            offset: const Offset(0.0, 2.0),
            blurRadius: 2.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Location',
              style: AppStyles.bodyText3.copyWith(
                  color: AppStyles.colorScheme.secondary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Center(
              child: Icon(
                Icons.close_rounded,
                color: AppStyles.colorScheme.secondary,
              ),
            ),
            iconSize: 18,
          )
        ],
      ),
    );
  }
}

Future<List<Store>> getStores() async {
  List<Store> stores = [];
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Stores').get();

    for (var doc in querySnapshot.docs) {
      Store store = Store.fromMap(doc.data() as Map<String, dynamic>);
      stores.add(store);
    }
  } catch (e) {
    print(e);
  }
  return stores;
}

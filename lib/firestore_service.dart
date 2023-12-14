import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waterways/models/users.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Store>> getStores() async {
    List<Store> stores = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Stores').get();

      print('Fetched documents: ${querySnapshot.docs.length}'); // Debug line

      for (var doc in querySnapshot.docs) {
        print('Raw data: ${doc.data()}'); // Debug line
        Store store = Store.fromMap(doc.data() as Map<String, dynamic>);
        stores.add(store);
      }
    } catch (e) {
      print('Error fetching stores: $e');
    }
    return stores;
  }
}

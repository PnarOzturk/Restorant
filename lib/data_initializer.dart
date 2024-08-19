// lib/data_initializer.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class DataInitializer {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initializeData() async {
    List<String> restaurantIds = [
      'Kahve_Bahane',
      'Taze_Deniz',
      'Tatlı_Düşler',
      'Demir Restorant',
      'Dönerci_Ustam',
      'Zeytin_adi',
    ];

    for (String restaurantId in restaurantIds) {
      await _initializeRestaurantTables(restaurantId);
    }
  }

  Future<void> _initializeRestaurantTables(String restaurantId) async {
    for (int i = 0; i < 16; i++) {
      await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('tables')
          .doc('table$i')
          .set({
        'status': 'available', // Varsayılan durum olarak 'available' ayarlanabilir
      });
    }
  }
}

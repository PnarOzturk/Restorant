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
      await _initializeRestaurantReservations(restaurantId);
    }
  }

  Future<void> _initializeRestaurantTables(String restaurantId) async {
    for (int i = 1; i < 17; i++) {
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

  Future<void> _initializeRestaurantReservations(String restaurantId) async {
    // Örnek rezervasyonlar eklenebilir
    await _firestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('reservations')
        .doc('reservation1')
        .set({
      'userId': 'user1',
      'tableId': 'table1',
      'reservationDate': Timestamp.fromDate(DateTime.now()),
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class DataInitializer {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> initializeData() async {
    List<String> restaurantIds = [
      'Kahve_Bahane',
      'Taze_Deniz',
      'Tatlı_Düşler',
      'Demir_Restorant',
      'Dönerci_Ustam',
      'Zeytin_adi',
    ];

    for (String restaurantId in restaurantIds) {
      await _initializeRestaurantTables(restaurantId);
      await _initializeRestaurantReservations(restaurantId);
      await _initializeRestaurantComments(restaurantId); // Yorumları ekleme fonksiyonu çağrılıyor
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
        'status': 'available',
      });
    }
  }

  Future<void> _initializeRestaurantReservations(String restaurantId) async {
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

  // Yeni eklenen yorum ekleme fonksiyonu
  Future<void> _initializeRestaurantComments(String restaurantId) async {
    await _firestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('reservations')
        .doc('reservation1')
        .collection('comments')
        .doc('comment1')
        .set({
      'userId': 'user1',
      'comment': 'Harika bir deneyimdi!',
      'timestamp': Timestamp.fromDate(DateTime.now()),
    });

    await _firestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('reservations')
        .doc('reservation1')
        .collection('comments')
        .doc('comment2')
        .set({
      'userId': 'user2',
      'comment': 'Mükemmel servis!',
      'timestamp': Timestamp.fromDate(DateTime.now().subtract(Duration(days: 1))),
    });
  }
}

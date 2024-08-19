import 'package:cloud_firestore/cloud_firestore.dart';

class TableService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Yeni bir masa durumu ekler
  Future<void> addTableStatus(String restaurantId, String tableId, String status) async {
    try {
      await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('tables')
          .doc(tableId)
          .set({
        'status': status,
      });
      print('Table status added successfully.');
    } catch (e) {
      print('Error adding table status: $e');
    }
  }

  // Var olan bir masa durumunu günceller
  Future<void> updateTableStatus(String restaurantId, String tableId, String status) async {
    try {
      await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('tables')
          .doc(tableId)
          .update({
        'status': status,
      });
      print('Table status updated successfully.');
    } catch (e) {
      print('Error updating table status: $e');
    }
  }

  // Belirli bir masa durumunu alır
  Future<String?> getTableStatus(String restaurantId, String tableId) async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('tables')
          .doc(tableId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          return data['status'] as String?;
        } else {
          print('Table data is null.');
          return null;
        }
      } else {
        print('Table not found.');
        return null;
      }
    } catch (e) {
      print('Error fetching table status: $e');
      return null;
    }
  }
}

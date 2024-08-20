import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RezervasyonSayfasi extends StatefulWidget {
  @override
  _RezervasyonSayfasiState createState() => _RezervasyonSayfasiState();
}

class _RezervasyonSayfasiState extends State<RezervasyonSayfasi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? selectedReservationId;
  String? selectedRestaurantId;
  int? selectedTableIndex;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Rezervasyonlarım'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://iphonexpapers.com/wp-content/uploads/papers.co-bb41-night-city-minimal-illustration-art-ivory-sepia-41-iphone-wallpaper-1-240x519.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: user == null
            ? Center(child: Text('Lütfen giriş yapın'))
            : StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('reservations')
              .doc('currentReservation')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('Henüz rezervasyon yapılmadı.'));
            }

            final reservationData =
            snapshot.data!.data() as Map<String, dynamic>;
            final tables = reservationData['tables'] as List<dynamic>;

            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red[50]?.withOpacity(0.8),
                    margin: EdgeInsets.all(16.0),
                    padding: EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: tables.length,
                      itemBuilder: (context, index) {
                        final table = tables[index];
                        final restaurantId = table['restaurantId'];
                        final tableId = table['tableId'];
                        final capacity = table['capacity'];

                        return ListTile(
                          title:
                          Text('$restaurantId - Masa numarası: $tableId'),
                          subtitle:
                          Text('$capacity kişilik masa'),
                          selected:
                          selectedReservationId == tableId,
                          onTap: () {
                            setState(() {
                              selectedReservationId = tableId;
                              selectedRestaurantId = restaurantId;
                              selectedTableIndex = index;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (selectedReservationId == null ||
                          selectedRestaurantId == null ||
                          selectedTableIndex == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Lütfen iptal edilecek rezervasyonu seçiniz.')),
                        );
                        return;
                      }

                      try {
                        // Seçilen rezervasyonu listeden kaldır
                        tables.removeAt(selectedTableIndex!);

                        // Eğer başka rezervasyon kalmamışsa, currentReservation dökümanını sil
                        if (tables.isEmpty) {
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .collection('reservations')
                              .doc('currentReservation')
                              .delete();
                        } else {
                          // Aksi takdirde listeyi güncelle
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .collection('reservations')
                              .doc('currentReservation')
                              .update({'tables': tables});
                        }

                        // İptal edilen masanın durumunu 'available' olarak güncelle
                        await FirebaseFirestore.instance
                            .collection('restaurants')
                            .doc(selectedRestaurantId)
                            .collection('tables')
                            .doc(selectedReservationId)
                            .update({'status': 'available'});

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Rezervasyonunuz başarıyla iptal edildi.')),
                        );

                        // Seçimi sıfırla
                        setState(() {
                          selectedReservationId = null;
                          selectedRestaurantId = null;
                          selectedTableIndex = null;
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Rezervasyon iptali sırasında bir hata oluştu: $e')),
                        );
                      }
                    },
                    child: Text('Rezervasyonu İptal et'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

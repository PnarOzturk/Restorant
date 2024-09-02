import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YorumYapSayfasi extends StatefulWidget {
  final String restaurantId;
  final String reservationId;

  YorumYapSayfasi({required this.restaurantId, required this.reservationId});

  @override
  _YorumYapSayfasiState createState() => _YorumYapSayfasiState();
}

class _YorumYapSayfasiState extends State<YorumYapSayfasi> {
  final TextEditingController _commentController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submitComment() async {
    final user = _auth.currentUser;
    if (user == null || _commentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen yorum yazınız ve giriş yaptığınızdan emin olun.')),
      );
      return;
    }

    try {
      // Yorumları Firestore'a kaydet
      await FirebaseFirestore.instance
          .collection('restaurants')
          .doc(widget.restaurantId)
          .collection('reservations')
          .doc(widget.reservationId)
          .collection('comments')
          .add({
        'userId': user.uid,
        'comment': _commentController.text,
        'timestamp': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yorum başarıyla kaydedildi.')),
      );

      // Yorum yapıldıktan sonra geri dön
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yorum kaydedilirken bir hata oluştu: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Müşteri olarak Yorum yap'),
        backgroundColor: Colors.red[900],
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://iphonexpapers.com/wp-content/uploads/papers.co-bb41-night-city-minimal-illustration-art-ivory-sepia-41-iphone-wallpaper-1-240x519.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Yorum yazma alanı
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Yorum yazma ve buton kısmını kapsayan Container
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red[100], // Container rengi kırmızı tonunda
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: _commentController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Yorumunuzu buraya yazın...',
                          hintStyle: TextStyle(color: Colors.black54),
                        ),
                        style: TextStyle(color: Colors.black), // Yazı rengi siyah
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _submitComment,
                        child: Text(
                          'Yorumu Gönder',
                          style: TextStyle(color: Colors.white), // Yazı rengi beyaz
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

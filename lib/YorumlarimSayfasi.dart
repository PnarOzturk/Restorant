import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class YorumlarimSayfasi extends StatefulWidget {
  final String currentUserEmail;

  YorumlarimSayfasi({required this.currentUserEmail});

  @override
  _YorumlarimSayfasiState createState() => _YorumlarimSayfasiState();
}

class _YorumlarimSayfasiState extends State<YorumlarimSayfasi> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> comments = [];
  int? selectedCommentIndex;
  final TextEditingController _commentController = TextEditingController();
  List<String> restaurantList = [
    'Demir Restorant',
    'Dönerci Ustam',
    'Kahve Bahane',
    'Tatlı Düşler',
    'Taze Deniz',
    'YorThus Restorant',
    'ZeytinAdı'
  ]; // Restoran isimlerini doğrudan ekledik
  String? selectedRestaurant; // Seçilen restoran

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  // Firebase Firestore'dan yorumları çekme fonksiyonu
  Future<void> _fetchComments() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collectionGroup('comments')
          .where('userId', isEqualTo: widget.currentUserEmail)
          .orderBy('timestamp', descending: true)
          .get();

      if (snapshot.docs.isEmpty) {
        print("Yorum bulunamadı.");
      } else {
        print("Yorumlar yüklendi: ${snapshot.docs.length} yorum bulundu.");
        snapshot.docs.forEach((doc) {
          print("Yorum verisi: ${doc.data()}");
        });
      }

      setState(() {
        comments = snapshot.docs;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yorumlar yüklenirken bir hata oluştu: $e')),
      );
      print("Hata: $e");
    }
  }

  // Yorum ekleme fonksiyonu
  Future<void> addComment(String comment, String userId) async {
    if (selectedRestaurant == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen bir restoran seçin.')),
      );
      return;
    }

    try {
      await _firestore.collection('comments').add({
        'comment': comment,
        'userId': userId,
        'restaurant': selectedRestaurant,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Yorum başarıyla eklendi.');
      _fetchComments(); // Yeni yorumları çekmek için listeyi güncelle
    } catch (e) {
      print('Yorum eklenirken bir hata oluştu: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Yorum eklenirken bir hata oluştu: $e')),
      );
    }
  }

  // Yorum silme fonksiyonu
  void _deleteComment() async {
    if (selectedCommentIndex != null) {
      try {
        await comments[selectedCommentIndex!].reference.delete();
        setState(() {
          comments.removeAt(selectedCommentIndex!);
          selectedCommentIndex = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yorum başarıyla silindi.')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Yorum silinirken bir hata oluştu: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen silmek için bir yorum seçin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yorumlarım'),
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
          // Yorumlar Listesi
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildCommentList(),
              ),
              // Restoran seçimi ve yorum ekleme alanı
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.red[100], // Pastel tonlarında kırmızı
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      // Restoran seçimi için dropdown
                      DropdownButton<String>(
                        value: selectedRestaurant,
                        hint: Text(
                          'Restoran Seçin',
                          style: TextStyle(color: Colors.black), // Siyah renk
                        ),
                        dropdownColor: Colors.red[100],
                        items: restaurantList.map((String restaurant) {
                          return DropdownMenuItem<String>(
                            value: restaurant,
                            child: Text(
                              restaurant,
                              style: TextStyle(color: Colors.black), // Siyah renk
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRestaurant = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          labelText: 'Yorumunuz',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.red[20]?.withOpacity(0.8),
                        ),
                        style: TextStyle(color: Colors.black), // Yazı rengi siyah
                      ),
                    ],
                  ),
                ),
              ),
              // Yorum Ekle ve Sil Butonları
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: selectedRestaurant == null
                          ? null
                          : () {
                        if (_commentController.text.isNotEmpty) {
                          addComment(
                            _commentController.text,
                            widget.currentUserEmail,
                          );
                          _commentController.clear(); // Yorum eklendikten sonra alanı temizle
                        }
                      },
                      child: Text(
                        'Yorumu Ekle',
                        style: TextStyle(color: Colors.white), // Yazı tipi beyaz
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _deleteComment,
                      child: Text(
                        'Yorum Sil',
                        style: TextStyle(color: Colors.white), // Yazı tipi beyaz
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
        ],
      ),
    );
  }

  // Yorumları listeleyen widget
  Widget _buildCommentList() {
    if (comments.isEmpty) {
      return Center(
        child: Text(
          'Henüz yorumunuz yok.',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        var commentData = comments[index].data() as Map<String, dynamic>? ?? {};
        return Card(
          color: selectedCommentIndex == index ? Colors.red[700] : Colors.black54,
          margin: EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(
              commentData['comment'] ?? 'Yorum yok',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Arial',
              ),
            ),
            subtitle: Text(
              "${commentData['restaurant'] ?? 'Restoran yok'} - ${commentData['timestamp'] != null ? (commentData['timestamp'] as Timestamp).toDate().toString() : 'Tarih yok'}",
              style: TextStyle(color: Colors.white70),
            ),
            onTap: () {
              setState(() {
                selectedCommentIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}

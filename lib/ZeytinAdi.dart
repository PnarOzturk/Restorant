import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ZeytinAdiMenuPage.dart'; // Menü sayfasını import edin
import 'masa_duzeni_sayfasi.dart'; // Masa düzeni sayfasını import edin

class Zeytinadi extends StatelessWidget {
  final String title;
  final String description;
  final double rating;
  final String restaurantId; // Restoran kimliğini ekle

  Zeytinadi({
    required this.title,
    required this.description,
    this.rating = 4.0,
    required this.restaurantId, // Kimliği zorunlu hale getir
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal[800], // AppBar rengi
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://iphonexpapers.com/wp-content/uploads/papers.co-nm20-flower-food-table-life-41-iphone-wallpaper-240x519.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBarIndicator(
                rating: rating,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
              SizedBox(height: 16),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ZeytinAdiMenuPage(),
                          ),
                        );
                      },
                      child: Text('Menü', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[800], // Menü buton rengi
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MasaDuzeniSayfasi(restaurantId: restaurantId), // Kimliği aktar
                          ),
                        );
                      },
                      child: Text('Masa Düzeni', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[800], // Masa Düzeni buton rengi
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[800], // DropdownButton arka plan rengi
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('Bize Ulaşın', style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.teal[800], // Dropdown menü arka plan rengi
                        style: TextStyle(color: Colors.white),
                        value: null,
                        onChanged: (String? newValue) {
                          // Tıklama işlemi
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: 'Telefon',
                            child: Text('Telefon: +90 (212) 565-10-34'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'E-posta',
                            child: Text('E-posta: info@ZeytinAdiRestorant.com'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Adres',
                            child: Text('Adres: İstanbul, Kağıthane'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

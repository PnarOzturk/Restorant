import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'masa_duzeni_sayfasi.dart'; // Masa düzeni sayfasını import et
import 'YorThusRestorantMenuPage.dart'; // Menü sayfasını import et

class Yorthusrestorant extends StatelessWidget {
  final String title;
  final String description;
  final double rating;
  final String restaurantId; // Restoran kimliğini ekle

  Yorthusrestorant({
    required this.title,
 required String restorantId,
  required this.description,
    required this.rating,
    required this.restaurantId,
  // Kimliği zorunlu hale getir
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://iphonexpapers.com/wp-content/uploads/papers.co-mz21-food-style-eat-dish-41-iphone-wallpaper-240x519.jpg',
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
                style: TextStyle(fontSize: 18, color: Colors.white),
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
                            builder: (context) => YorThusRestorantMenuPage(
                              restaurantId: restaurantId,
                            ), // Kimliği aktar
                          ),
                        );
                      },
                      child: Text('Menü', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
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
                            builder: (context) => MasaDuzeniSayfasi(
                              restaurantId: restaurantId,
                            ), // Kimliği aktar
                          ),
                        );
                      },
                      child: Text('Masa Düzeni', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
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
                  color: Color(0xFF212121), // Dropdown arka plan rengi
                  child: DropdownButton<String>(
                    hint: Text('Bize Ulaşın', style: TextStyle(color: Colors.white)),
                    dropdownColor: Color(0xFF212121), // Dropdown arka plan rengi
                    style: TextStyle(color: Colors.white),
                    value: null,
                    onChanged: (String? newValue) {
                      // Tıklama işlemi
                      print('Seçilen: $newValue');
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Telefon',
                        child: Text('Telefon: +90 (212) 555-12-34'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'E-posta',
                        child: Text('E-posta: info@YorThusRestorant.com'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Adres',
                        child: Text('Adres: İstanbul, Kağıthane'),
                      ),
                    ],
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

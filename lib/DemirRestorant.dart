import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'DemirRestorantMenuPage.dart'; // Yeni sayfayı import edin

class DemirRestorant extends StatelessWidget {
  final String title;
  final String description;
  final double rating;

  DemirRestorant({
    required this.title,
    required this.description,
    this.rating = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.white), // Yazı rengini beyaz yapıyoruz
        ),
        backgroundColor: Color(0xFF5C0909),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://iphonexpapers.com/wp-content/uploads/papers.co-mj88-steakhouse-food-delicious-41-iphone-wallpaper-240x519.jpg'
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
                  fontStyle: FontStyle.italic, // İtalik
                  fontWeight: FontWeight.w600, // Kalınlaştır
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
                            builder: (context) => DemirRestorantMenuPage(),
                          ),
                        );
                      },
                      child: Text('Menü', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5C0909),
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Masa Düzeni butonuna tıklama işlemi
                      },
                      child: Text('Masa Düzeni', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5C0909),
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
                  color: Color(0xFF5C0909), // Renk kodu düzenlendi
                  child: DropdownButton<String>(
                    hint: Text('Bize Ulaşın', style: TextStyle(color: Colors.white)),
                    dropdownColor: Color(0xFF212121), // Renk kodu düzenlendi
                    style: TextStyle(color: Colors.white),
                    value: null,
                    onChanged: (String? newValue) {
                      // Tıklama işlemi
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: 'Telefon',
                        child: Text('Telefon: +90 (212) 565-12-34'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'E-posta',
                        child: Text('E-posta: info@DemirRestorant.com'),
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

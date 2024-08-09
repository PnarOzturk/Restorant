import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Yorthusrestorant extends StatelessWidget {
  final String title; //sabit degiskenler "final"
  final String description;
  final double rating;

  Yorthusrestorant({
    required this.title,
    required this.description,
    this.rating = 4.8,
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
            fit: BoxFit.cover, //resim tamamen container 'ı kaplasın diye yaptik
          ),
        ),
        child: Padding( //boşluk düzenleme
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBarIndicator( //puanlama kısmı ayarları
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
                        // Menü butonuna tıklama olması için gerekli method
                      },
                      child: Text('Menü', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton( //tıklanabilir butonu ayarlama
                      onPressed: () {

                      },
                      child: Text('Masa Düzeni', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900], // Buton rengi
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(), //yer tutucu widget
              // Bize Ulaşın DropdownButton
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  color: Color(212121), // Dropdown arka plan rengi
                  child: DropdownButton<String>(
                    hint: Text('Bize Ulaşın', style: TextStyle(color: Colors.white)),
                    dropdownColor: Color(212121), // Dropdown arka plan rengi
                    style: TextStyle(color: Colors.white),
                    value: null,
                    onChanged: (String? newValue) {
                      // Tıklama işlemi
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

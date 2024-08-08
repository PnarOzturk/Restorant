import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Yorthusrestorant extends StatelessWidget {
  final String title;
  final String description;
  final double rating;

  Yorthusrestorant({
    required this.title,
    required this.description,
    this.rating = 4.8, // Varsayılan değer
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
                        // Menü butonuna tıklama işlemi
                      },
                      child: Text('Menü', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900], // Buton rengi
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
                        backgroundColor: Colors.red[900], // Buton rengi
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

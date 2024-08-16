import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'DonerciUstamMenuPage.dart'; // Menü sayfası için import edin

class DonerciUstam extends StatelessWidget {
  final String title;
  final String description;
  final double rating;

  DonerciUstam({
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Arial',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://iphonexpapers.com/wp-content/uploads/papers.co-mj88-steakhouse-food-delicious-41-iphone-wallpaper-240x519.jpg'), // Arka plan resmi
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restoran bilgileri
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                itemSize: 30,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
                ignoreGestures: true,
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
              // Menü ve masa düzeni butonları
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DonerciUstamMenuPage(), // Menü sayfasına yönlendirin
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      ),
                      child: Text(
                        'Menü',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Masa düzeni sayfasına gitmek için
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      ),
                      child: Text(
                        'Masa Düzeni',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'TazeDenizMenuPage.dart'; // Menü sayfası için import

class TazeDeniz extends StatelessWidget {
  final String title;
  final String description;
  final double rating;

  TazeDeniz({
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
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
            image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fc1.wallpaperflare.com%2Fpreview%2F558%2F891%2F711%2Fseafood-food-healthy-sea.jpg&f=1&nofb=1&ipt=663391d4f478fda256e659293dedc641ed3c2df458436727bd34d8df64e2bdeb&ipo=images'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restoran detayları
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
                          MaterialPageRoute(builder: (context) => TazeDenizMenuPage()), // Menü sayfasına git
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[800],
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
                        // Masa düzeni sayfasına gitme işlemi
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[800],
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

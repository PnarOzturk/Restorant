import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'KahveBahaneMenuPage.dart'; // Menü sayfasını import edin
import 'masa_duzeni_sayfasi.dart'; // Masa düzeni sayfasını import edin

class KahveBahane extends StatelessWidget {
  final String title;
  final String description;
  final double rating;
  final String restaurantId; // Restoran kimliğini ekleyin

  KahveBahane({
    required this.title,
    required this.description,
    required this.rating,
    required this.restaurantId, // Kimliği zorunlu hale getirin
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
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
            image: NetworkImage('https://iphonexpapers.com/wp-content/uploads/papers.co-oc51-coffee-drop-cup-nature-41-iphone-wallpaper-240x519.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coffee shop details
              Text(
                title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[50],
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
              // Menu and table arrangement buttons
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KahveBahaneMenuPage(), // Menü sayfasına yönlendirin
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[800],
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MasaDuzeniSayfasi(restaurantId: restaurantId), // Kimliği aktararak Masa Düzeni sayfasına yönlendirin
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[800],
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

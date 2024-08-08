import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // RatingBarIndicator için gerekli

class AvcilarSayfasi extends StatefulWidget {
  @override
  _AvcilarSayfasiState createState() => _AvcilarSayfasiState();
}

class _AvcilarSayfasiState extends State<AvcilarSayfasi> {
  final Completer<GoogleMapController> _haritaKontrol = Completer();
  final CameraPosition _baslangicKonum = CameraPosition(
    target: LatLng(40.9793, 28.7214),
    zoom: 14,
  );

  final List<Marker> _konumlar1 = [];

  String _selectedRestaurant = '';
  double _rating = 0.0;
  String _description = '';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _loadMarkers();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      print("Konuma izin verildi");
    } else {
      print("Konum reddedildi");
    }
  }

  void _loadMarkers() {
    _konumlar1.addAll([
      Marker(
        markerId: MarkerId('Sehnaz'),
        position: LatLng(40.9893, 28.7224),
        infoWindow: InfoWindow(
          title: 'Sehnaz Restorant',
          snippet: 'Her tabakta yeni bir keşif',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Sehnaz Restorant';
              _rating = 4;
              _description = '2010 yılından beri sizlere hizmet eden Sehnaz Restorant, modern tasarımı ve geniş menüsü ile benzersiz bir yemek deneyimi sunar. Her öğünde damak tadınıza hitap eden sürprizlerimizle sizleri ağırlamaktan mutluluk duyuyoruz.';
            });
          },
        ),
      ),
      Marker(
        markerId: MarkerId('Sirius'),
        position: LatLng(40.9793, 28.7134),
        infoWindow: InfoWindow(
          title: 'Sirius Restorant',
          snippet: 'Lezzet ve eğlencenin buluşma noktası',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Sirius Restorant';
              _rating = 3.5;
                _description = '2008 yılından bu yana, Sirius Restorant, dinamik ve enerjik atmosferi ile yemeklerinize renk katıyor. Lezzetli yemeklerimiz ve keyifli ortamımızda unutulmaz anlar yaşamanız için buradayız.';
            });
          },
        ),
      ),
      Marker(
        markerId: MarkerId('Ercel'),
        position: LatLng(40.9793, 28.7014),
        infoWindow: InfoWindow(
          title: 'Erçel Restorant',
          snippet: 'Geleneksel tatların modern sunumu',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Erçel Restorant';
              _rating = 2;
              _description = '1998 yılından beri hizmet veren Erçel Restorant, köklü mutfak kültürümüzü modern dokunuşlarla sunar. Rahat ortamımız ve zengin menümüzle, sizlere hem lezzet hem de kalite sunmayı hedefliyoruz.';
            });
          },
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          'Avcılar Restorantlar',
          style: TextStyle(
            color: Colors.grey[200],
            fontFamily: 'Arial',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _baslangicKonum,
            onMapCreated: (GoogleMapController controller) {
              _haritaKontrol.complete(controller);
            },
            markers: Set<Marker>.of(_konumlar1),
          ),
          if (_selectedRestaurant.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedRestaurant,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    RatingBarIndicator(
                      rating: _rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(height: 8),
                    Text(
                      _description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

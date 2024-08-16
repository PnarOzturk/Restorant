import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

  final Map<String, List<Marker>> _restaurantTypes = {
    'Türk': [],
    'Kafe': [],
    'Global': [],
    'Tatlı': [],
  };

  String _selectedRestaurantType = '';
  String _selectedRestaurant = '';
  double _rating = 0.0;
  String _description = '';
  List<Marker> _konumlar1 = [];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _initializeMarkers();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      print("Konuma izin verildi");
    } else {
      print("Konum reddedildi");
    }
  }

  void _initializeMarkers() {
    // Türk mutfağı restoranları
    _restaurantTypes['Türk']?.addAll([
      _createMarker(
        'Sehnaz',
        LatLng(40.9893, 28.7224),
        'Şehnaz Restorant',
        'Her tabakta yeni bir keşif',
        4.5,
        '2010 yılından beri sizlere hizmet eden Şehnaz Restorant, modern tasarımı ve geniş menüsü ile benzersiz bir yemek deneyimi sunar.',
      ),
      _createMarker(
        'Sirius',
        LatLng(40.9793, 28.7134),
        'Sirius Restorant',
        'Lezzet ve eğlencenin buluşma noktası',
        4.0,
        '2008 yılından bu yana, Sirius Restorant, dinamik ve enerjik atmosferi ile yemeklerinize renk katıyor.',
      ),
      _createMarker(
        'Ercel',
        LatLng(40.9793, 28.7014),
        'Erçel Restorant',
        'Geleneksel tatların modern sunumu',
        3.5,
        '1998 yılından beri hizmet veren Erçel Restorant, köklü mutfak kültürümüzü modern dokunuşlarla sunar.',
      ),
    ]);

    // Kafe
    _restaurantTypes['Kafe']?.addAll([
      _createMarker(
        'KahveSokağı',
        LatLng(40.9832, 28.7256),
        'Kahve Sokağı',
        'Kahve keyfi ve dost sohbetleri',
        4.8,
        'Şehirden uzak, rahat bir ortamda kahve ve tatlı keyfi sunar.',
      ),
      _createMarker(
        'KahveMolası',
        LatLng(40.9756, 28.7154),
        'Kahve Molası',
        'Her yudumda huzur',
        4.2,
        'Sıcak ve samimi atmosferi ile tanınan Kahve Molası, misafirlerine unutulmaz anlar yaşatır.',
      ),
    ]);

    // Global mutfak
    _restaurantTypes['Global']?.addAll([
      _createMarker(
        'WorldFlavors',
        LatLng(40.9781, 28.7272),
        'World Flavors',
        'Dünyanın lezzetleri burada buluşuyor',
        4.7,
        'Farklı kültürlerden esinlenerek hazırlanan yemekleri sunar.',
      ),
      _createMarker(
        'FusionBistro',
        LatLng(40.9743, 28.7089),
        'Fusion Bistro',
        'Lezzetlerin buluşma noktası',
        4.3,
        'Modern ve geleneksel lezzetlerin harmanlandığı eşsiz bir mutfak.',
      ),
    ]);

    // Tatlıcılar
    _restaurantTypes['Tatlı']?.addAll([
      _createMarker(
        'TatlıRüyalar',
        LatLng(40.9801, 28.7122),
        'Tatlı Rüyalar',
        'Her tatlı bir rüya',
        4.9,
        'Tatlı tutkunları için cennet. Birbirinden lezzetli tatlılar sunar.',
      ),
      _createMarker(
        'Şekerci',
        LatLng(40.9765, 28.7198),
        'Şekerci',
        'Tatlı keyfi ve mutluluk',
        4.6,
        'Taze ve kaliteli malzemelerle hazırlanmış tatlılar sunar.',
      ),
    ]);

    _loadMarkers();
  }

  void _loadMarkers() {
    setState(() {
      _konumlar1.clear();
      if (_selectedRestaurantType.isEmpty) {
        _restaurantTypes.forEach((_, markers) {
          _konumlar1.addAll(markers);
        });
      } else {
        _konumlar1.addAll(_restaurantTypes[_selectedRestaurantType] ?? []);
      }
    });
  }

  Marker _createMarker(String id, LatLng position, String title, String snippet, double rating, String description) {
    return Marker(
      markerId: MarkerId(id),
      position: position,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
        onTap: () => _onMarkerTapped(title, rating, description),
      ),
    );
  }

  void _onMarkerTapped(String restaurant, double rating, String description) {
    setState(() {
      _selectedRestaurant = restaurant;
      _rating = rating;
      _description = description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          'Avcılar Restoranlar',
          style: TextStyle(
            color: Colors.grey[200],
            fontFamily: 'Arial',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: DropdownButton<String>(
              hint: Text('Tür Seçiniz'),
              value: _selectedRestaurantType.isEmpty ? null : _selectedRestaurantType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRestaurantType = newValue ?? '';
                  _loadMarkers();
                });
              },
              items: _restaurantTypes.keys.map<DropdownMenuItem<String>>((String key) {
                return DropdownMenuItem<String>(
                  value: key,
                  child: Container(
                    color: Colors.white,
                    child: Text(
                      key,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList()
                ..add(
                  DropdownMenuItem<String>(
                    value: '',
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        'Hepsi',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ),
          ),
          Expanded(
            child: Stack(
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
          ),
        ],
      ),
    );
  }
}

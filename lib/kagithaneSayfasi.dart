import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:deneme20/YorThusRestorant.dart'; // Doğru yolu buraya ekleyin

class KagithaneSayfasi extends StatefulWidget {
  @override
  _KagithaneSayfasiState createState() => _KagithaneSayfasiState();
}

class _KagithaneSayfasiState extends State<KagithaneSayfasi> {
  final Completer<GoogleMapController> _haritaKontrol = Completer();
  final CameraPosition _baslangicKonum = CameraPosition(
    target: LatLng(41.0912, 29.0063),
    zoom: 14,
  );

  final Map<String, List<Marker>> _restaurantTypes = {
    'Akdeniz': [],
    'Türk': [],
    'Kafe': [],
    'Global': [],
    'Tatlı': [],
  };

  String _selectedRestaurantType = '';
  String _selectedRestaurant = '';
  double _rating = 0.0; // Puan
  String _description = '';
  bool _isYorThus = false; // YorThus seçili mi kontrolü
  List<Marker> _konumlar = [];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _initializeMarkers(); // Marker'ları initialize edin
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
    // Marker'ları tanımlayın
    _restaurantTypes['Akdeniz']?.add(
      _createMarker('Zeytin_adi', LatLng(41.0897, 29.0092), 'Zeytin Bahçesi', 'Akdeniz’in Tadını Getiriyoruz', 4.3, 'Akdeniz mutfağından taze lezzetler sunan bu mekan, mükemmel bir yemek deneyimi sunar.'),
    );

    _restaurantTypes['Türk']?.addAll([
      _createMarker('Dönerci_Ustam', LatLng(41.0826, 29.0231), 'Dönerci Ustam', 'Hızlı ve lezzetli', 3.7, 'Klasik Türk dönerinin en lezzetli halini sunan mekan, hızlı servis anlayışıyla bilinir.'),
      _createMarker('Teker', LatLng(41.0912, 29.0163), 'Teker Restorant', 'Zarif bir ortamda unutulmaz lezzetler', 3.8, 'Ferah ve rahat ortamıyla yemeklerinizin keyfini çıkarabileceğiniz bir mekan.'),
      _createMarker('Demir', LatLng(41.1012, 29.0063), 'Demir Restorant', 'Şehirden kaçış, lezzetten keyif', 4.0, 'Doğal ve huzurlu atmosferiyle şehir hayatının karmaşasından uzaklaşmanızı sağlar.'),
    ]);

    _restaurantTypes['Kafe']?.addAll([
      _createMarker('Kahve_Bahane', LatLng(41.0832, 29.0185), 'Kahve Bahane', 'Keyifli Sohbetlerin Mekanı', 4.6, 'Zengin kahve çeşitleri ve taze tatlılarla dolu menümüzle dostlarınızla keyifli vakit geçirmenizi sağlar.'),
      _createMarker('Kahve_Durağı', LatLng(41.0891, 29.0128), 'Kahve Durağı', 'Her yudumda bir mola', 2.2, 'Şehirden uzak, rahat atmosferiyle lezzetli kahve çeşitleri sunar.'),
    ]);

    _restaurantTypes['Global']?.addAll([
      _createMarker('Karma_adi', LatLng(41.1407, 29.0584), 'Karma Sofrası', 'Dünya Mutfağından Seçmeler', 4.5, 'Farklı kültürlerden esinlenerek hazırlanan yemekleri sunar.'),
      _createMarker('YorThus', LatLng(41.0812, 29.0063), 'YorThus Restorant', 'Harika yemekler ve mükemmel bir atmosfer', 4.5, 'Sakin ve huzurlu atmosferi ile tanınır. Lezzetli yemeklerimiz ve özenle hazırlanmış menümüzle kaliteli hizmet sunar.'),
      _createMarker('Taze_Deniz', LatLng(41.0862, 29.0215), 'Taze Deniz', 'Denizin taptaze lezzetleri', 4.1, 'Deniz ürünlerinin en taze ve lezzetli halini sunar.'),
    ]);

    _restaurantTypes['Tatlı']?.add(
      _createMarker('Tatlı_Düşler', LatLng(41.0857, 29.0145), 'Tatlı Düşler', 'Her tatlı bir düş', 4.2, 'Birbirinden lezzetli ve taze tatlılarıyla bilinir.'),
    );

    _loadMarkers(); // İlk başta tüm marker'ları göster
  }

  void _loadMarkers() {
    setState(() {
      _konumlar.clear();
      if (_selectedRestaurantType.isEmpty) {
        _restaurantTypes.forEach((_, markers) {
          _konumlar.addAll(markers);
        });
      } else {
        _konumlar.addAll(_restaurantTypes[_selectedRestaurantType] ?? []);
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
        onTap: () => _onMarkerTapped(id, title, rating, description),
      ),
    );
  }

  void _onMarkerTapped(String id, String restaurant, double rating, String description) {
    setState(() {
      _selectedRestaurant = restaurant;
      _rating = rating;
      _description = description;
      _isYorThus = id == 'YorThus';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          'Kağıthane Restorantlar',
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
                  markers: Set<Marker>.of(_konumlar),
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
                          if (_isYorThus)
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Yorthusrestorant(
                                      title: _selectedRestaurant,
                                      description: _description,
                                      rating: _rating,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Seç',
                                style: TextStyle(color: Colors.blue),
                              ),
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

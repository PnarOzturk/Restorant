import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:deneme20/Yorthusrestorant.dart';
import 'package:deneme20/DemirRestorant.dart';
import 'package:deneme20/ZeytinAdi.dart';
import 'package:deneme20/TatliDusler.dart';
import 'package:deneme20/KahveBahane.dart';
import 'package:deneme20/DonerciUstam.dart';
import 'package:deneme20/TazeDeniz.dart';

class KagithaneSayfasi extends StatefulWidget {
  @override
  _KagithaneSayfasiState createState() => _KagithaneSayfasiState();
}

class _KagithaneSayfasiState extends State<KagithaneSayfasi> {
  final Completer<GoogleMapController> _haritaKontrol = Completer();
  final CameraPosition _baslangicKonum = CameraPosition(
    target: LatLng(41.0912, 29.0063),
    zoom: 15,
  );

  final Map<String, List<Marker>> _restaurantTypes = {
    'Akdeniz Mutfağı': [],
    'Türk Mutfağı': [],
    'Kafe': [],
    'Dünya Mutfağı': [],
    'Tatlı': [],
  };

  String? _selectedRestaurantType; // İlgili tür seçili değilken null
  String _selectedRestaurant = '';
  double _rating = 0.0;
  String _description = '';
  List<Marker> _konumlar = [];

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
    _restaurantTypes['Akdeniz Mutfağı']?.add(
      _createMarker(
        id: 'Zeytin_adi',
        position: LatLng(41.0897, 29.0092),
        title: 'Zeytin Adı',
        snippet: 'Akdeniz’in Tadını Getiriyoruz',
        rating: 4.3,
        description:
        'Akdeniz mutfağından taze lezzetler sunan bu mekan, mükemmel bir yemek deneyimi sunar.',
      ),
    );

    _restaurantTypes['Türk Mutfağı']?.addAll([
      _createMarker(
        id: 'Dönerci_Ustam',
        position: LatLng(41.0826, 29.0231),
        title: 'Dönerci Ustam',
        snippet: 'Hızlı ve lezzetli',
        rating: 3.7,
        description:
        'Klasik Türk dönerinin en lezzetli halini sunan mekan, hızlı servis anlayışıyla bilinir.',
      ),
      _createMarker(
        id: 'Teker',
        position: LatLng(41.0912, 29.0163),
        title: 'Teker Restorant',
        snippet: 'Zarif bir ortamda unutulmaz lezzetler',
        rating: 3.8,
        description:
        'Ferah ve rahat ortamıyla yemeklerinizin keyfini çıkarabileceğiniz bir mekan.',
      ),
      _createMarker(
        id: 'Demir',
        position: LatLng(41.1012, 29.0063),
        title: 'Demir Restorant',
        snippet: 'Şehirden kaçış, lezzetten keyif',
        rating: 4.0,
        description:
        'Doğal ve huzurlu atmosferiyle şehir hayatının karmaşasından uzaklaşmanızı sağlar.',
      ),
    ]);

    _restaurantTypes['Kafe']?.addAll([
      _createMarker(
        id: 'Kahve_Bahane',
        position: LatLng(41.0832, 29.0185),
        title: 'Kahve Bahane',
        snippet: 'Keyifli Sohbetlerin Mekanı',
        rating: 4.6,
        description:
        'Zengin kahve çeşitleri ve taze tatlılarla dolu menümüzle dostlarınızla keyifli vakit geçirmenizi sağlar.',
      ),
      _createMarker(
        id: 'Kahve_Durağı',
        position: LatLng(41.0891, 29.0128),
        title: 'Kahve Durağı',
        snippet: 'Her yudumda bir mola',
        rating: 2.2,
        description:
        'Şehirden uzak, rahat atmosferiyle lezzetli kahve çeşitleri sunar.',
      ),
    ]);

    _restaurantTypes['Dünya Mutfağı']?.addAll([
      _createMarker(
        id: 'Karma_adi',
        position: LatLng(41.1407, 29.0584),
        title: 'Karma Sofrası',
        snippet: 'Dünya Mutfağından Seçmeler',
        rating: 4.5,
        description:
        'Farklı kültürlerden esinlenerek hazırlanan yemekleri sunar.',
      ),
      _createMarker(
        id: 'YorThus',
        position: LatLng(41.0812, 29.0063),
        title: 'YorThus Restorant',
        snippet: 'Harika yemekler ve mükemmel bir atmosfer',
        rating: 4.5,
        description:
        'Sakin ve huzurlu atmosferi ile tanınır. Lezzetli yemeklerimiz ve özenle hazırlanmış menümüzle kaliteli hizmet sunar.',
      ),
      _createMarker(
        id: 'Taze_Deniz',
        position: LatLng(41.0862, 29.0215),
        title: 'Taze Deniz',
        snippet: 'Denizin taptaze lezzetleri',
        rating: 4.1,
        description:
        'Deniz ürünlerinin en taze ve lezzetli halini sunar.',
      ),
    ]);

    _restaurantTypes['Tatlı']?.add(
      _createMarker(
        id: 'Tatlı_Düşler',
        position: LatLng(41.0857, 29.0145),
        title: 'Tatlı Düşler',
        snippet: 'Her tatlı bir düş',
        rating: 4.2,
        description:
        'Birbirinden lezzetli ve taze tatlılarıyla bilinir.',
      ),
    );

    _loadMarkers();
  }

  void _loadMarkers() {
    setState(() {
      _konumlar.clear();
      if (_selectedRestaurantType == null || _selectedRestaurantType == 'Hepsi') {
        _restaurantTypes.forEach((_, markers) {
          _konumlar.addAll(markers);
        });
      } else {
        _konumlar.addAll(_restaurantTypes[_selectedRestaurantType] ?? []);
      }
    });
  }

  Marker _createMarker({
    required String id,
    required LatLng position,
    required String title,
    required String snippet,
    required double rating,
    required String description,
  }) {
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
    });

    Widget page;
    switch (id) {

      case 'Demir':
        page = DemirRestorant(title: restaurant, description: description, rating: rating, restaurantId: id);
        break;
      case 'Kahve_Bahane':
        page = KahveBahane(title: restaurant, description: description, rating: rating, restaurantId: id);
        break;
      case 'Zeytin_adi':
        page = Zeytinadi(title: restaurant, description: description, rating: rating, restaurantId: id);
        break;
      case 'Taze_Deniz':
        page = TazeDeniz(title: restaurant, description: description, rating: rating, restaurantId: id);
        break;
      case 'Tatlı_Düşler':
        page = TatliDusler(title: restaurant, description: description, rating: rating, restaurantId: id);
        break;
      case 'Dönerci_Ustam':
        page = DonerciUstam(title: restaurant, description: description, rating: rating, restaurantId: id);
        break;
      default:
        page = Container(); // Bilinmeyen durumlar için boş bir container
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900], // AppBar rengi
        title: Text(
          'Kağıthane Restoranlar',
          style: TextStyle(
            color: Colors.grey[200],
            fontFamily: 'Arial',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.white, // Dropdown menüsünün arka plan rengi
            child: DropdownButton<String>(
              value: _selectedRestaurantType,
              hint: Text('Tür Seçiniz', style: TextStyle(color: Colors.black)),
              dropdownColor: Colors.red[800], // Dropdown menüsünün arka plan rengi
              items: <String>['Hepsi', 'Akdeniz Mutfağı', 'Türk Mutfağı', 'Kafe', 'Dünya Mutfağı', 'Tatlı']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRestaurantType = newValue;
                  _loadMarkers();
                });
              },
            ),
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _baslangicKonum,
              markers: Set<Marker>.of(_konumlar),
              onMapCreated: (GoogleMapController controller) {
                _haritaKontrol.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}

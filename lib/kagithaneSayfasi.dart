import 'dart:async';
import 'package:deneme20/KahveBahane.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:deneme20/Yorthusrestorant.dart';
import 'package:deneme20/DemirRestorant.dart';
import 'package:deneme20/ZeytinAdi.dart';
import 'package:deneme20/TatliDusler.dart';

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

  String _selectedRestaurantType = '';
  String _selectedRestaurant = '';
  double _rating = 0.0;
  String _description = '';
  bool _isYorThus = false;
  bool _isDemir = false;
  bool _isKahveBahane = false;
  bool _isZeytinAdi = false;
  bool _isTatliDusler = false;
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
      _createMarker('Zeytin_adi', LatLng(41.0897, 29.0092), 'Zeytin Bahçesi', 'Akdeniz’in Tadını Getiriyoruz', 4.3, 'Akdeniz mutfağından taze lezzetler sunan bu mekan, mükemmel bir yemek deneyimi sunar.'),
    );

    _restaurantTypes['Türk Mutfağı']?.addAll([
      _createMarker('Dönerci_Ustam', LatLng(41.0826, 29.0231), 'Dönerci Ustam', 'Hızlı ve lezzetli', 3.7, 'Klasik Türk dönerinin en lezzetli halini sunan mekan, hızlı servis anlayışıyla bilinir.'),
      _createMarker('Teker', LatLng(41.0912, 29.0163), 'Teker Restorant', 'Zarif bir ortamda unutulmaz lezzetler', 3.8, 'Ferah ve rahat ortamıyla yemeklerinizin keyfini çıkarabileceğiniz bir mekan.'),
      _createMarker('Demir', LatLng(41.1012, 29.0063), 'Demir Restorant', 'Şehirden kaçış, lezzetten keyif', 4.0, 'Doğal ve huzurlu atmosferiyle şehir hayatının karmaşasından uzaklaşmanızı sağlar.'),
    ]);

    _restaurantTypes['Kafe']?.addAll([
      _createMarker('Kahve_Bahane', LatLng(41.0832, 29.0185), 'Kahve Bahane', 'Keyifli Sohbetlerin Mekanı', 4.6, 'Zengin kahve çeşitleri ve taze tatlılarla dolu menümüzle dostlarınızla keyifli vakit geçirmenizi sağlar.'),
      _createMarker('Kahve_Durağı', LatLng(41.0891, 29.0128), 'Kahve Durağı', 'Her yudumda bir mola', 2.2, 'Şehirden uzak, rahat atmosferiyle lezzetli kahve çeşitleri sunar.'),
    ]);

    _restaurantTypes['Dünya Mutfağı']?.addAll([
      _createMarker('Karma_adi', LatLng(41.1407, 29.0584), 'Karma Sofrası', 'Dünya Mutfağından Seçmeler', 4.5, 'Farklı kültürlerden esinlenerek hazırlanan yemekleri sunar.'),
      _createMarker('YorThus', LatLng(41.0812, 29.0063), 'YorThus Restorant', 'Harika yemekler ve mükemmel bir atmosfer', 4.5, 'Sakin ve huzurlu atmosferi ile tanınır. Lezzetli yemeklerimiz ve özenle hazırlanmış menümüzle kaliteli hizmet sunar.'),
      _createMarker('Taze_Deniz', LatLng(41.0862, 29.0215), 'Taze Deniz', 'Denizin taptaze lezzetleri', 4.1, 'Deniz ürünlerinin en taze ve lezzetli halini sunar.'),
    ]);

    _restaurantTypes['Tatlı']?.add(
      _createMarker('Tatlı_Düşler', LatLng(41.0857, 29.0145), 'Tatlı Düşler', 'Her tatlı bir düş', 4.2, 'Birbirinden lezzetli ve taze tatlılarıyla bilinir.'),
    );

    _loadMarkers();
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
      _isDemir = id == 'Demir';
      _isKahveBahane = id == 'Kahve_Bahane';
      _isZeytinAdi = id == 'Zeytin_adi';
      _isTatliDusler = id == 'Tatlı_Düşler';
    });

    if (id == 'YorThus') {
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
    } else if (id == 'Demir') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DemirRestorant(
            title: _selectedRestaurant,
            description: _description,
            rating: _rating,
          ),
        ),
      );
    } else if (id == 'Kahve_Bahane') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => KahveBahane(
            title: _selectedRestaurant,
            description: _description,
            rating: _rating,
          ),
        ),
      );
    } else if (id == 'Zeytin_adi') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Zeytinadi(
            title: _selectedRestaurant,
            description: _description,
            rating: _rating,
          ),
        ),
      );
    } else if (id == 'Tatlı_Düşler') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TatliDusler(
            title: _selectedRestaurant,
            description: _description,
            rating: _rating,
          ),
        ),
      );
    }
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
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _selectedRestaurantType = value;
                _loadMarkers();
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: '', child: Text('Hepsi')),
                PopupMenuItem(value: 'Akdeniz Mutfağı', child: Text('Akdeniz Mutfağı')),
                PopupMenuItem(value: 'Türk Mutfağı', child: Text('Türk Mutfağı')),
                PopupMenuItem(value: 'Kafe', child: Text('Kafe')),
                PopupMenuItem(value: 'Dünya Mutfağı', child: Text('Dünya Mutfağı')),
                PopupMenuItem(value: 'Tatlı', child: Text('Tatlı')),
              ];
            },
          ),
        ],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _baslangicKonum,
        markers: Set<Marker>.of(_konumlar),
        onMapCreated: (GoogleMapController controller) {
          _haritaKontrol.complete(controller);
        },
      ),
    );
  }
}

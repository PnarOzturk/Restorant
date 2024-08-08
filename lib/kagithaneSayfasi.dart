import 'dart:async';
import 'package:deneme20/YorThusRestorant.dart'; // Doğru yolu buraya ekleyin
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // RatingBarIndicator için gerekli

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

  final List<Marker> _konumlar = [];
  String _selectedRestaurant = '';
  double _rating = 0.0; // Puan
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
    _konumlar.addAll([
      Marker(
        markerId: MarkerId('Teker'),
        position: LatLng(41.0912, 29.0163),
        infoWindow: InfoWindow(title: 'Teker Restorant',
          snippet: 'Zarif bir ortamda unutulmaz lezzetler',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Teker Restorant';
              _rating = 3.8;
              _description = '2000 yılından beri hizmetinizde olan Teker Restorant, ferah ve rahat ortamıyla yemeklerinizin keyfini çıkarabilmeniz için özenle tasarlandı. Lezzetli menümüz ve samimi hizmet anlayışımızla sizleri ağırlamaktan mutluluk duyuyoruz.';
            });
          },
        ),
      ),
    Marker(
    markerId: MarkerId('Karma_adi'),
    position: LatLng(41.1407, 29.0584), // Karma Sofrası konumu daha uzağa alındı
    infoWindow: InfoWindow(
    title: 'Karma Sofrası',
    snippet: 'Dünya Mutfağından Seçmeler',
    onTap: () {
    setState(() {
    _selectedRestaurant = 'Karma Sofrası';
    _rating = 4.5;
    _description = 'Karma Sofrası, 2010 yılından bu yana farklı kültürlerden esinlenerek hazırlanan yemekleri sunmaktadır. Global tatların birleştiği bu mekanda, her damak tadına uygun lezzetler bulabilirsiniz.';
    });
    },
    ),
    ),

    Marker(
    markerId: MarkerId('Kahve_adi'),
    position: LatLng(41.0832, 29.0185), // Kahve Bahane konumu daha uzağa alındı
    infoWindow: InfoWindow(
    title: 'Kahve Bahane',
    snippet: 'Keyifli Sohbetlerin Mekanı',
    onTap: () {
    setState(() {
    _selectedRestaurant = 'Kahve Bahane';
    _rating = 4.6;
    _description = 'Kahve Bahane, 2018 yılından bu yana hem kahve severlere hem de tatlı tutkunlarına keyifli anlar yaşatıyor. Zengin kahve çeşitleri ve taze tatlılarla dolu menümüz, dostlarınızla geçireceğiniz güzel anlara eşlik ediyor.';
    });
    },
    ),
    ),

    Marker(
    markerId: MarkerId('Dönerci_Ustam'),
    position: LatLng(41.0826, 29.0231), // Dönerci Ustam konumu daha uzağa alındı
    infoWindow: InfoWindow(
    title: 'Dönerci Ustam',
    snippet: 'Hızlı ve lezzetli',
    onTap: () {
    setState(() {
    _selectedRestaurant = 'Dönerci Ustam';
    _rating = 3.7;
    _description = '2000 yılından beri hizmet veren Dönerci Ustam, klasik Türk dönerinin en lezzetli halini hızlı servis anlayışıyla sunar. Kaliteden ödün vermeden hazırlanan lezzetli dönerlerimizle, size hem doyurucu hem de pratik bir yemek deneyimi sunuyoruz.';
    });
    },
    ),
    ),


    Marker(
    markerId: MarkerId('Zeytin_adi'),
    position: LatLng(41.0897, 29.0092), // Zeytin Bahçesi konumu daha uzağa alındı
    infoWindow: InfoWindow(
    title: 'Zeytin Bahçesi',
    snippet: 'Akdeniz’in Tadını Getiriyoruz',
    onTap: () {
    setState(() {
    _selectedRestaurant = 'Zeytin Bahçesi';
    _rating = 4.7;
    _description = 'Zeytin Bahçesi, 2005 yılından bu yana Akdeniz mutfağının en seçkin örneklerini sunmaktadır. Taze deniz ürünleri ve zeytinyağlı mezelerle zenginleşen menümüz, lezzet tutkunlarını bekliyor.';
    });
    },
    ),
    ),

      Marker(
        markerId: MarkerId('Taze_Deniz'),
        position: LatLng(41.0862, 29.0215), // Taze Deniz konumu daha uzağa alındı
        infoWindow: InfoWindow(
          title: 'Taze Deniz',
          snippet: 'Denizin taptaze lezzetleri',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Taze Deniz';
              _rating = 4.1;
              _description = '1997 yılından beri hizmet veren Taze Deniz, deniz ürünlerinin en taze ve lezzetli halini sunar. Sıcak atmosferi ve zengin deniz mahsulleri menüsüyle, denizin tadını çıkarmak isteyen misafirlerimize unutulmaz bir yemek deneyimi yaşatıyoruz.';
            });
          },
        ),
      ),

      Marker(
        markerId: MarkerId('Tatlı_Düşler'),
        position: LatLng(41.0857, 29.0145), // Tatlı Düşler konumu daha uzağa alındı
        infoWindow: InfoWindow(
          title: 'Tatlı Düşler',
          snippet: 'Her tatlı bir düş',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Tatlı Düşler';
              _rating = 4.2;
              _description = '2010 yılından beri hizmet veren Tatlı Düşler, birbirinden lezzetli ve taze tatlılarıyla bilinir. Pasta, kek, kurabiye ve daha fazlasını bulabileceğiniz pastanemiz, tatlı sevenlere her zaman sıcak ve tatlı bir mola sunuyor.';
            });
          },
        ),
      ),

      Marker(
        markerId: MarkerId('Kahve_Durağı'),
        position: LatLng(41.0891, 29.0128), // Kahve Durağı konumu daha uzağa alındı
        infoWindow: InfoWindow(
          title: 'Kahve Durağı',
          snippet: 'Her yudumda bir mola',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Kahve Durağı';
              _rating = 2.2;
              _description = 'Şehrin kalabalığından uzak, sıcak ve rahat atmosferiyle Kahve Durağı, 2015 yılından beri misafirlerine lezzetli kahve çeşitleri ve taze atıştırmalıklar sunuyor. Günün yorgunluğunu atmak ya da arkadaşlarınızla keyifli vakit geçirmek için ideal bir mekân.';
            });
          },
        ),
      ),


    Marker(
        markerId: MarkerId('Demir'),
        position: LatLng(41.1012, 29.0063),
        infoWindow: InfoWindow(
            title: 'Demir Restorant',
                snippet: 'Şehirden kaçış, lezzetten keyif',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'Demir Restorant';
              _rating = 4;
              _description = '2005 yılından bu yana sizlere hizmet eden Demir Restorant, doğal ve huzurlu atmosferiyle şehir hayatının karmaşasından uzaklaşmanızı sağlar. Lezzetli yemeklerimiz ve dikkatli servisimizle sizleri memnun etmek için buradayız.';
            });
          },



        ),
      ),
      Marker(
        markerId: MarkerId('YorThus'),
        position: LatLng(41.0812, 29.0063),
        infoWindow: InfoWindow(
          title: 'YorThus Restorant',
          snippet: 'Harika yemekler ve mükemmel bir atmosfer',
          onTap: () {
            setState(() {
              _selectedRestaurant = 'YorThus Restorant';
              _rating = 4.5;
              _description = '1995 yılından beri misafirlerine eşsiz bir deneyim sunan YorThus, sakin ve huzurlu atmosferi ile tanınır. Lezzetli yemeklerimiz ve özenle hazırlanmış menümüzle siz değerli konuklarımıza kaliteli bir hizmet sunmayı amaçlıyoruz.';
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
      body: Stack(
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
              child: GestureDetector(
                onTap: () {
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
            ),
        ],
      ),
    );
  }
}

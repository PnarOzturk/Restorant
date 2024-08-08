import 'dart:async'; //Asenkron kullanım icin gerekli kütüphane
import 'package:flutter/material.dart'; //Flutter matrial widgetsleri icin gerekli kütüphane
import 'package:google_maps_flutter/google_maps_flutter.dart'; //Google maps widgetsleri icin gerekli kütüphane
import 'package:permission_handler/permission_handler.dart'; //konum izni icin gerekli kütüphane

class KagithaneSayfasi extends StatefulWidget { //widgets durumuna baglı olarak degismesi icin
  @override
  _KagithaneSayfasiState createState() => _KagithaneSayfasiState(); //durum yönetimi icin state nesnesi olusturur
}

class _KagithaneSayfasiState extends State<KagithaneSayfasi> {
  final Completer<GoogleMapController> _haritaKontrol = Completer();
  final CameraPosition _baslangicKonum = CameraPosition(
    target: LatLng(41.0912, 29.0063),
    zoom: 14,
  ); //Harita kontrolleri icin gerekli sinif ve completer nesnesi olusturduk bu asenkron yönetmeyi saglar zoom oranı, kamera pozisyonu baslangic konumu vs.

  final List<Marker> _konumlar = [ //haritadaki konumlari gösteren liste olusturduk
    Marker(
      markerId: MarkerId('Teker'),
      position: LatLng(41.0912, 29.0163), // konumu ve restorant ismi id ayarlama
      infoWindow: InfoWindow(title: 'Teker Restorant'),
    ),
    Marker(
      markerId: MarkerId('Demir'),
      position: LatLng(41.1012, 29.0063), // konum ve restorant ismi id ayarlama
      infoWindow: InfoWindow(title: 'Demir Restorant'),
    ),
    Marker(
      markerId: MarkerId('YorThus'),
      position: LatLng(41.0812, 29.0063), // konum ve restorant ismi id ayari
      infoWindow: InfoWindow(title: 'YorThus Restorant'),
    ), //Harita üzerinden secilecek konum bilgileri idleri ve isimleri daha sonra tiklanabilir yapilmasi lazim
  ];

  @override
  void initState() { //Widget baslangic metotu izinler icin gerekli
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async { //asenkron fonksiyon kullanicidan konum isteme ve reddedilme durumlarını yönetmek icin
    final status = await Permission.location.request();
    if (status.isGranted) {
      print("Konuma izin verildi"); //izin verildiğinde cikan mesaj
    } else {
      print("Konum reddedildi"); //reddedildiginde cikan mesaj
    }
  }

  @override
  Widget build(BuildContext context) { //Widget agaci
    return Scaffold(
      appBar: AppBar( //üssteki bar
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
      body: GoogleMap( //body kismi , harita widgeti
        initialCameraPosition: _baslangicKonum,
        onMapCreated: (GoogleMapController controller) {
          _haritaKontrol.complete(controller);
        },
        markers: Set<Marker>.of(_konumlar),
      ),
    );
  }
}

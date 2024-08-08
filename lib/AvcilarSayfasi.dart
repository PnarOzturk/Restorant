import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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

  final List<Marker> _konumlar1 = [
    Marker(
      markerId: MarkerId('Sehnaz'),
      position: LatLng(40.9893, 28.7224),
      infoWindow: InfoWindow(title: 'Sehnaz Restorant'),
    ),
    Marker(
      markerId: MarkerId('Sirius'),
      position: LatLng(40.9793, 28.7134),
      infoWindow: InfoWindow(title: 'Sirius Restorant'),
    ),
    Marker(
      markerId: MarkerId('Ercel'),
      position: LatLng(40.9793, 28.7014),
      infoWindow: InfoWindow(title: 'Erçel Restorant'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      print("Konuma izin verildi");
    } else {
      print("Konum reddedildi");
    }
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
      body: GoogleMap(
        initialCameraPosition: _baslangicKonum,
        onMapCreated: (GoogleMapController controller) {
          _haritaKontrol.complete(controller);
        },
        markers: Set<Marker>.of(_konumlar1),
      ),
    );
  }
}

// avcilarSayfasi.dart
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

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      print("Location permission granted");
    } else {
      print("Location permission denied");
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
      ),
    );
  }
}

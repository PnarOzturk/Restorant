import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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
        title: Text('Kağıthane'),
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

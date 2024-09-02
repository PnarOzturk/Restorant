import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'kagithaneSayfasi.dart';
import 'avcilarSayfasi.dart';
import 'GirisYapSayfasi.dart';
import 'RezervasyonSayfasi.dart';
import 'YorumlarimSayfasi.dart'; // Yorumlarım sayfasını import edin.
import 'package:deneme20/data_initializer.dart'; // Dosya yolu

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Veri tabanını başlatmak için
  DataInitializer dataInitializer = DataInitializer();
  await dataInitializer.initializeData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text(
            "Restorant Bul",
            style: TextStyle(
              color: Colors.grey[200],
              fontFamily: 'Arial',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BodyContent(),
      ),
    );
  }
}

class BodyContent extends StatefulWidget {
  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  bool _showOptions = false;
  User? _user;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = currentUser;
    });
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      setState(() {
        _user = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Oturum kapatıldı!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Oturum kapatma başarısız: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fphonewallpaperhd.com%2Fwp-content%2Fuploads%2F2020%2F09%2FFood-iPhone-7-Wallpaper-HD.jpg&f=1&nofb=1&ipt=1784005682bb17849ea229afe9a5479f9815cb9af1806243394d13c17b02c9b6&ipo=imagess',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red[50]?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_user == null)
                  IconButton(
                    icon: Icon(Icons.login, size: 30, color: Colors.red[900]),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GirisYapSayfasi()),
                      );
                    },
                  ),
                if (_user == null)
                  Text(
                    "Giriş Yap",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    ),
                  ),
                if (_user != null) // Kullanıcı giriş yapmışsa
                  IconButton(
                    icon: Icon(Icons.logout, size: 30, color: Colors.red[900]),
                    onPressed: _signOut,
                  ),
                if (_user != null) // Kullanıcı giriş yapmışsa
                  IconButton(
                    icon: Icon(Icons.restaurant_menu, size: 30, color: Colors.red[900]), // Rezervasyon ikonu
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RezervasyonSayfasi()), // Rezervasyon sayfasına yönlendirme
                      );
                    },
                  ),
                if (_user != null) // Kullanıcı giriş yapmışsa
                  IconButton(
                    icon: Icon(Icons.comment, size: 30, color: Colors.red[900]), // Yorumlarım ikonu
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => YorumlarimSayfasi(currentUserEmail: _user!.email ?? ''), // Yorumlarım sayfasına yönlendirme
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.red[50]?.withOpacity(0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_user != null) // Eğer kullanıcı giriş yapmışsa
                  Text(
                    "Hoş Geldiniz, ${_user!.displayName ?? 'Kullanıcı'}",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                SizedBox(height: 20), // İkon ve metin arasında boşluk
                Text(
                  "Lütfen ilçeyi seçiniz",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10), // Metin ve dropdown menü arasında boşluk
                InkWell(
                  onTap: () {
                    if (_user != null) {
                      setState(() {
                        _showOptions = !_showOptions;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lütfen giriş yapınız')),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "İlçeler",
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          _showOptions ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          color: Colors.red[900],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_showOptions)
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 10),
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text("Kağıthane"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => KagithaneSayfasi()),
                            );
                          },
                        ),
                        ListTile(
                          title: Text("Avcılar"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AvcilarSayfasi()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

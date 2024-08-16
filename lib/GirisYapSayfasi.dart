import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'hesapOlusturSayfasi.dart';
import 'main.dart'; // Ana sayfa (main.dart) dosyasını içe aktar

class GirisYapSayfasi extends StatefulWidget {
  @override
  _GirisYapSayfasiState createState() => _GirisYapSayfasiState();
}

class _GirisYapSayfasiState extends State<GirisYapSayfasi> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _resetEmailController = TextEditingController(); // Şifre sıfırlama e-postası için

  void _navigateToCreateAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HesapOlusturSayfasi()),
    );
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Giriş Yapıldı!')),
      );
      // Giriş başarılı, ana sayfaya yönlendirme yapılabilir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()), // Ana sayfayı buraya ekleyin
      );
    } catch (e) {
      String errorMessage = 'Giriş başarısız';

      // Hata tipini kontrol et ve uygun mesajı al
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      } else {
        // FirebaseAuthException değilse, genel bir hata mesajı kullan
        errorMessage = e.toString();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  Future<void> _sendPasswordResetEmail() async {
    String email = _resetEmailController.text;

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Şifre sıfırlama e-postası gönderildi!')),
      );
    } catch (e) {
      String errorMessage = 'E-posta gönderme başarısız';

      // Hata tipini kontrol et ve uygun mesajı al
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      } else {
        // FirebaseAuthException değilse, genel bir hata mesajı kullan
        errorMessage = e.toString();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          "Giriş Yap",
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
          Positioned.fill(
            child: Image.network(
              'https://iphonexpapers.com/wp-content/uploads/papers.co-nu10-food-art-dessert-nature-41-iphone-wallpaper-240x519.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red[50]?.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Giriş Yap",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900],
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "E-posta",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text("Giriş Yap"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: _navigateToCreateAccount,
                      child: Text(
                        "Hesap Oluştur",
                        style: TextStyle(color: Colors.red[900]),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Şifre Sıfırlama'),
                            content: TextField(
                              controller: _resetEmailController,
                              decoration: InputDecoration(
                                labelText: "E-posta adresinizi girin",
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Gönder'),
                                onPressed: () {
                                  _sendPasswordResetEmail();
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('İptal'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(
                        "Şifremi Unuttum",
                        style: TextStyle(color: Colors.red[900]),
                      ),
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

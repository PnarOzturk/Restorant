import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'girisYapSayfasi.dart';

class HesapOlusturSayfasi extends StatefulWidget {
  @override
  _HesapOlusturSayfasiState createState() => _HesapOlusturSayfasiState();
}

class _HesapOlusturSayfasiState extends State<HesapOlusturSayfasi> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GirisYapSayfasi()),
    );
  }

  Future<void> _createAccount() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hesap Oluşturuldu!')),
      );
      // Hesap oluşturma başarılı, istenilen yere yönlendirme yapılabilir
      // Örneğin, giriş sayfasına yönlendirme yapılabilir
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => GirisYapSayfasi()),
      // );
    } catch (e) {
      String errorMessage = 'Hesap oluşturulamadı';

      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      } else {
        errorMessage = e.toString();
      }

      print("Kayıt hatası: $errorMessage"); // Hata mesajını konsola yazdırın
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
          "Hesap Oluştur",
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
                      "Hesap Oluştur",
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
                      onPressed: _createAccount,
                      child: Text("Hesap Oluştur"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: _navigateToLogin,
                      child: Text(
                        "Giriş Yap",
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

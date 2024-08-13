import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GirisYapSayfasi(),
  ));
}

class GirisYapSayfasi extends StatefulWidget {
  @override
  _GirisYapSayfasiState createState() => _GirisYapSayfasiState();
}

class _GirisYapSayfasiState extends State<GirisYapSayfasi> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _navigateToCreateAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HesapOlusturSayfasi()),
    );
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
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Kullanıcı Adı",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
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
                      onPressed: () {
                        // Giriş yap butonuna tıklama işlevi
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        // Burada giriş yapma işlemini yapabilirsiniz
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Kullanıcı Adı: $username, Şifre: $password')),
                        );
                      },
                      child: Text("Giriş Yap"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: _navigateToCreateAccount,
                      child: Text(
                        "Hesap Oluştur",
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
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

class HesapOlusturSayfasi extends StatefulWidget {
  @override
  _HesapOlusturSayfasiState createState() => _HesapOlusturSayfasiState();
}

class _HesapOlusturSayfasiState extends State<HesapOlusturSayfasi> {
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  void _createAccount() {
    String email = _emailController.text;
    String password1 = _passwordController1.text;
    String password2 = _passwordController2.text;

    if (password1 == password2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt Başarılı!')),
      );
      // Burada hesap oluşturma işlemini yapabilirsiniz
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Şifreler uyuşmuyor!')),
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
                      controller: _passwordController1,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifre",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController2,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifre (Tekrar)",
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

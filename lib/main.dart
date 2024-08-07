// main.dart
import 'package:flutter/material.dart';
import 'kagithaneSayfasi.dart';
import 'avcilarSayfasi.dart';

void main() {
  runApp(MaterialApp(
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
  ));
}

class BodyContent extends StatefulWidget {
  @override
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  bool _showOptions = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fphonewallpaperhd.com%2Fwp-content%2Fuploads%2F2020%2F09%2FFood-Wallpaper-for-Phones.jpg&f=1&nofb=1&ipt=0acab9ec1efcf19a0d30c5f83338af0afdb2400cfeae82c1137c510b7914a9aa&ipo=images',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.red[50]?.withOpacity(0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Lütfen ilçeyi seçiniz",
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      _showOptions = !_showOptions;
                    });
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

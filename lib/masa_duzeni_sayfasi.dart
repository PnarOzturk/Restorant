import 'package:flutter/material.dart';

class MasaDuzeniSayfasi extends StatefulWidget {
  @override
  _MasaDuzeniSayfasiState createState() => _MasaDuzeniSayfasiState();
}

class _MasaDuzeniSayfasiState extends State<MasaDuzeniSayfasi> {
  final List<String> masaResimleri = [
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pinclipart.com%2Fpicdir%2Fmiddle%2F555-5552547_thumb-image-restaurant-tables-icon-clipart.png&f=1&nofb=1&ipt=7009ed5380b63e0799825687cdd1e927e4ade4262ca2ba2cea61b4fe915b2aa3&ipo=images',
  ];



  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masa Düzeni'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Lütfen bir masa seçin:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 8 masa için 4 sütun
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: masaResimleri.length, // Masa resimlerinin sayısı
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(masaResimleri[index]), // Resim URL'si
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: selectedIndex == index ? Colors.blue : Colors.transparent,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Köşeleri yuvarlama
                      ),
                      child: Center(
                        child: Text(
                          'Masa ${index + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 18, backgroundColor: Colors.black54),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedIndex == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Lütfen masa seçiniz')),
                  );
                } else {
                  // Masa seçildikten sonra yapılacak işlemler
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(), // Devam edilecek sayfa
                    ),
                  );
                }
              },
              child: Text('Devam Et', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900], // Buton rengi
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rezervasyon Yap'),
      ),
      body: Center(
        child: Text('Masa seçimi tamamlandı!'),
      ),
    );
  }
}

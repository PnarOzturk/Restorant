import 'package:flutter/material.dart';

class MasaDuzeniSayfasi extends StatefulWidget {
  @override
  _MasaDuzeniSayfasiState createState() => _MasaDuzeniSayfasiState();
}

class _MasaDuzeniSayfasiState extends State<MasaDuzeniSayfasi> {
  final List<String> masaResimleri = List.generate(
    16,
        (index) => 'assets/bos_masa.png',
  );

  int? selectedIndex;
  int? selectedCapacity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masa Düzeni'),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.42mjrUD9by0aAc4aQoH8sQHaNK%26pid%3DApi&f=1&ipt=1b9eb1ae6b3bffe9cf44b767df3db70c2f745d27ed3e1ca1f690669e948ff94e&ipo=images',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                color: Colors.red[50]?.withOpacity(0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lütfen kaç kişilik masa seçmek istediğinizi belirtin:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    DropdownButton<int>(
                      value: selectedCapacity,
                      hint: Text('Masa seçiniz', style: TextStyle(color: Colors.black)),
                      items: [1, 2, 3, 4].map((capacity) {
                        return DropdownMenuItem<int>(
                          value: capacity,
                          child: Text('$capacity kişilik masa'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCapacity = value;
                        });
                      },
                      dropdownColor: Colors.red[50]?.withOpacity(0.8),
                      style: TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 sütun
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: masaResimleri.length, // Masa resimlerinin sayısı
                  itemBuilder: (context, index) {
                    final isSelectedCapacity = ((index ~/ 4) + 1) == selectedCapacity || selectedCapacity == null;

                    return Visibility(
                      visible: isSelectedCapacity,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // Reset previously selected table
                            if (selectedIndex != null) {
                              masaResimleri[selectedIndex!] = 'assets/bos_masa.png';
                            }
                            // Set the new selected table
                            selectedIndex = index;
                            masaResimleri[index] = 'assets/secili_masa.png';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(masaResimleri[index]),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: selectedIndex == index ? Colors.blue : Colors.transparent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0), // Köşeleri yuvarlama
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == null || selectedCapacity == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lütfen masa seçiniz')),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RezervasyonSayfasi(),
                        ),
                      );
                    }
                  },
                  child: Text('Rezervasyon Yap', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900], // Buton rengi
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RezervasyonSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rezervasyon Yap'),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Text(
          'Rezervasyon Yapıldı!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

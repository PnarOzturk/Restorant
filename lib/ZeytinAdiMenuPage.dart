import 'package:flutter/material.dart';

class ZeytinAdiMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(
          'Zeytin Adı Menüsü',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Arial',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://iphonexpapers.com/wp-content/uploads/papers.co-nm20-flower-food-table-life-41-iphone-wallpaper-240x519.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Akdeniz Yemekleri
              Text(
                'Akdeniz Yemekleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[50],
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Yunan Salatası',
                'Domates, salatalık, zeytin, feta peyniri ve zeytinyağı ile yapılan taze salata.',
                180.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.rDEr-OWBke8XvBS3g3D-BAHaE8%26pid%3DApi&f=1&ipt=162e36cce74430c541b224e61008fe72feee3a0ce6d09f6463b0b8edc667f772&ipo=images',
              ),
              _buildMenuItem(
                'Falafel',
                'Kızartılmış nohut köftesi, genellikle humus ile servis edilir.',
                180.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.A6vm3i-aJbSVVZOMSPuSLwHaHa%26pid%3DApi&f=1&ipt=90122f33eca72d617524a59e9ea6759884c2a8316fce1f491037478bc291ccfc&ipo=images'
              ),
              _buildMenuItem(
                'Humus',
                'Nohut püresi, tahin, limon suyu ve zeytinyağı ile yapılan bir meze.',
                170.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.QUce6fF1CboEiz_LCEMs7QHaE8%26pid%3DApi&f=1&ipt=4a4f1445db417675034436e86f5c2bfa174af825549ffec296c6bdb931a2dc48&ipo=images'
              ),
              _buildMenuItem(
                'Tabouleh',
                'Kısır, domates, maydanoz ve limon suyu ile yapılan taze bir salata.',
                90.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.FAhK272wlcQA_NPyHAD_BAHaHa%26pid%3DApi&f=1&ipt=a674f2fe9bcc679be0b1b2c6c6a9091b28cfd7d819a6bbda2b1e478db9bf0a14&ipo=images'
              ),
              _buildMenuItem(
                'Dolma',
                'Asma yaprağında sarılı pirinç ve baharatlarla hazırlanan bir meze.',
                95.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.w7gOHVv-6j2Z_KL2sQHh2gHaE7%26pid%3DApi&f=1&ipt=798da09324474c083fe0e9672448ce5dc9f498fc5df7137eb095c0917466a637&ipo=images'
              ),

              SizedBox(height: 16),
              // Tatlılar
              Text(
                'Tatlılar',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[50],
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Baklava',
                'Şerbetli, ince açılmış hamur katmanları ile yapılan tatlı.',
                120.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.DE8UGDCWQgKdkQTFnEouIQHaEk%26pid%3DApi&f=1&ipt=e66d33508092671a9162672d3f1743cb6e1a968e76c7a634673dc76e1b1dd697&ipo=images'
              ),
              _buildMenuItem(
                'Künefe',
                'İnce tel kadayıf ve peynir ile yapılan tatlı.',
                110.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F72%2Fe4%2F61%2F72e4611554fc5fea47e8453911507dc5.jpg&f=1&nofb=1&ipt=e0d58a088eedc642d977735cee8a9fb17e64d5d43ff17d147d1fc89ff3d7e5d3&ipo=images'
              ),
              _buildMenuItem(
                'Revani',
                'Yumurta, yoğurt ve irmik ile yapılan hafif tatlı.',
                125.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.wRJfec8ZUAeBJDA5xr8kLQHaE8%26pid%3DApi&f=1&ipt=f6ec3d96686477bdfb242c443a250654473929d0bb117fc8cf4be60780c3b774&ipo=images'
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String name, String description, double price, String imageUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.teal[100],
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Image.network(
          imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal[800],
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.teal[600],
          ),
        ),
        trailing: Text(
          '₺${price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal[800],
          ),
        ),
      ),
    );
  }
}

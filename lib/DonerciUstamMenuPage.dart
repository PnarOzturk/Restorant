import 'package:flutter/material.dart';

class DonerciUstamMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text(
          'Dönerci Ustam Menüsü',
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
            image: NetworkImage('https://iphonexpapers.com/wp-content/uploads/papers.co-mj88-steakhouse-food-delicious-41-iphone-wallpaper-240x519.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Menü başlığı
              Text(
                'Türk Döner Lezzetleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Döner Kebabı',
                'Izgara döner eti, taze sebzeler ve yoğurt sosu ile servis edilir.',
                70.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.qGkx5soytBkZfB-is8SNaAHaEO%26pid%3DApi&f=1&ipt=15be702080ad380c8895aa0eb66c83c177f2a8472940cc9ae2cdb86d987323eb&ipo=images',
              ),
              _buildMenuItem(
                'İskender Kebabı',
                'Döner etinin üzerine yoğurt ve domates sosu eklenmiş, pide üzerine servis edilir.',
                85.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.PpjDEuz4zhH-3qgG3eZmsAHaE8%26pid%3DApi&f=1&ipt=1a1318098089dfb12d057c8d1f677c7045e885ffb87c07d22b02319102306eba&ipo=images',
              ),
              _buildMenuItem(
                'Döner Wrap',
                'Döner eti, marul, domates, soğan ve özel sosla dürüm ekmeğine sarılmış.',
                55.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.ULboBnmHzIZ0ZLf12ttXvwHaFP%26pid%3DApi&f=1&ipt=2502e29f1a793bff036fae1c48d0bc3b81d236889f7081262ab3e1ed877f86ad&ipo=images',
              ),
              _buildMenuItem(
                'Döner Pide',
                'Döner eti, kaşar peyniri ve baharatlarla yapılan pide.',
                60.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.IEUpxmOUod-DKWO96XmzQwHaFa%26pid%3DApi&f=1&ipt=826c0bf6a1499b8f6eb98c2a5d45095253ccb8b9d6ec23b2448439fff280641c&ipo=images',
              ),
              _buildMenuItem(
                'Çıtır Patates',
                'Kızarmış patates dilimleri, tuz ve baharatlarla.',
                30.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.Q8Tkq-t1a1-55y-UsQ5fkwHaE7%26pid%3DApi&f=1&ipt=bb0eeda4c2bf83081e2308ef9f2d1b51c471a6e4067cbf5981db2a17ba829b8f&ipo=images',
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
      color: Colors.orange,
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: Text(
          '₺${price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}

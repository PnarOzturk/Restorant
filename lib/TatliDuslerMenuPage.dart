import 'package:flutter/material.dart';

class TatliDuslerMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: Text(
          'Tatlı Düşler Menüsü',
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
            image: NetworkImage('https://iphonexpapers.com/wp-content/uploads/papers.co-nb57-food-stylist-dessert-berry-cake-bokeh-flare-41-iphone-wallpaper-240x519.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Tatlı Türleri
              Text(
                'Tatlı Türleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[50],
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Cheesecake',
                'Klasik New York usulü cheesecake.',
                125.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.wSauSufUFp0gemuQWZLguAHaKk%26pid%3DApi&f=1&ipt=ad7bd85862cc17fef85b743ff6a1cb3f989df7a3e2d4f1ec55ccf6c841348c24&ipo=images',
              ),
              _buildMenuItem(
                'Brownie',
                'Çikolatalı yoğun kek.',
                120.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.mFlCVVXIBwZeoofrsRAIzgAAAA%26pid%3DApi&f=1&ipt=86e2015b12f3ce58a707e6232f981201dde4001e247d3c12d62786088502d7a1&ipo=images',
              ),
              _buildMenuItem(
                'Baklava',
                'İnce açılmış yufka ve cevizle yapılan tatlı.',
                150.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.iw16IqRScV1c8oMKUyqEegHaEo%26pid%3DApi&f=1&ipt=d72a95e7d6de4dc8370c79fedfb9702fdee3a6fa1aaaa26a438bcf3a233e095a&ipo=images',
              ),
              _buildMenuItem(
                'Sufle',
                'Çikolata ile hazırlanan sıcak tatlı.',
                135.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.M9qSIaMNK8VcAK-Xhg4TtgHaE8%26pid%3DApi&f=1&ipt=4a046da02d099d4b0bf899f254ecf39324b887db47b9e0db7c0b81c42df0a03f&ipo=images',
              ),
              _buildMenuItem(
                'Panna Cotta',
                'İtalyan vanilyalı kremalı tatlı.',
                140.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.j6JMveBuLi6OhV0-awpkowHaE3%26pid%3DApi&f=1&ipt=86dd11a19791a36d07d47e79baedbcac21001fbcc71739f2a2d03357054f55f6&ipo=images',
              ),
              _buildMenuItem(
                'Kabak Tatlısı',
                'Tatlı kabak ve cevizle hazırlanan geleneksel tatlı.',
                110.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.SYtsdPfe8CiP-cXQ3OlNqQHaFj%26pid%3DApi&f=1&ipt=54c120e98b2c250053bf8485f22c85820f95bc5263a42745fce5dea21e196048&ipo=images',
              ),
              _buildMenuItem(
                'Muzlu Ekler',
                'Muz ve krema dolgulu tatlı ekler.',
                95.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.1RHWRR8yN4Ln7Y8Rs18AvAHaE7%26pid%3DApi&f=1&ipt=132ae782e942c59e81e56d78494001b559859a6a7b069067a55cc56a4e480770&ipo=images',
              ),
              _buildMenuItem(
                'Tiramisu',
                'Kahveli ve kremalı tatlı.',
                122.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.oVD-U2G5OMDxlAaDAngpvwHaEt%26pid%3DApi&f=1&ipt=e8efc63a7985aed3b17d6f5ef8ba84291a973afe0b3a125e45090a3b6909050d&ipo=images',
              ),
              SizedBox(height: 16),
              // Soğuk Tatlılar
              Text(
                'Soğuk Tatlılar',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[50],
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Frozen Yogurt',
                'Buzlu yoğurt, çeşitli meyve ve soslarla.',
                130.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.Gc89GY845jbwldXeUbP6UQHaFj%26pid%3DApi&f=1&ipt=cb817f3da37590deb08247efb9fb856fea6bd14f101ddbe1dbe5732a74ffa475&ipo=images',
              ),

              _buildMenuItem(
                'Buzlu Çikolata',
                'Buzlu çikolata tatlısı, soğuk ve hafif.',
                140.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.bg9GlTBbrLKygppmN9g2KAHaE7%26pid%3DApi&f=1&ipt=7b586bd54346c4b854b7c9797ebb0eff249550cdf9a6ebcabc82c0ab581dc5a9&ipo=images',
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
      color: Colors.pink[100],
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
            color: Colors.brown[800],
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown[600],
          ),
        ),
        trailing: Text(
          '₺${price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
      ),
    );
  }
}

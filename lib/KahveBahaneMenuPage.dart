import 'package:flutter/material.dart';

class KahveBahaneMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text(
          'Kahve Bahane Menüsü',
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
            image: NetworkImage('https://iphonexpapers.com/wp-content/uploads/papers.co-oc51-coffee-drop-cup-nature-41-iphone-wallpaper-240x519.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Kahve Türleri
              Text(
                'Kahve Türleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[50],
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Espresso',
                'Küçük bir fincanda yoğun bir kahve.',
                70.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.iuXuV3I1W9x3H6EVzOa8XwHaHa%26pid%3DApi&f=1&ipt=0353732fb0652e6825acad6145f71035cea448ebc389e7636ecff179fe3cdd7d&ipo=images',
              ),
              _buildMenuItem(
                'Latte',
                'Süt ve espresso karışımı hafif kahve.',
                100.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.fB1Jla1T85SYand_FZMnWAHaHa%26pid%3DApi&f=1&ipt=960dcaa6fe6b4f1d5b0071c51f364078a0d70fdd5e851e1b9276d080871304c5&ipo=images',
              ),
              _buildMenuItem(
                'Cappuccino',
                'Süt köpüğü ile hazırlanan klasik kahve.',
                80.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.M0QuWKdFA8fO9PxDek68jgHaHa%26pid%3DApi&f=1&ipt=c86362da45e262d10bca7532e2ca07611588154a40995ffebea37726390e206e&ipo=images',
              ),
              _buildMenuItem(
                'Americano',
                'Uzun süzülmüş espresso.',
                60.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.b8mcVsKN0iu8SFn-nqslUgHaFw%26pid%3DApi&f=1&ipt=9086b74bc630fe81e12977d7917cf1ca25cc7f9eebfe2af91af90f3385e7a6ea&ipo=images',
              ),
              Text(
                'Soğuk Kahve Çeşitleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[50],
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Cold Brew',
                'Soğuk demleme kahve, hafif ve pürüzsüz.',
                125.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.sYiAg-6HlI2yJp7YVgq7zwHaHa%26pid%3DApi&f=1&ipt=8857bd3249d7f7dc31798c7fa87af8b8cc4061321c5fc160a1ca5ec69fece753&ipo=images',
              ),
              _buildMenuItem(
                'Iced Latte',
                'Süt ve espresso karışımının buzla servis edilmesi.',
                122.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.twFiOuH40XOSoLCrEawBHwHaJQ%26pid%3DApi&f=1&ipt=c10cfe7513023186115fae03c395e5f9d4c1c8f5c8ec5d8043d7cbd1a31c15b7&ipo=images',
              ),
              _buildMenuItem(
                'Iced Americano',
                'Buzlu Americano, serinletici bir seçenek.',
                90.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.tGvxupLFkMNe1zRrQh-y9wHaHa%26pid%3DApi&f=1&ipt=a60823708ebaa6bd1d354e9936fcb9fddff264189396b055fe281a6da756f3c7&ipo=images',
              ),

              SizedBox(height: 16),
              // Tatlılar
              Text(
                'Tatlılar',
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
                'Tiramisu',
                'Kahveli ve kremalı tatlı.',
                122.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.oVD-U2G5OMDxlAaDAngpvwHaEt%26pid%3DApi&f=1&ipt=e8efc63a7985aed3b17d6f5ef8ba84291a973afe0b3a125e45090a3b6909050d&ipo=images',
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
      color: Colors.brown[100],
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

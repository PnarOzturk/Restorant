import 'package:flutter/material.dart';
import 'menu_item.dart'; // Import the MenuItem class

class DemirRestorantMenuPage extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Kuzu Tandır',
      description: 'Fırında pişirilmiş kuzu tandır, sebzelerle servis edilir.',
      price: 120.0,
      imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.fJwJdRHIy7r2XTU2uRs6WQHaFj%26pid%3DApi&f=1&ipt=c49ff747ce04051f78fc06d22a96297e6a33688c2974777bf92e4a5d407b23e1&ipo=images',
    ),
    MenuItem(
      name: 'Bonfile',
      description: 'Izgara bonfile, patates püresi ve sebzelerle servis edilir.',
      price: 140.0,
      imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.yyhLTq_ngJmazJ4njGXouwHaEo%26pid%3DApi&f=1&ipt=74e6a8590e95b0bc397dfde695a9ed5fb604c604498d3b6687aeb9e68c67c9f7&ipo=images',
    ),
    MenuItem(
      name: 'Mercimek Çorbası',
      description: 'Lezzetli mercimek çorbası, taze ekmekle servis edilir.',
      price: 50.0,
      imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.hQXoa5T2h2sdhHVXSSnJ1AHaFv%26pid%3DApi&f=1&ipt=2a0f9dedfc960981f4411a23ab0deb52065c8ff1a81cea86ee463ae78e434112&ipo=images',
    ),
    MenuItem(
      name: 'Çikolatalı Sufle',
      description: 'Sıcak çikolatalı sufle, vanilyalı dondurmayla servis edilir.',
      price: 30.0,
      imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.VqCHwpQ8VbXsNvq37EH0AwHaEt%26pid%3DApi&f=1&ipt=b3e258518c8cf8383d5224aab0fc17296bbaae6e4e8edac48372371d99eba51e&ipo=images',
    ),
    // Add more menu items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Demir Restorant Menü',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF5C0909),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://iphonexpapers.com/wp-content/uploads/papers.co-mj88-steakhouse-food-delicious-41-iphone-wallpaper-240x519.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final item = menuItems[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.black.withOpacity(0.7),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12.0),
                  leading: Image.network(item.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                  title: Text(item.name, style: TextStyle(color: Colors.white, fontSize: 18)),
                  subtitle: Text(item.description, style: TextStyle(color: Colors.white70)),
                  trailing: Text('${item.price}₺', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

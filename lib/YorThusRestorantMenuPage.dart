import 'package:flutter/material.dart';
import 'menu_item.dart'; // Menü item modelini ekleyin

class YorThusRestorantMenuPage extends StatelessWidget {
  final List<MenuItem> mainDishes = [
    MenuItem(name: 'Izgara Köfte', description: 'Izgara köfte, patates kızartması ve salata ile servis edilir.', price: 185.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.S8nBewveFLUo77s0dzoMgwHaE8%26pid%3DApi&f=1&ipt=4d8b63b228b48ab6a212dd9cab0015e53d66e6551b6bc6b6ae9f2175a71fa805&ipo=images'),
    MenuItem(name: 'Kuzu Tandır', description: 'Fırında pişirilmiş kuzu tandır, pilav ve yoğurt ile servis edilir.', price: 220.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.fJwJdRHIy7r2XTU2uRs6WQHaFj%26pid%3DApi&f=1&ipt=051c88c3c1bc4a22b591c32915e4d28fbf0d9172c5c6917ae2f0d7098e043bc9&ipo=images'),
    MenuItem(name: 'Tavuk Şiş', description: 'Izgara tavuk şiş, bulgur pilavı ve yoğurt sosu ile servis edilir.', price: 195.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.hA53L6h8Iyl96gkGEjJWbgAAAA%26pid%3DApi&f=1&ipt=2e4fe1748a299e0b946898e315fd5f341004cf45331d5582f9cbd8cd5def8265&ipo=images'),
    MenuItem(name: 'Bonfile', description: 'Izgara bonfile, sebzeler ve patates püresi ile servis edilir.', price: 250.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.yyhLTq_ngJmazJ4njGXouwHaEo%26pid%3DApi&f=1&ipt=5fa5006873594cf618e9d279bae430cea584928ba36a8b3ced19edb8f7dfc51a&ipo=images'),
    MenuItem(name: 'Levrek Izgara', description: 'Izgara levrek, roka salatası ve zeytinyağlı sebzeler ile servis edilir.', price: 210.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.7rxt0yl9GnYgtv36Qa84VAHaE7%26pid%3DApi&f=1&ipt=8990b020f826af3069d2d15d58b636657bc1fda4047182bbcd008b06ee815d41&ipo=images'),
  ];

  final List<MenuItem> appetizers = [
    MenuItem(name: 'Humus', description: 'Nohut, tahin, zeytinyağı ve baharatlar ile yapılan humus.', price: 130.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.WLGcPk_Ns1MMaTJ8xYeB7QHaEl%26pid%3DApi&f=1&ipt=53f1f8db3908edcd3a4e580e5e24e96af5aee27781e09d98133c4c9662ffc086&ipo=images'),
    MenuItem(name: 'Cızlak Börek', description: 'Peynir ve otlarla doldurulmuş çıtır börek.', price: 140.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.eD5uvR0iu-Y6ZjTJLmTrJgHaFj%26pid%3DApi&f=1&ipt=0f8427a3f5c2ce50890261d20b4e81e47d306128ff0c40da3a9dd88265405008&ipo=images'),
    MenuItem(name: 'Kısır', description: 'Bulgur, domates, salatalık ve baharatlarla yapılan kısır.', price: 125.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.uxuP4rCq8escuNfxyw-VUQHaE8%26pid%3DApi&f=1&ipt=3526420ce3a731451a7a49fdc742cbbabe4ae8b0940d0e017f523b1a58ce3623&ipo=images'),
    MenuItem(name: 'Sigara Böreği', description: 'Peynir ve maydanoz ile doldurulmuş kızarmış börek.', price: 135.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.42xnmJniRH3kmON9M8paxAHaE7%26pid%3DApi&f=1&ipt=26e8618b1a6e22073fa7900ff63c1e3e933c8c2d557c0ae285041187d821d607&ipo=images'),
    MenuItem(name: 'Zeytinyağlı Enginar', description: 'Zeytinyağında pişirilmiş enginar kalbi.', price: 128.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.eswT1fcn_9pbTHvi1eUPOwHaE7%26pid%3DApi&f=1&ipt=2ee285c3e58e3365ce90eeb90f987a78ae5b554a1289d6bd85b6bb4cacf82eac&ipo=images'),
  ];

  final List<MenuItem> salads = [
    MenuItem(name: 'Caesar Salata', description: 'Marullarla yapılan klasik Caesar salata, tavuk, kruton ve parmesan ile.', price: 150.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.izaQn_w1D5VgqXNRfVogfwHaE8%26pid%3DApi&f=1&ipt=14f9afbcd6d54790f701352053f45f3b354ce5e0bdbf322a7e4295b32e170c42&ipo=images'),
    MenuItem(name: 'Yunan Salatası', description: 'Domates, salatalık, zeytin ve feta peyniri ile yapılan Yunan salatası.', price: 145.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.lvgk1VGReANF80ee_h279wEsCp%26pid%3DApi&f=1&ipt=bb91a3166538c45885dc5fd28ac0cc5d40be2e5a3014f11144e8383b96f228bd&ipo=images'),
    MenuItem(name: 'Akdeniz Salatası', description: 'Akdeniz yeşillikleri ve sebzeleri ile yapılmış salata.', price: 140.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.eAVWpNFGNai8nxwlBycTzQHaFj%26pid%3DApi&f=1&ipt=d9618738737f9eacbb90b9e5a845bc014a60b0c73dfb6ebad56c5183b1b68d67&ipo=images'),
    MenuItem(name: 'Mevsim Salatası', description: 'Mevsim sebzeleri ile yapılan taze salata.', price: 130.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.0EJdbgD7Mia3aQQwalrvvwHaFj%26pid%3DApi&f=1&ipt=9b875c81a456973038ef714bef20656065fd8518d87452c6ee3a18a46e7a4917&ipo=images'),
  ];

  final List<MenuItem> desserts = [
    MenuItem(name: 'Baklava', description: 'Fıstık ve bal katmanlarına sahip yufka hamuru.', price: 135.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.6r1V6UOauaaUj4O7eL4gSQHaE8%26pid%3DApi&f=1&ipt=bf5cd6cd5f704f59aa2aaa4c13437e4b8505f0bf8c34b3aa434e470ce3db06a5&ipo=images'),
    MenuItem(name: 'Künefe', description: 'Şerbetle ıslatılmış tatlı peynir hamuru.', price: 140.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.explicit.bing.net%2Fth%3Fid%3DOIP.hsFqlAlB0bE9cX1I2VIosAHaE8%26pid%3DApi&f=1&ipt=247d93319d7c362beba0dba5d552fd4cdf647d8b2efa864db6a167a0dab1817a&ipo=images'),
    MenuItem(name: 'Profiterol', description: 'Kremalı hamur topları üzerine çikolata sosu.', price: 145.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.haFbWRbirMDa6qu_cVZC6AHaFj%26pid%3DApi&f=1&ipt=d77c5866994c2cbce025e2447d1028fea99619ee31d7389d34bb2a38f1f93193&ipo=images'),
    MenuItem(name: 'Sütlaç', description: 'Vanilya aromalı pirinç pudingi.', price: 130.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.BqJnAf4OSgYALol0nNYgwwHaE7%26pid%3DApi&f=1&ipt=fbda556d363fc270bcd7549dabaa8fc7864f215e831901fc1d710f1405dfaf5c&ipo=images'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YorThus Restorant Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[800], // Arka plan rengini değiştirdim
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSection('Ana Yemekler', mainDishes),
            buildSection('Ara Sıcaklar', appetizers),
            buildSection('Salata', salads),
            buildSection('Tatlı', desserts),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<MenuItem> items) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.black12, // Arka plan rengini değiştirdim
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          ...items.map((item) => buildMenuItem(item)).toList(),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.black38, // Yiyecek kutularının arka plan rengini değiştirdim
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.network(
            item.imageUrl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  item.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '\₺${item.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

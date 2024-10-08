import 'package:flutter/material.dart';
import 'menu_item.dart'; // Menü item modelini ekleyin

class YorThusRestorantMenuPage extends StatelessWidget {
  final String restaurantId; // Restoran kimliğini ekle

  YorThusRestorantMenuPage({required this.restaurantId}); // Kimliği al

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
    MenuItem(name: 'Yunan Salatası', description: 'Domates, salatalık, zeytin ve feta peyniri ile yapılan Yunan salatası.', price: 145.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.lvgk1VGReANF80ee_h279wEsCp%26pid%3DApi&f=1&ipt=bb91a3166538c45885dc5fd28ac0cc5d40be2e5a3014f11144e8383f23eb33b1&ipo=images'),
    MenuItem(name: 'Meksika Salatası', description: 'Meksika fasulyesi, avokado, mısır ve taze kişniş ile yapılan salata.', price: 160.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.Kd-cHvGry7g8WlbNBd5TnAHaE8%26pid%3DApi&f=1&ipt=2d4c394cd6f1bffbe12e8e84d458c1a8cf0620b77ac82a69e8d08f8f90f748fc&ipo=images'),
    MenuItem(name: 'Kinoalı Salata', description: 'Kinoa, avokado, domates ve roka ile yapılan sağlıklı salata.', price: 155.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.0jWKrZzyynLp8Q06NU3z-QHaE8%26pid%3DApi&f=1&ipt=2bbfa15bfa21946df9b1f8c5b177b0b8b11d27e58c9609e95d8cf5b5fa596fd0&ipo=images'),
    MenuItem(name: 'Roka Salatası', description: 'Taze roka, nar ekşisi ve ceviz ile yapılan salata.', price: 140.0, imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.fkE_wosF3mbTbRJ7Zscc4QHaFj%26pid%3DApi&f=1&ipt=77a0d9d3c7e7410ba9ad7a267a9acb8999ff7fa2fdc0c7b5c72d4e9493024c4c&ipo=images'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YorThus Restoran Menüsü'),
      ),
      body: ListView(
        children: <Widget>[
          Section(title: 'Ana Yemekler', items: mainDishes),
          Section(title: 'Mezeler', items: appetizers),
          Section(title: 'Salatalar', items: salads),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<MenuItem> items;

  Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ...items.map((item) => ListTile(
          leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(item.name),
          subtitle: Text(item.description),
          trailing: Text('\$${item.price.toStringAsFixed(2)}'),
        )),
      ],
    );
  }
}

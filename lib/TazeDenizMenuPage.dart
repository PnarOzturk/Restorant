import 'package:flutter/material.dart';

class TazeDenizMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(
          'Taze Deniz Menüsü',
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
            image: NetworkImage('https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fc1.wallpaperflare.com%2Fpreview%2F558%2F891%2F711%2Fseafood-food-healthy-sea.jpg&f=1&nofb=1&ipt=663391d4f478fda256e659293dedc641ed3c2df458436727bd34d8df64e2bdeb&ipo=images'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Menü başlığı
              Text(
                'Akdeniz Lezzetleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              _buildMenuItem(
                'Fırınlanmış Kalamar',
                'Taze kalamar halkaları, limon ve sarımsak ile fırınlanmış.',
                85.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.cbJWKnBaVGnoKrCHG1BrVAHaEK%26pid%3DApi&f=1&ipt=331d5665c476c77406e7681181f7ac565c40874d3f057447661863a7e16d226b&ipo=images',
              ),
              _buildMenuItem(
                'Deniz Ürünleri Salatası',
                'Mevsim yeşillikleri ile taze deniz ürünleri.',
                95.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.O75_-CL8m3g0p4Cb3di1BgHaEo%26pid%3DApi&f=1&ipt=ece9350a10f8db7133e25f08ae936fbc18725c39d3d18a0d77c68a26ce4a2070&ipo=images',
              ),
              _buildMenuItem(
                'Izgara Somon',
                'Izgara somon fileto, zeytinyağı ve baharatlarla pişirilmiş.',
                120.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.oGIbwZXG3Z4TjO79KOHKzgHaE8%26pid%3DApi&f=1&ipt=48af5cde29405e6751e0882191ce76aaea415799db3a8530368d6d455285d8c8&ipo=images',
              ),
              _buildMenuItem(
                'Zeytinyağlı Enginar',
                'Zeytinyağında pişirilmiş enginar kalbi.',
                80.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.eswT1fcn_9pbTHvi1eUPOwHaE7%26pid%3DApi&f=1&ipt=66dfa4054f42e949eef25bf313b03c16c526e3537c3995e44ea2704c7b78fd08&ipo=images',
              ),
              _buildMenuItem(
                'Fırınlanmış Peynir',
                'Taze peynir dilimleri, zeytinyağı ve baharatlarla fırınlanmış.',
                90.0,
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.vvx6486WKSxGjKONVj89CAHaEK%26pid%3DApi&f=1&ipt=478bf1c17966af25f65575eff3ca799e50ac3744538dba801790b8139af231f4&ipo=images',
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
            color: Colors.teal[800],
          ),
        ),
      ),
    );
  }
}

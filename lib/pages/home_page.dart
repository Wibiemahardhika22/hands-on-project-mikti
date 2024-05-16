import 'package:easymart/pages/detail_gambar.dart';
import 'package:easymart/pages/draggable_container.dart';
import 'package:flutter/material.dart';

import 'package:easymart/pages/info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.drag_indicator),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DraggableContainer()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DetailGambar()));
              },
              child: Hero(
                tag: "image_animation",
                child: Image.asset("assets/sepatu1.png", width: 350),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text("Info"),
                          content: const Text("Ini adalah contoh dialog"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ));
              },
              icon: const Icon(Icons.info),
              label: const Text("Lihat Info"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: const [
                  DrawerHeader(
                    child: Center(child: Text("EasyMart")),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text("Cart"),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Account"),
                  ),
                  Divider(),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              onTap: () {
                // Tambahkan fungsi logout di sini
              },
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

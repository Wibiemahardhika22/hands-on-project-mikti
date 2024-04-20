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
        ],
      ),
      body: const Center(
        child: Text("Selamat Datang di EasyMart!"),
      ),
    );
  }
}

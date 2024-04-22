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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        ));
  }
}

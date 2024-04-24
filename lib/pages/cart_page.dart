import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              children: _generateConstraints(),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 2,
              children: _generateConstraints(),
            );
          } else {
            return GridView.count(
              crossAxisCount: 4,
              children: _generateConstraints(),
            );
          }
        },
      ),
    );
  }
}

List<Widget> _generateConstraints() {
  return List<Widget>.generate(10, (int index) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text("Product $index"),
          const SizedBox(height: 8),
          Text("Rp 100.000"),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Beli"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  });
}

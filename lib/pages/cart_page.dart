import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : LayoutBuilder(
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

  List<Widget> _generateConstraints() {
    return List<Widget>.generate(products.length, (int index) {
      final product = products[index];
      return HoverCard(
        imageUrl: product['image'],
        productName: product['title'],
        productPrice: product['price'].toString(),
      );
    });
  }
}

class HoverCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;

  const HoverCard({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    super.key,
  });

  @override
  HoverCardState createState() => HoverCardState();
}

class HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          boxShadow: isHovered
              ? [const BoxShadow(color: Colors.black26, blurRadius: 10.0)]
              : [],
        ),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(widget.imageUrl, width: 150, height: 150),
              const SizedBox(height: 8),
              Text(widget.productName, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text("\$ ${widget.productPrice}"),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Beli"),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

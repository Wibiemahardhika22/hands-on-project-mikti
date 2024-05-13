import 'package:flutter/material.dart';

class DetailGambar extends StatelessWidget {
  const DetailGambar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Gambar"),
      ),
      body: Hero(
        tag: "image_animation",
        child: GestureDetector(
          onTap: () {
            
          },
          child: Image.asset("assets/sepatu1.png", width: 350)),
      ),
    );
  }
}

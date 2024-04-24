import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Info"),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Screen Width: ${screenSize.width.toStringAsFixed(2)}"),
                Text("Screen Height: ${screenSize.height.toStringAsFixed(2)}"),
                Text("Orientation: $orientation"),
              ],
            ),
          ),
        ));
  }
}

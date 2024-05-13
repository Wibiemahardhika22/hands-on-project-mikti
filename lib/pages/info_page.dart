import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final double boxSize = 150;

  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  double posX = 0.0;
  double posY = 0.0;

  void centerPosition(BuildContext context) {
    posX = (MediaQuery.of(context).size.width - boxSize) / 2;
    posY = (MediaQuery.of(context).size.height - boxSize) / 2 - 30;

    setState(() {
      posX = posX;
      posY = posY;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // Orientation orientation = MediaQuery.of(context).orientation;
    if (posX == 0) {
      centerPosition(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Info"),
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  numOfSingleTap++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  numOfDoubleTap++;
                });
              },
              onLongPress: () {
                setState(() {
                  numOfLongPress++;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Text(
        "Single Taps: $numOfSingleTap - Double Taps: $numOfDoubleTap - Long Press: $numOfLongPress",
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );

    // SafeArea(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text("Screen Width: ${screenSize.width.toStringAsFixed(2)}"),
    //         Text("Screen Height: ${screenSize.height.toStringAsFixed(2)}"),
    //         Text("Orientation: $orientation"),
    //       ],
    //     ),
    //   ),
    // ));
  }
}

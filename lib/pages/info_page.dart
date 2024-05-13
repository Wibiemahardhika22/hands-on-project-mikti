import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Info"),
      ),
      body: Center(
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
            width: 150,
            height: 150,
            color: Colors.amber,
          ),
        ),
      ),
      bottomNavigationBar: Text(
        "Single Taps: $numOfSingleTap - Double Taps: $numOfDoubleTap - Long Press: $numOfLongPress",
        style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,
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

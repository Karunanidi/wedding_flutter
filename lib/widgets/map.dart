import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          const Text(
            'Directions',
            style: TextStyle(
              color: Color.fromRGBO(41, 82, 56, 100),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Placeholder(), // Replace with actual map widget if available
          ),
          const SizedBox(height: 20),
          const Text(
            '3rd Floor, Mugunghwa Hall,\nMuseum Wedding Hall, 29 Itaewon-ro, Yongsan-gu, Seoul',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

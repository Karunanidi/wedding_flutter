import 'package:flutter/material.dart';
import 'package:invitation/core/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Future<void> _openMap() async {
    await launchUrl(Uri.parse(MAP_URL));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          const Text(
            'Lokasi',
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
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: GestureDetector(
                onTap: _openMap,
                child: Image.asset(
                  img_maps,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'KAPYC COFFEE AND ROASTERY\nJl. Taman MPU Sendok (Jl. Senopati No.3)\nKby. Baru, Jakarta Selatan',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

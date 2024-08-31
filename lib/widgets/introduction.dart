import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final Uri _googleFormUrl =
      Uri.parse('https://maps.app.goo.gl/rKjKux49L7dGXPBV9');

  void _launchURL() async {
    if (await canLaunchUrl(_googleFormUrl)) {
      await launchUrl(_googleFormUrl);
    } else {
      throw 'Could not launch $_googleFormUrl';
    }
  }

  Widget _buildName(String father, String mother, String order, String name) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(father, style: const TextStyle(fontSize: 15)),
              Text(mother, style: const TextStyle(fontSize: 15)),
            ],
          ),
          Text('\'s $order '),
          Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset(
              'assets/images/hand.png',
              fit: BoxFit.contain,
            ),
          ),
          const AutoSizeText(
            'You Are Invited',
            style: TextStyle(
              color: Color.fromRGBO(41, 82, 56, 100),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          const AutoSizeText(
            'We met in November at the age of 20, and over the past 7 years, we have loved and grown together through school, military service, graduation, and job searching.\n\n' +
                'Now, we are taking a new step to become a family, not just a couple. We would be grateful if you could join us and bless us with your presence ❤',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 50),
          _buildName('Kim Sun-chul', 'Seo Eun-kyung', 'eldest son', 'Do-jin'),
          const SizedBox(height: 30),
          _buildName(
              'Kim Jung-tae', 'Lee Jung-eun', 'eldest daughter', 'Chae-eun'),
          const SizedBox(height: 50),
          const AutoSizeText(
            'Saturday, June 19, 2021\n12:30 PM',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(41, 82, 56, 100),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          const AutoSizeText(
            'Due to the COVID-19 situation, we need to confirm attendance and meal preferences 😢\nWe would really appreciate it if you could take the time to fill out the survey below ❤',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _launchURL,
            child: const Text(
              'Fill Out Survey',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

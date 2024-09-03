import 'package:flutter/material.dart';
import 'package:invitation/core/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  Future<void> _launchURL() async {
    await launchUrl(Uri.parse(FORM_URL));
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
              'assets/images/img_reunion.jpg',
              fit: BoxFit.contain,
            ),
          ),
          const AutoSizeText(
            'You Are Invited!',
            style: TextStyle(
              color: Color(0x9C295238),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          const AutoSizeText(
            'Perjalanan ini membawa kita bersama dalam petualangan yang tak terlupakan. Dengan teman, setiap langkah menjadi cerita, setiap detik menjadi kenangan yang abadi.\n\n' +
                'Mari kita teruskan perjalanan ini, menciptakan lebih banyak legenda bersama, karena kebersamaan inilah yang membuat hidup lebih berarti. Terima kasih telah menjadi bagian dari perjalanan luar biasa ini! 🔥',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 50),
          const AutoSizeText(
            EVENT_DATE,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x9C295238),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          const AutoSizeText(
            'Kami perlu mengonfirmasi kehadiran dan data diri teman-teman 😊\nKami sangat menghargai jika teman-teman dapat meluangkan waktu untuk mengisi survei di bawah ini 🙏❤',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _launchURL,
            child: const Text(
              'Isi Survei',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

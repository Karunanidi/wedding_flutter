import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CongratulationGift extends StatelessWidget {
  const CongratulationGift({Key? key}) : super(key: key);

  void onPressed(BuildContext context, String accountNumber) {
    Clipboard.setData(ClipboardData(text: accountNumber)).then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account number copied"))));
  }

  Widget _buildButton(
      BuildContext context, String receiver, String accountNumber) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            receiver,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () => onPressed(context, accountNumber),
            child: Text(
              accountNumber,
              style: const TextStyle(fontSize: 10),
              maxLines: 2,
            ),
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
          const AutoSizeText(
            'Send Your Wishes to the Bride and Groom',
            style: TextStyle(
              color: Color.fromRGBO(41, 82, 56, 100),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          _buildButton(
              context, 'Groom: Kim Do-jin', 'Kakao Bank 3333-04-6486265'),
          const SizedBox(height: 20),
          _buildButton(
              context, 'Bride: Kim Chae-eun', 'Kakao Bank 3333-08-2397114'),
        ],
      ),
    );
  }
}

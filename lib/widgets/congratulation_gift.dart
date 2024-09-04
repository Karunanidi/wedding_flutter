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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            receiver,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(width: 20),
          Flexible(
            flex: 1,
            child: TextButton(
              onPressed: () => onPressed(context, accountNumber),
              child: Text(
                accountNumber,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0x9C295238),
                ),
                maxLines: 2,
              ),
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
            'Contact Person',
            style: TextStyle(
              color: Color(0x9C295238),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
          _buildButton(context, 'Dian', '+62817-148-222'),
          _buildButton(context, 'Fera', '+62877-7610-2088'),
          _buildButton(context, 'Nivo', '+62858-8172-8448 '),
        ],
      ),
    );
  }
}

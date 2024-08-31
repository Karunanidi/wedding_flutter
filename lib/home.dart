import 'package:flutter/material.dart';
import 'package:invitation/widgets/congratulation_gift.dart';
import 'package:invitation/widgets/credit.dart';
import 'package:invitation/widgets/custom_divider.dart';
import 'package:invitation/widgets/gallery.dart';
import 'package:invitation/widgets/introduction.dart';
import 'package:invitation/widgets/map.dart';
import 'package:invitation/widgets/welcome.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            Welcome(),
            Introduction(),
            CustomDivider(),
            Gallery(),
            CustomDivider(),
            MapScreen(),
            CustomDivider(),
            CongratulationGift(),
            Credit()
          ],
        ),
      ),
    );
  }
}
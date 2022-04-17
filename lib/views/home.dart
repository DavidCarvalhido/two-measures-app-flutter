import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

import 'package:two_measures/views/length.dart';
import 'package:two_measures/views/listViewDetail.dart';
import 'package:two_measures/views/temperature.dart';
import 'package:two_measures/views/volume.dart';
import 'package:two_measures/views/weight.dart';

import 'package:quick_actions/quick_actions.dart';
import 'package:two_measures/components/shortcuts.dart';
import 'package:two_measures/components/top_bar_glass.dart';

class Home extends StatefulWidget {
  Home({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  final _quickActions = QuickActions();
  String shortcut = "no actions set";

  final BannerAd _myBanner = BannerAd(
    adUnitId: Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544~2934735716',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  void initState() {
    super.initState();
    initQuickActions();
    // Load ads...
    _myBanner.load();
  }

  void initQuickActions() {
    _quickActions.initialize((type) {
      //if (type == null) return;

      if (type == ShortcutItems.actionLength.type) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => Length(),
          ),
        );
      } else if (type == ShortcutItems.actionVolume.type) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => Volume(),
          ),
        );
      } else if (type == ShortcutItems.actionWeight.type) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => Weight(),
          ),
        );
      } else if (type == ShortcutItems.actionTemperature.type) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => Temperature(),
          ),
        );
      }
      setState(() {
        shortcut = type;
      });
    });
    _quickActions.setShortcutItems(ShortcutItems.items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /*Stack(
            children: [
              ListViewDetails(),
            ],
          ),*/
          TopBarGlass(
            blurStrengthX: 20,
            blurStrengthY: 20,
            color: Colors.blue
                .withAlpha(60), //acho que não é necessário esta parte aqui...
            title: Text(
              '2Measures',
              style: TextStyle(
                height: 5,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          /*GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),*/
          Column(
            children: [
              Stack(
                children: [
                  ListViewDetails(),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: _myBanner.size.width.toDouble(),
              height: _myBanner.size.height.toDouble(),
              child: AdWidget(
                ad: _myBanner,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _myBanner.dispose();
  // }
}

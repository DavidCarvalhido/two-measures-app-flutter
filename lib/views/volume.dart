import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

import 'package:two_measures/components/top_bar_glass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Volume extends StatefulWidget {
  const Volume({Key? key}) : super(key: key);

  @override
  State<Volume> createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  static const spc = SizedBox(height: 20);
  final _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _myBanner.load();
  }

  final BannerAd _myBanner = BannerAd(
    adUnitId: Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, //mas nao é isto que eu quero...
                        ),
                        hintText: '0',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    spc,
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 15,
                      ),
                      onPressed: () {},
                      label: Text('change'),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 32,
                        color: Colors.white, // this way change the icon color
                      ),
                    ),
                    spc,
                    Text(
                      '0.00',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TopBarGlass(
            blurStrengthX: 20,
            blurStrengthY: 20,
            color: Colors.green.withAlpha(60),
            title: Text(
              AppLocalizations.of(context)!.textVolume,
              style: TextStyle(
                height: 5,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
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
}

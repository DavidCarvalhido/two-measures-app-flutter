import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

import 'package:two_measures/components/top_bar_glass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Energy extends StatefulWidget {
  const Energy({Key? key}) : super(key: key);

  @override
  State<Energy> createState() => _EnergyState();
}

class _EnergyState extends State<Energy> {
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
                    //spc,
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _textController.clear();
                            },
                            icon: const Icon(Icons.clear)),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, //mas nao é isto que eu quero...
                        ),
                        hintText: '0.00',
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
                        Icons.autorenew,
                        //input--dropdown menu (unid)
                        //label--dropdown menu (unid)
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
              AppLocalizations.of(context)!.textEnergy,
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

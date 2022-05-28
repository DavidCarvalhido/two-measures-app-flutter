import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

import 'package:two_measures/components/top_bar_glass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  static const spc = SizedBox(height: 20);
  final _textController = TextEditingController();

  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadBanner();
  }

  Future<void> _loadBanner() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    _anchoredAdaptiveAd = BannerAd(
      // TODO: replace these test ad units with your own ad unit.
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }

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
                  top: 160,
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
                          icon: const Icon(Icons.clear),
                        ),
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
              AppLocalizations.of(context)!.textTemperature,
              style: TextStyle(
                height: 5,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          if (_anchoredAdaptiveAd != null && _isLoaded)
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.transparent,
                width: _anchoredAdaptiveAd!.size.width.toDouble(),
                height: _anchoredAdaptiveAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: _anchoredAdaptiveAd!,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }
}

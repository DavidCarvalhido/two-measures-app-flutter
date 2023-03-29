import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';
import 'package:two_measures/components/top_bar_glass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Length extends StatefulWidget {
  const Length({Key? key}) : super(key: key);

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
  static const spc = SizedBox(height: 20);
  static const hozt = SizedBox(width: 4);
  final _textController = TextEditingController();
  final _dropDownValue1 = ValueNotifier('');
  final _dropDownValue2 = ValueNotifier('');
  final _items = ['km', 'm', 'dm', 'cm', 'mm', 'in', 'ft', 'yd', 'mi'];

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
                  //spc,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _textController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 22.5,
                                  horizontal: 20.0, //mas nao é isto que eu quero...
                                ),
                                hintText: '0.00',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                        ),
                        hozt,
                        // -- This is for the dropdown menu because it uses ValueNotifier
                        ValueListenableBuilder(
                          valueListenable: _dropDownValue1,
                          builder: (BuildContext context, String value, _) {
                            return SizedBox(
                              width:111,  //depois alterar o tamanho
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                //isExpanded: true,
                                hint: const Text('measure'),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (itemChoice) =>
                                _dropDownValue1.value = itemChoice.toString(),
                                items: _items.map(
                                      (op) => DropdownMenuItem(
                                        value: op,
                                        child: Text(op),
                                      ),
                                ).toList(),
                              ),
                            );
                          },
                        ),
                      ],
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
                        color: Colors.white, //this way change the icon color
                      ),
                    ),
                    spc,
                    // aqui
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            //enabled: false,
                            controller: _textController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _textController.clear();
                                },
                                icon: const Icon(Icons.clear),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 22.5,
                                horizontal: 20.0, //mas nao é isto que eu quero...
                              ),
                              hintText: '0.00',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        hozt,
                        // -- This is for the dropdown menu because it uses ValueNotifier
                        ValueListenableBuilder(
                          valueListenable: _dropDownValue2,
                          builder: (BuildContext context, String value, _) {
                            return SizedBox(
                              width:111,  //depois alterar o tamanho
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                                //isExpanded: true,
                                hint: const Text('measure'),
                                value: (value.isEmpty) ? null : value,
                                onChanged: (itemChoice) =>
                                _dropDownValue2.value = itemChoice.toString(),
                                items: _items.map(
                                      (op) => DropdownMenuItem(
                                    value: op,
                                    child: Text(op),
                                  ),
                                ).toList(),
                              ),
                            );
                          },
                        ),
                      ],
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
            leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              AppLocalizations.of(context)!.textLength,
              style: TextStyle(
                height: 3,
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
    /*GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    ),*/
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }
}

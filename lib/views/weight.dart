import 'package:flutter/material.dart';
import 'package:two_measures/components/top_bar_glass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Weight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopBarGlass(
            blurStrengthX: 20,
            blurStrengthY: 20,
            color: Colors.green.withAlpha(60),
            title: Text(
              AppLocalizations.of(context).textWeight,
              style: TextStyle(
                height: 3,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

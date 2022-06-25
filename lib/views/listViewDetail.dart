import 'package:flutter/material.dart';
import 'package:two_measures/views/length.dart';
import 'package:two_measures/views/temperature.dart';
import 'package:two_measures/views/volume.dart';
import 'package:two_measures/views/weight.dart';
import 'energy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:two_measures/components/button_style.dart';

class ListViewDetails extends StatelessWidget {
  static const spc = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 150, left: 10, right: 10),
      child: Column(
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Energy()),
              );
            },
            label: Text(
              AppLocalizations.of(context)!.textEnergy,
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, //this way change the icon color
            ),
          ),
          spc,
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Length()),
              );
            },
            label: Text(
              AppLocalizations.of(context)!.textLength,
            ),
          ),
          spc,
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Temperature()),
              );
            },
            label: Text(
              AppLocalizations.of(context)!.textTemperature,
            ),
          ),
          spc,
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Volume()),
              );
            },
            label: Text(
              AppLocalizations.of(context)!.textVolume,
            ),
          ),
          spc,
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Weight()),
              );
            },
            label: Text(
              AppLocalizations.of(context)!.textWeight,
            ),
          ),
        ],
      ),
    );
  }
}

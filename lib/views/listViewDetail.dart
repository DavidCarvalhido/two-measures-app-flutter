import 'package:flutter/material.dart';
import 'package:two_measures/views/length.dart';
import 'package:two_measures/views/temperature.dart';
import 'package:two_measures/views/volume.dart';
import 'package:two_measures/views/weight.dart';
import 'energy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:two_measures/components/button_style.dart';

class ListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Energy()),
              );
            },
            label: Text(
              AppLocalizations.of(context).textEnergy,
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
          ),
          /*const SizedBox(
            height: 10,
          ),*/
          ElevatedButton.icon(
            /*style: ElevatedButton.styleFrom(
              minimumSize: Size(300, 50),
            ),*/
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
              AppLocalizations.of(context).textLength,
            ),
          ),
          ElevatedButton.icon(
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
              AppLocalizations.of(context).textTemperature,
            ),
          ),
          ElevatedButton.icon(
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
              AppLocalizations.of(context).textVolume,
            ),
          ),
          ElevatedButton.icon(
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
              AppLocalizations.of(context).textWeight,
            ),
          ),
        ],
      ),
    );
  }
}

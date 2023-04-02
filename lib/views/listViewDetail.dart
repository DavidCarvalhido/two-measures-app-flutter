import 'package:flutter/material.dart';
import 'package:two_measures/views/length.dart';
import 'package:two_measures/views/temperature.dart';
import 'package:two_measures/views/volume.dart';
import 'package:two_measures/views/weight.dart';
import 'package:two_measures/views/energy.dart';
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
          ButtonListStyle(
            textColor: Colors.white, // deve ser para remover
            backgroundColor: Colors.blue, // deve ser para remover
            fontSize: Size.square(2), // deve ser para remover
            label: AppLocalizations.of(context)!.textEnergy,
            icon: Icons.arrow_forward_ios, // deve ser para remover
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Energy(),
                ),
              );
            },
          ),
          spc,
          ButtonListStyle(
            textColor: Colors.white, // deve ser para remover
            backgroundColor: Colors.blue, // deve ser para remover
            fontSize: Size.square(2), // deve ser para remover
            label: AppLocalizations.of(context)!.textLength,
            icon: Icons.arrow_forward_ios, // deve ser para remover
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Length(),
                ),
              );
            },
          ),
          spc,
          ButtonListStyle(
            textColor: Colors.white, // deve ser para remover
            backgroundColor: Colors.blue, // deve ser para remover
            fontSize: Size.square(2), // deve ser para remover
            label: AppLocalizations.of(context)!.textTemperature,
            icon: Icons.arrow_forward_ios, // deve ser para remover
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Temperature(),
                ),
              );
            },
          ),
          spc,
          ButtonListStyle(
            textColor: Colors.white, // deve ser para remover
            backgroundColor: Colors.blue, // deve ser para remover
            fontSize: Size.square(2), // deve ser para remover
            label: AppLocalizations.of(context)!.textVolume,
            icon: Icons.arrow_forward_ios, // deve ser para remover
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Volume(),
                ),
              );
            },
          ),
          spc,
          ButtonListStyle(
            textColor: Colors.white, // deve ser para remover
            backgroundColor: Colors.blue, // deve ser para remover
            fontSize: Size.square(2), // deve ser para remover
            label: AppLocalizations.of(context)!.textWeight,
            icon: Icons.arrow_forward_ios, // deve ser para remover
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Weight(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

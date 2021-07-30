import 'package:flutter/material.dart';
//import 'package:two_measures/components/button_style.dart';

class ListViewDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Energy'),
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
            onPressed: () {},
            label: Text('Length'),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {},
            label: Text('Temperature'),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {},
            label: Text('Volume'),
          ),
          ElevatedButton.icon(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 32,
              color: Colors.white, // this way change the icon color
            ),
            onPressed: () {},
            label: Text('Weight'),
          ),
        ],
      ),
    );
  }
}

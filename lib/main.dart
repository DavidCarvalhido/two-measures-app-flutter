import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:two_measures/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  /*SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*routes: {
        '/length': (context) => Length(),
        '/volume': (context) => Volume(),
        '/weight': (context) => Weight(),
        '/temperature': (context) => Temperature(),
      },
      initialRoute: '/',*/
      debugShowCheckedModeBanner: false, //remove debug banner from app
      title: 'Two Measures',
      theme: ThemeData(
        brightness: Brightness.light,
        //primarySwatch: Colors.blue,
        //backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

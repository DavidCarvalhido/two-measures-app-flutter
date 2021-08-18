import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('de', ''), // German, no country code
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
        Locale('fr', ''), // French, no country code
        Locale('hi', ''), // Hindi, no country code
        Locale('it', ''), // Italian, no country code
        Locale('pt', ''), // Portuguese, no country code
      ],
      home: Home(),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

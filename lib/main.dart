import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:covid19livedata/utilities/constants.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Covid-19 Live Tracker',
      home: SplashScreenView(
        home: HomePage(),
        backgroundColor: kBackgroundColor,
        duration: 3500,
        imageSrc: 'images/corona_virus.png',
        imageSize: 100,
        text: 'COVID-19 Tracker',
        textType: TextType.TyperAnimatedText,
        textStyle: TextStyle(
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

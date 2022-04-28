import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iirice/about.dart';
import 'package:iirice/disease.dart';
import 'package:iirice/nitrogen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: AnimatedSplashScreen(

          splash: 'assets/splash.png',
          splashIconSize: double.maxFinite,
          nextScreen: const MyHomePage(title: '',),
          centered: true,

          backgroundColor: Colors.brown.shade300,
          duration: 1000,

        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  late PageController _pageController;
  List <Widget> _widgetOptions = <Widget>[
    Home(),
    HomePage(),
    HomePage1(),
    About(),
  ];
  void _onTap(int index)
  {
    setState(() {
      _currentIndex = index;

    });
  }
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset('assets/appbarlogo.png',height: 50,),
            SizedBox(width: 10,),
            Text('PlantDoctor', style: GoogleFonts.poppins(

            ),)

          ],
        ),
        backgroundColor: Colors.green,),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        backgroundColor: Colors.green,
        animationDuration: Duration(milliseconds: 400),
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home',style: GoogleFonts.poppins(),),
            icon: Icon(Icons.home),
            activeColor:Colors.white,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            title: Text('Disease',style: GoogleFonts.poppins()),
            icon: Icon(Icons.local_hospital_sharp),
            activeColor:Colors.white,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            title: Text('Nitrogen Content',style: GoogleFonts.poppins()),
            icon: Icon(Icons.sanitizer_sharp),
            activeColor:Colors.white,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            title: Text('About Us',style: GoogleFonts.poppins()),
            icon: Icon(Icons.info),
            activeColor:Colors.white,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
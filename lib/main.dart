import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharekhan/indoor.dart';
import 'package:sharekhan/outdoor.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List <Widget> pages =  <Widget> [
    Indoor(),
    Outdoor()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Indoor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Outdoor',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        selectedFontSize: 20,
        iconSize: 30,
        unselectedItemColor: Colors.blue,
        unselectedFontSize: 20,
        onTap: (value) {
          setState(() {
          selectedIndex = value;
          });
        },
      ),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:food_reels/provider/food_provider.dart';
import 'package:food_reels/provider/location_provider.dart';
import 'package:food_reels/screens/nearby.dart';
import 'package:food_reels/screens/reels.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => FoodProvider()),
      ],
      child: MaterialApp(
        title: 'Food Reels',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    ReelsScreen(),
    NearbyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // We fetch data in the main widget so it's available for both screens.
    // This is a simple way to manage state for a small app.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!Provider.of<LocationProvider>(context, listen: false).hasLocation) {
        Provider.of<LocationProvider>(context, listen: false).getCurrentLocation();
      }
      if (Provider.of<FoodProvider>(context, listen: false).spots.isEmpty) {
        Provider.of<FoodProvider>(context, listen: false).fetchFoodSpots();
      }
    });

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam_rounded),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_rounded),
            label: 'Nearby',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/providers/favorite_provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/providers/auth_provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/home_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/search_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/favorite_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/profile_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/sign_in_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/sign_up_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      // Mengubah tampilan awal menjadi MainScreen sesuai Slide 16
      home: const MainScreen(),
      // Konfigurasi Routing untuk Implementasi Lanjutan (Slide 7 & Slide 30)
      routes: {
        '/homescreen': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1. Deklarasikan variabel (Slide 18)
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat properti body berupa widget yang ditampilkan (Slide 21)
      body: _children[_currentIndex],

      // TODO: 3. Buat properti bottomNavigationBar dengan nilai Theme (Slide 21)
      bottomNavigationBar: Theme(
        // TODO: 4. Buat data dan child dari Theme (Slide 22 - 28)
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepPurple),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.deepPurple),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.deepPurple),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
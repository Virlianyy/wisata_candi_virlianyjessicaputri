import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Impor paket provider
import 'package:wisata_candi_virlianyjessicaputri/providers/favorite_provider.dart'; // Impor FavoriteProvider
import 'package:wisata_candi_virlianyjessicaputri/providers/auth_provider.dart'; // Impor AuthProvider
import 'package:wisata_candi_virlianyjessicaputri/data/candi_data.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/detail_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/profile_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/sign_in_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteProvider()), //
        ChangeNotifierProvider(create: (_) => AuthProvider()), //[cite: 1]
      ],
      child: const MyApp(), //[cite: 1]
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
      // Setting tema sesuai PPT Pertemuan 13 Slide 17[cite: 3]
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
      // Set tampilan utama layar awal (bisa DetailScreen atau ProfileScreen sesuai kebutuhan pengujian)[cite: 1]
      home: ProfileScreen(),
    );
  }
}
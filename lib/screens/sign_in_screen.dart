import 'package:flutter/material.dart';
import 'package:wisata_candi_virlianyjessicaputri/data/candi_data.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/detail_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/profile_screen.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/sign_in_screen.dart';

void main() {
  runApp(const SignInScreen());
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      // home: DetailScreen(candi: candiList[1]),
      // home: ProfileScreen(),
      home: SignInScreen(),
    );
  }
}
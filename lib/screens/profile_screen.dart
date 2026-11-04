import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/providers/auth_provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/providers/favorite_provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/screens/sign_in_screen.dart'; // Impor SignInScreen
import 'package:wisata_candi_virlianyjessicaputri/widgets/profile_info_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil state dari AuthProvider & FavoriteProvider secara real-time
    final auth = context.watch<AuthProvider>();
    final int favoriteCount = context.watch<FavoriteProvider>().count;

    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang Container ungu di bagian atas
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // ProfileHeader (Foto profil & ikon kamera)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/placeholder_image.png'),
                            ),
                          ),
                          if (auth.isSignedIn)
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.deepPurple[50],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // ProfileInfo (Informasi Pengguna)
                  ProfileInfoItem(
                    icon: Icons.lock,
                    label: 'Pengguna',
                    value: auth.isSignedIn ? auth.username : '',
                    iconColor: Colors.amber,
                  ),
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 4),

                  ProfileInfoItem(
                    icon: Icons.person,
                    label: 'Nama',
                    value: auth.isSignedIn ? auth.username : '',
                    showEditIcon: auth.isSignedIn,
                    onEditPressed: () {
                      debugPrint('Icon edit ditekan');
                    },
                    iconColor: Colors.blue,
                  ),
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 4),

                  // Baris Favorit terhubung langsung dengan FavoriteProvider
                  ProfileInfoItem(
                    icon: Icons.favorite,
                    label: 'Favorit',
                    value: favoriteCount > 0 ? '$favoriteCount' : '',
                    iconColor: Colors.red,
                  ),
                  const SizedBox(height: 4),
                  Divider(color: Colors.deepPurple[100]),
                  const SizedBox(height: 20),

                  // ProfileActions (Tombol Sign In / Sign Out)
                  auth.isSignedIn
                      ? TextButton(
                    onPressed: () {
                      context.read<AuthProvider>().signOut();
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    ),
                  )
                      : TextButton(
                    onPressed: () {
                      // Navigasi aktif ke SignInScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
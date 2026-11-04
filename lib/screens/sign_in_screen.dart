import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_candi_virlianyjessicaputri/providers/auth_provider.dart'; // 1. Wajib impor AuthProvider

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Controller untuk membaca inputan teks[cite: 3]
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  // Fungsi Logika Sign In[cite: 1, 3]
  void _signIn() {
    final String username = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    // Memastikan kolom nama pengguna dan password diisi[cite: 3]
    if (username.isNotEmpty && password.isNotEmpty) {
      // Menyimpan nama pengguna ke AuthProvider & mengubah isSignedIn jadi true
      context.read<AuthProvider>().signIn(username);

      // Menutup halaman SignInScreen dan kembali ke ProfileScreen
      Navigator.pop(context);
    } else {
      // Tampilkan error jika ada kolom yang kosong[cite: 3]
      setState(() {
        _errorText = 'Nama pengguna dan kata sandi tidak boleh kosong';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Kolom Input Nama Pengguna[cite: 3]
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Kolom Input Kata Sandi[cite: 3]
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tombol Sign In (Menghubungkan ke _signIn)[cite: 1, 3]
                  ElevatedButton(
                    onPressed: _signIn, // <-- Memanggil fungsi _signIn di atas[cite: 1, 3]
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart'; // Tambahkan import provider
import 'package:wisata_candi_virlianyjessicaputri/models/candi.dart';
import 'package:wisata_candi_virlianyjessicaputri/widgets/detail_header.dart';
import 'package:wisata_candi_virlianyjessicaputri/providers/favorite_provider.dart'; // Sesuaikan path jika perlu

class DetailScreen extends StatelessWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    // Membaca status favorit menggunakan Provider
    final bool isFav = context
        .watch<FavoriteProvider>()
        .isFavorite(candi.name);

    return Scaffold(
      // Mencegah overflow dengan membungkus Column di dalam SingleChildScrollView
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header / Gambar Utama & Tombol Back
            DetailHeader(candi: candi),

            // DetailInfo: Informasi Detail Candi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // 1. INFO ATAS: Nama Candi & Tombol Favorit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        candi.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Mengubah status favorit via Provider
                          context
                              .read<FavoriteProvider>()
                              .toggle(candi.name);
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),

                  // 2. INFO TENGAH: Lokasi, Dibangun, dan Tipe
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.red),
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Lokasi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.location}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, color: Colors.blue),
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Dibangun',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.built}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.house, color: Colors.green),
                      const SizedBox(width: 8),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Tipe',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${candi.type}'),
                    ],
                  ),

                  // Pemisah (Divider)
                  const SizedBox(height: 16),
                  Divider(color: Colors.deepPurple.shade100),
                  const SizedBox(height: 16),

                  // 3. INFO BAWAH: Deskripsi
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(candi.description),
                ],
              ),
            ),

            // DetailGallery: Galeri Foto Horisontal
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100),
                  const Text(
                    'Galeri',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // SizedBox memberi tinggi pasti untuk ListView horisontal
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: candi.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: candi.imageUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tap untuk memperbesar',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
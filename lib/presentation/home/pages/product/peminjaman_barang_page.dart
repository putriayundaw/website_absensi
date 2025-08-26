import 'package:flutter/material.dart';
import 'package:website_absensi/presentation/widgets/sidebar.dart';

class PeminjamanBarangPage extends StatelessWidget {
  const PeminjamanBarangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
     drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text('Halaman All Product'),
      ),
      )
    );
  }
}

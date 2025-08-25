import 'package:flutter/material.dart';

class BarangMasukPage extends StatelessWidget {
  const BarangMasukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: Center(
        child: Text('Halaman All Product'),
      ),
    );
  }
}

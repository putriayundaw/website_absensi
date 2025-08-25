import 'package:flutter/material.dart';

class DataPenggunaPage extends StatelessWidget {
  const DataPenggunaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengguna'),
      ),
      body: Center(
        child: Text('Halaman Data Pengguna'),
      ),
    );
  }
}

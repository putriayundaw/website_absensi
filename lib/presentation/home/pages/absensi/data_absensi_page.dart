import 'package:flutter/material.dart';

class DataAbsensiPage extends StatelessWidget {
  const DataAbsensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Absensi'),
      ),
      body: Center(
        child: Text('Halaman Data Absensi'),
      ),
    );
  }
}

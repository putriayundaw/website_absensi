import 'package:flutter/material.dart';
import 'package:website_absensi/presentation/widgets/sidebar.dart';

class DataAbsensiPage extends StatelessWidget {
  const DataAbsensiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Absensi'),
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text('Halaman Data Absensi'),
      ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:website_absensi/core/routes/go_router.dart';  // Mengimpor AppRouter

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Absensi App',
      routerConfig: AppRouter.router,  // Menggunakan go_router untuk routing
    );
  }
}

import 'package:flutter/material.dart';
import 'package:website_absensi/presentation/auth/pages/dashboard_page.dart';
import 'package:website_absensi/presentation/auth/pages/login_page.dart';
import 'package:website_absensi/presentation/auth/pages/logout_page.dart';
import 'package:website_absensi/presentation/auth/pages/register_page.dart';
import 'package:website_absensi/presentation/home/pages/absensi/data_absensi_page.dart';
import 'package:website_absensi/presentation/home/pages/absensi/data_izin_page.dart';
import 'package:website_absensi/presentation/home/pages/absensi/data_pengguna_page.dart';
import 'package:website_absensi/presentation/home/pages/product/allproduct_page.dart';
import 'package:website_absensi/presentation/home/pages/product/barang_masuk_page.dart';
import 'package:website_absensi/presentation/home/pages/product/peminjaman_barang_page.dart';
import 'package:website_absensi/presentation/home/pages/product/pengembalian_barang_page.dart';
import 'package:website_absensi/presentation/home/pages/product/product_page.dart';
import 'package:website_absensi/presentation/home/pages/product/qr_code_page.dart';
import 'package:website_absensi/presentation/home/pages/product/scan_page.dart';
import 'package:website_absensi/presentation/home/pages/profil/profile_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String register = '/register';
  static const String product = '/product';
  static const String media = '/media';
  static const String dataAbsensi = '/data-absensi';
  static const String dataIzin = '/data-izin';
  static const String dataPengguna = '/data-pengguna';
  static const String qrCode = '/qr-code';
  static const String scan = '/scan';
  static const String logout = '/logout';

  // Menambahkan rute untuk produk
  static const String allProduct = '/all-product';
  static const String barangMasuk = '/barang-masuk';
  static const String peminjamanBarang = '/peminjaman-barang';
  static const String pengembalianBarang = '/pengembalian-barang';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case product:
        return MaterialPageRoute(builder: (_) => ProductPage());
      // case media:
      //   return MaterialPageRoute(builder: (_) => MediaPage());
      case dataAbsensi:
        return MaterialPageRoute(builder: (_) => DataAbsensiPage());
      case dataIzin:
        return MaterialPageRoute(builder: (_) => DataIzinPage());
      case dataPengguna:
        return MaterialPageRoute(builder: (_) => DataPenggunaPage());
      case qrCode:
        return MaterialPageRoute(builder: (_) => QRCodePage());
      case scan:
        return MaterialPageRoute(builder: (_) => ScanPage());
      case logout:
        return MaterialPageRoute(builder: (_) => LogoutPage());
      // Menambahkan rute halaman produk
      case allProduct:
        return MaterialPageRoute(builder: (_) => AllProductPage());
      case barangMasuk:
        return MaterialPageRoute(builder: (_) => BarangMasukPage());
      case peminjamanBarang:
        return MaterialPageRoute(builder: (_) => PeminjamanBarangPage());
      case pengembalianBarang:
        return MaterialPageRoute(builder: (_) => PengembalianBarangPage());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}

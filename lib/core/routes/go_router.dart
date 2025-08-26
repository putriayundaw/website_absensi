import 'package:go_router/go_router.dart';
import 'package:website_absensi/presentation/auth/pages/login_page.dart';
import 'package:website_absensi/presentation/auth/pages/register_page.dart';
import 'package:website_absensi/presentation/auth/pages/dashboard_page.dart';
import 'package:website_absensi/presentation/home/pages/absensi/data_absensi_page.dart';
import 'package:website_absensi/presentation/home/pages/product/allproduct_page.dart';
import 'package:website_absensi/presentation/home/pages/product/product_page.dart';
import 'package:website_absensi/presentation/auth/pages/logout_page.dart';
import 'package:website_absensi/presentation/home/pages/product/qr_code_page.dart';
import 'package:website_absensi/presentation/home/pages/product/scan_page.dart';
import 'package:website_absensi/presentation/home/pages/absensi/data_izin_page.dart';
import 'package:website_absensi/presentation/home/pages/absensi/data_pengguna_page.dart';
import 'package:website_absensi/presentation/home/pages/product/barang_masuk_page.dart';
import 'package:website_absensi/presentation/home/pages/product/peminjaman_barang_page.dart';
import 'package:website_absensi/presentation/home/pages/product/pengembalian_barang_page.dart';
import 'package:website_absensi/presentation/home/pages/profil/profile_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',  // Tentukan halaman awal (login)
    routes: [
      // Rute untuk halaman login
      GoRoute(
        path: '/login',
        builder: (context, state) =>  LoginPage(),
      ),
      // Rute untuk halaman dashboard
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      // Rute untuk halaman register
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      // Rute untuk halaman produk
      GoRoute(
        path: '/product',
        builder: (context, state) => const ProductPage(),
      ),
      // Rute untuk absensi
      GoRoute(
        path: '/data-absensi',
        builder: (context, state) => const DataAbsensiPage(),
      ),
      GoRoute(
        path: '/data-izin',
        builder: (context, state) => const DataIzinPage(),
      ),
      GoRoute(
        path: '/data-pengguna',
        builder: (context, state) => const DataPenggunaPage(),
      ),
      // Rute untuk QR Code dan scan
      GoRoute(
        path: '/qr-code',
        builder: (context, state) => const QRCodePage(),
      ),
      GoRoute(
        path: '/scan',
        builder: (context, state) => const ScanPage(),
      ),
      // Rute untuk logout
      GoRoute(
        path: '/logout',
        builder: (context, state) => const LogoutPage(),
      ),
      // Rute untuk halaman produk lainnya
      GoRoute(
        path: '/all-product',
        builder: (context, state) => const AllProductPage(),
      ),
      GoRoute(
        path: '/barang-masuk',
        builder: (context, state) => const BarangMasukPage(),
      ),
      GoRoute(
        path: '/peminjaman-barang',
        builder: (context, state) => const PeminjamanBarangPage(),
      ),
      GoRoute(
        path: '/pengembalian-barang',
        builder: (context, state) => const PengembalianBarangPage(),
      ),
      // Rute untuk halaman profil
      GoRoute(
        path: '/profile',
        builder: (context, state) =>  ProfilePage(),
      ),
    ],
  );
}

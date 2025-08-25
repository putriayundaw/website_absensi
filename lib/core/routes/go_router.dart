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
      // Rute-rute untuk halaman utama
      GoRoute(
        path: '/login',
        builder: (context, state) =>  LoginPage(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) => const ProductPage(),
      ),
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
      GoRoute(
        path: '/qr-code',
        builder: (context, state) => const QRCodePage(),
      ),
      GoRoute(
        path: '/scan',
        builder: (context, state) => const ScanPage(),
      ),
      GoRoute(
        path: '/logout',
        builder: (context, state) => const LogoutPage(),
      ),
      // Rute-rute untuk halaman produk
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
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}

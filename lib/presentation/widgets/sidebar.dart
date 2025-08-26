import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_absensi/core/constans/colors.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.white,  // Warna header sidebar
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/sidebar/logo.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Bagian Overview & Media
            _buildSidebarSection('Overview & Media', [
              _buildSidebarItem(Icons.dashboard, 'Dashboard', context, '/dashboard'),
              _buildSidebarItem(Icons.camera_alt, 'Media', context, '/product'),
            ]),
            // Bagian Absensi
            _buildSidebarSection('Absensi', [
              _buildSidebarItem(Icons.category, 'Data Absensi', context, '/data-absensi'),
              _buildSidebarItem(Icons.exit_to_app, 'Data Izin', context, '/data-izin'),
              _buildSidebarItem(Icons.people, 'Data Pengguna', context, '/data-pengguna'),
            ]),
            // Bagian Produk
            _buildSidebarSection('Produk', [
              _buildSidebarItem(Icons.shopping_bag, 'Semua Produk', context, '/all-product'),
              _buildSidebarItem(Icons.input, 'Barang Masuk', context, '/barang-masuk'),
              _buildSidebarItem(Icons.handshake, 'Peminjaman Barang', context, '/peminjaman-barang'),
              _buildSidebarItem(Icons.refresh, 'Pengembalian Barang', context, '/pengembalian-barang'),
            ]),
            // Bagian QR Code
            _buildSidebarSection('QRCode', [
              _buildSidebarItem(Icons.qr_code, 'Buat QRCode', context, '/qr-code'),
            ]),
            // Bagian Scan Produk
            _buildSidebarSection('Scan Produk', [
              _buildSidebarItem(Icons.camera, 'Scan Pinjam', context, '/scan'),
              _buildSidebarItem(Icons.camera_alt, 'Scan Pengembalian', context, '/scan'),
              _buildSidebarItem(Icons.remove_red_eye, 'Scan Barang Keluar', context, '/scan'),
               _buildSidebarItem(Icons.person, 'Profile', context, '/profile'),
              _buildSidebarItem(Icons.logout, 'Logout', context, '/login'),
            
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarSection(String sectionTitle, List<Widget> items) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              sectionTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, BuildContext context, String route) {
    bool isSelected = _selectedItem == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = title;
        });
        Navigator.of(context).pop(); // Menutup drawer saat item diklik
        GoRouter.of(context).go(route); // Navigasi ke halaman yang sesuai menggunakan GoRouter
      },
      child: Container(
        color: isSelected ? Colors.blue.shade600 : Colors.transparent,
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.black54,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

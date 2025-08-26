import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:website_absensi/core/constans/colors.dart'; // Pastikan AppColors sudah didefinisikan
import 'package:website_absensi/presentation/widgets/sidebar.dart'; // Pastikan Sidebar sudah ada

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? _image; // Menyimpan gambar yang dipilih
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white, // Pastikan AppColors sudah didefinisikan
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer:  Sidebar(), // Pastikan Sidebar sudah ada dan didefinisikan
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // --- GAMBAR PROFIL & TOMBOL EDIT ---
                Stack(
                  children: [
                    // Gambar profil lingkaran
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipOval(
                        child: _image == null
                            ? Image.asset('assets/images/default-profile.png', fit: BoxFit.cover) // Pastikan gambar ada di folder assets
                            : Image.file(File(_image!.path), fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage, // Memanggil fungsi untuk memilih gambar
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: AppColors.primary, // Pastikan AppColors.primary sudah didefinisikan
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Nama dan Email
                const Text(
                  'users', // Ganti sesuai dengan nama pengguna
                  style: TextStyle(fontSize: 18
                  , fontWeight: FontWeight.bold),
                ),
                const Text(
                  'email', // Ganti sesuai dengan email pengguna
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // --- FORMULIR DETAIL PROFIL ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.person_outline, size: 28),
                      const SizedBox(width: 8),
                      Text(
                        'Profile Details',
                        style: TextStyle(fontSize: 18
                  , fontWeight: FontWeight.bold),   ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // --- FORMULIR TANPA HINT ---
                _buildTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                  icon: Icons.person_outline,
                ),
                _buildTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  icon: Icons.person_outline,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  icon: Icons.phone_android,
                ),
                const SizedBox(height: 40),

                // --- TOMBOL UPDATE ---
                ElevatedButton(
                  onPressed: () {
                    // Handle update action here
                    final firstName = _firstNameController.text;
                    final lastName = _lastNameController.text;
                    final email = _emailController.text;
                    final phone = _phoneController.text;

                    print("Updated Profile: $firstName $lastName, $email, $phone");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // Pastikan AppColors.primary sudah didefinisikan
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget pembantu untuk membuat TextField tanpa hint
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black54),
          prefixIcon: Icon(icon, color: Colors.grey.shade600),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
          ),
        ),
      ),
    );
  }
}

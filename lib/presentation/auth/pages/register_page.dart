import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:website_absensi/core/constans/variables.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final schoolController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final roleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;
  String? selectedRole;

  // Daftar pilihan gender dan role
  final List<String> genderList = ['Laki-laki', 'Perempuan'];
  final List<String> roleList = ['Admin', 'User'];

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text != confirmPasswordController.text) {
        _showError('Password dan Konfirmasi Password tidak cocok!');
        return;
      }

      try {
        final response = await http.post(
          Uri.parse('${Variables.baseUrl}/ellen_ocn/register'),
          body: json.encode({
            'role': selectedRole!,
            'school': schoolController.text,
            'name': nameController.text,
            'address': addressController.text,
            'gender': selectedGender!,
            'phone_number': phoneController.text,
            'email': emailController.text,
            'password': passwordController.text,
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 201) {
          final responseData = json.decode(response.body);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('role', selectedRole!);
          prefs.setString('school', schoolController.text);
          prefs.setString('address', addressController.text);
          prefs.setString('gender', selectedGender!);
          prefs.setString('phone', phoneController.text);
          prefs.setString('email', emailController.text);

          _showSuccess('Akun berhasil dibuat!');
          context.go('/login');
        } else if (response.statusCode == 400) {
          _showError('Data yang Anda masukkan tidak valid.');
        } else {
          _showError(' ${response.body}');
        }
      } catch (e) {
        _showError('Terjadi kesalahan. Silakan coba lagi.');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    schoolController.dispose();
    addressController.dispose();
    genderController.dispose();
    roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0f7ff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.account_circle,
                          size: 80,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Create Your Account",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Register with your email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Your Email',
                            prefixIcon: const Icon(Icons.email),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Your Password',
                            prefixIcon: const Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: schoolController,
                          decoration: InputDecoration(
                            labelText: 'School',
                            prefixIcon: const Icon(Icons.school),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            prefixIcon: const Icon(Icons.location_on),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Gender Dropdown
                        DropdownButtonFormField<String>(
                          value: selectedGender,
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            prefixIcon: const Icon(Icons.person_outline),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          items: genderList.map((gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a gender';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Role Dropdown
                        DropdownButtonFormField<String>(
                          value: selectedRole,
                          decoration: InputDecoration(
                            labelText: 'Role',
                            prefixIcon: const Icon(Icons.supervisor_account),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          items: roleList.map((role) {
                            return DropdownMenuItem<String>(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a role';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _register();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .blueAccent, // Sesuaikan dengan warna login
                            padding: EdgeInsets.symmetric(vertical: 15),
                            minimumSize: Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            TextButton(
                              onPressed: () {
                                context.go('/login');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

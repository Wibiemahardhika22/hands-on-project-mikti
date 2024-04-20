import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akun Saya"),
      ),
      body: const Center(
        child: Text("Ini adalah halaman akun saya"),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/side_panel.dart';
import '../widgets/layout.dart';

import '../../../../core/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    print('--- Tentativa de Login ---');
    print('Email: $email');
    print('Senha: $password');
    print('Confirmar Senha: $confirmPassword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.blueGradient),
        child: Row(
          children: [
            SidePanel(),
            Layout(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Seja Bem-Vindo!',
                    style: TextStyle(
                      color: Color(0xFF003E84),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Cadastre sua conta para continuar',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  const SizedBox(height: 60),

                  _buildInputLabel("Email"),
                  _buildTextField(
                    "Ex: email@gmail.com",
                    controller: _emailController,
                  ),

                  const SizedBox(height: 30),

                  _buildInputLabel("Senha"),
                  _buildTextField(
                    "Ex: 1234",
                    isPassword: true,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 30),

                  _buildInputLabel("Confirmar Senha"),
                  _buildTextField(
                    "Ex: 1234",
                    isPassword: true,
                    controller: _confirmPasswordController,
                  ),

                  const SizedBox(height: 60),

                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: AppColors.blueGradient,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _onSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Já tem uma conta? ",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                       onPressed: () {
                          context.go('/'); 
                        },
                        child: const Text(
                          "Faça o Login",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 4),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF003E84),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

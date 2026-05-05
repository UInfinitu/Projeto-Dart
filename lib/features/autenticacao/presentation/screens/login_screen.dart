import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../router.dart';

import '../widgets/side_panel.dart';
import '../widgets/layout.dart';
import '../widgets/login_form.dart';

import '../../../../core/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.blueGradient),
        child: Row(
          children: [
            const SidePanel(),
            Layout(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoginForm(onSuccess: () { 
                    servicoAuth.login();
                    context.go('/');
                  }),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem conta? ',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () => context.go('/register'),
                        child: const Text(
                          'Crie uma',
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
}

import 'package:flutter/material.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  static const String logo = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(logo, height: 120),
          const SizedBox(height: 10),
          const Text(
            'GeoQuest Desktop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Encontre tesouros escondidos',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Por: Allan, Hugo, Ryu e Renan. Turma BCC-A 5º Termo',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class SidePanelMobile extends StatelessWidget {
  const SidePanelMobile({super.key});

  static const String logo = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(logo, height: 80),
        const SizedBox(height: 8),
        const Text(
          'GeoQuest Desktop',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Encontre tesouros escondidos',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}

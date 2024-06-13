import 'package:flutter/material.dart';

class Bienvenido extends StatelessWidget {
  const Bienvenido({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Intercept back button press and prevent navigation back
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/inicio.jpg"),
              fit:
                  BoxFit.cover, // Adjust as needed (cover, contain, fill, etc.)
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bienvenido a Pension App',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  '¡Tu hogar fuera de casa!',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the main app view (pendiente de implementación)
                    Navigator.pushNamed(context, '/Bienvenido_App');
                  },
                  child: const Text('Empezar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

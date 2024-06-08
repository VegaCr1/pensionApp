import 'package:flutter/material.dart';

class Restablecer_2 extends StatelessWidget {
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
                  'Restablecer Contraseña',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 40.0),
                const Icon(Icons.check_circle_outline,
                    size: 150.0, color: Color.fromARGB(255, 255, 255, 255)),
                const SizedBox(height: 20.0),
                const Text(
                  '¡Correo electrónico enviado!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Se ha enviado un correo electrónico con un enlace para restablecer su contraseña.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the login view and remove this view from the stack
                    Navigator.pushReplacementNamed(context, '/Login');
                  },
                  child: const Text('Inicio de sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

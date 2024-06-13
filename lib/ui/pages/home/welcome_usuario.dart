import 'package:flutter/material.dart';

// ignore: camel_case_types
class Usuario_creado_vista extends StatelessWidget {
  const Usuario_creado_vista({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // Set the automaticallyImplyLeading property to false to remove the back button icon
        onWillPop: () => Future.value(false),
        child: Scaffold(
          body: Container(
            // Wrap the content with a Container
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/inicio.jpg"),
                fit: BoxFit
                    .cover, // Adjust as needed (cover, contain, fill, etc.)
              ),
            ), // Set the background color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¡Usuario creado con éxito!',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                    ), // Increased font size
                  ),
                  const SizedBox(height: 45.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Login');
                    },
                    child: const Text(
                      'Iniciar sesión',
                      style: TextStyle(fontSize: 20.0), // Increased font size
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Selec_universidad extends StatefulWidget {
  const Selec_universidad({super.key});

  @override
  State<Selec_universidad> createState() => Selec_universidad_();
}

class Selec_universidad_ extends State<Selec_universidad> {
  // Selected university
  String _selectedUniversity = 'Universidad Popular del Cesar';

  // List of university options
  final List<String> _universityOptions = [
    'Universidad Popular del Cesar',
    'Universidad de Santander',
    'Universidad Area Andina',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Stack(
        children: [
          // Background image (full screen)
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/inicio.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Content container with padding
          Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  const Text(
                    'Seleccione Universidad',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Universidad combo box
                  DropdownButtonFormField<String>(
                    value: _selectedUniversity,
                    onChanged: (value) {
                      setState(() {
                        _selectedUniversity = value!;
                      });
                    },
                    items: _universityOptions.map((university) {
                      return DropdownMenuItem<String>(
                        value: university,
                        child: Text(university),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Universidad',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  // "Siguiente" button
                  ElevatedButton(
                    onPressed: () {
                      print('Selected University: $_selectedUniversity');
                      Navigator.pushNamed(context, '/Buscar_estudiante');
                    },
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

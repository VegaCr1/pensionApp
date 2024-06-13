import 'package:flutter/material.dart';

// ignore: camel_case_types
class Buscar_estudiante extends StatefulWidget {
  const Buscar_estudiante({super.key});

  @override
  State<Buscar_estudiante> createState() => Buscar_estudiante_();
}

// ignore: camel_case_types
class Buscar_estudiante_ extends State<Buscar_estudiante> {
  // Filter button state
  bool _showFilters = false;

  // Search query

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Buscar',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) {
            setState(() {
              Navigator.pushNamed(context, '/Selec_univerdidad');
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/inicio.jpg"),
            fit: BoxFit.cover, // Adjust as needed (cover, contain, fill, etc.)
          ),
        ),
        //
      ),
    );
  }
}

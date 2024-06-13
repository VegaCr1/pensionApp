// ignore_for_file: camel_case_types, unused_label

import 'package:flutter/material.dart';
import 'package:pension_app/services/firebase_services.dart';

// ignore: must_be_immutable
class DatosPension extends StatefulWidget {
  String nombre;
  String correo;
  String contrasena;
  String telefono;
  String tipocuenta;

  // ignore: use_super_parameters
  DatosPension({
    Key? key,
    required this.nombre,
    required this.correo,
    required this.contrasena,
    required this.telefono,
    required this.tipocuenta,
  }) : super(key: key);

  @override
  State<DatosPension> createState() => DatosPension_();
}

class DatosPension_ extends State<DatosPension> {
  String ciudadSeleccionada = 'VALLEDUPAR';
  String sedeSeleccionada = 'Upc Sabanas';

  // Create TextEditingControllers for each text field
  final direccionController = TextEditingController();
  final barrioController = TextEditingController();
  final propietarioController = TextEditingController();

  late String nombre;
  late String correo;
  late String contrasena;
  late String telefono;
  late String tipocuenta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de Pensión'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SizedBox(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/inicio.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Icono de perfil

                const Icon(
                  Icons.house,
                  size: 40.0,
                  color: Colors.white,
                ),
                const SizedBox(height: 20.0),

                // Campo de texto para la dirección
                TextField(
                  controller: direccionController, // Assign the controller
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.house, color: Colors.white),
                    labelText: 'Dirección',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10.0),

                // Campo de texto para el barrio
                TextField(
                  controller: barrioController, // Assign the controller
                  decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.rv_hookup_sharp, color: Colors.white),
                    labelText: 'Barrio',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10.0),

                // Campo de texto para el propietario
                TextField(
                  controller: propietarioController, // Assign the controller
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    labelText: 'Propietario',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),

                // Combo box para la ciudad
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Ciudad',
                    labelStyle:
                        TextStyle(color: Colors.white), // White label text
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white), // White border
                    ),
                    border: OutlineInputBorder(),
                  ),
                  value: ciudadSeleccionada,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'VALLEDUPAR',
                      child: Text('VALLEDUPAR'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'AGUACHICA',
                      child: Text('AGUACHICA'),
                    ),
                  ],
                  onChanged: (nuevaCiudad) {
                    setState(() {
                      ciudadSeleccionada = nuevaCiudad!;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                // Combo box para la sede
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Sede',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      // Set border color to white
                    ),
                    border: OutlineInputBorder(),
                  ),
                  value: sedeSeleccionada,
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'Upc Sabanas',
                      child: Text('Upc Sabanas'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Upc Bellas Artes',
                      child: Text('Upc Bellas Artes'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Upc Hurtado',
                      child: Text('Upc Hurtado'),
                    ),
                  ],
                  onChanged: (nuevaSede) {
                    setState(() {
                      sedeSeleccionada = nuevaSede!;
                    });
                  },
                ),
                const SizedBox(height: 30.0),

                // Botón para guardar los datos
                ElevatedButton.icon(
                  onPressed: () async {
                    // Get the values from the text fields
                    final direccion = direccionController.text;
                    final barrio = barrioController.text;
                    final propietario = propietarioController.text;
                    final nombre =
                        widget.nombre; // Use widget.nombre for clarity
                    final correo = widget.correo;
                    final contrasena = widget.contrasena;
                    final telefono = widget.telefono;
                    final tipocuenta = widget.tipocuenta;

                    // Pass the values to the agregarPension function
                    await agregarPension(
                            nombre,
                            correo,
                            contrasena,
                            telefono,
                            tipocuenta,
                            direccion,
                            barrio,
                            propietario,
                            ciudadSeleccionada,
                            sedeSeleccionada)
                        .then((value) async {
                      await agregarCuenta(correo, contrasena, tipocuenta);
                      // Navigate to the Bienvenido_User page
                      Navigator.pushNamed(context, '/Bienvenido_User');
                    });
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Crear Cuenta'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

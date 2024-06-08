import 'package:flutter/material.dart';

// ignore: camel_case_types
class Editar_estudiante extends StatefulWidget {
  // ignore: use_super_parameters
  const Editar_estudiante({Key? key}) : super(key: key);

  @override
  State<Editar_estudiante> createState() => Editar_estudianteState_();
}

// ignore: camel_case_types
class Editar_estudianteState_ extends State<Editar_estudiante> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _contrasenaController = TextEditingController();
  final _telefonoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _correoController.dispose();
    _contrasenaController.dispose();
    _telefonoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modificar datos',
        ),
      ),
      body: Stack(
        // Use a Stack widget for layering
        children: [
          // Background image (full screen)
          const SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/inicio.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Form content with padding
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                          prefix: Icon(Icons.person,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          labelText: 'Nombre',
                          labelStyle: TextStyle(color: Colors.white)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un nombre';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253,
                            253), // Change this to your desired color
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _correoController,
                      decoration: const InputDecoration(
                          prefix: Icon(Icons.email,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          labelText: 'Correo electrónico',
                          labelStyle: TextStyle(color: Colors.white)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un correo electrónico';
                        }
                        if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$')
                            .hasMatch(value)) {
                          return 'Correo electrónico no válido';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253,
                            253), // Change this to your desired color
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _contrasenaController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          prefix: Icon(Icons.security,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(color: Colors.white)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese una contraseña';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253,
                            253), // Change this to your desired color
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: _telefonoController,
                      decoration: const InputDecoration(
                          prefix: Icon(Icons.phone,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          labelText: 'Teléfono',
                          labelStyle: TextStyle(color: Colors.white)),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un teléfono';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253,
                            253), // Change this to your desired color
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Datos Modificados'),
                            ),
                          );
                          // Reset the form
                          _formKey.currentState!.reset();
                        }
                      },
                      child: const Text('Actualizar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

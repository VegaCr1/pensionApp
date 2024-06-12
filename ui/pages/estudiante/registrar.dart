// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pension_app/controller/controller.dart';
import 'package:pension_app/services/firebase_services.dart';
import 'package:pension_app/ui/pages/pension/datosPension.dart';
//import 'datos_controller.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrarUsuarioState createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  DatosController datosController = DatosController();
  final formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final telefonoController = TextEditingController();
  String selectedAccountType = 'Estudiante'; // Default selected account type
  bool showPassword = false; // Flag to control password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear Usuario',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Set width and height to match the screen size
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/inicio.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Form(
              key: formKey,
              autovalidateMode:
                  AutovalidateMode.always, // Enable real-time validation
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      prefix: Icon(Icons.person,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: 'Nombre',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253)),
                    controller: nombreController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefix: Icon(Icons.email,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253)),
                    controller: correoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu correo electrónico';
                      }
                      if (!RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+$')
                          .hasMatch(value)) {
                        return 'Correo electrónico no válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      prefix: const Icon(Icons.security,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      labelText: 'Contraseña',
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 253, 253, 253)),
                    controller: contrasenaController,
                    obscureText:
                        !showPassword, // Toggle visibility based on _showPassword
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, ingresa tu contraseña';
                      }
                      if (value.length < 6) {
                        return 'La contraseña debe tener al menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefix: Icon(Icons.phone, color: Colors.white),
                      labelText: 'Teléfono',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 253, 253,
                          253), // Change this to your desired color
                    ),
                    controller: telefonoController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Tipo de cuenta',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(
                              255, 255, 255, 255)), // Set label color to white
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        // Set border color to white
                      ),
                    ),
                    value: selectedAccountType,
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'Estudiante',
                        child: Text(
                          'Estudiante',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0,
                                  0)), // Set option text color to white
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Pensionado',
                        child: Text(
                          'Pensionado',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0,
                                  0)), // Set option text color to white
                        ),
                      ),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        selectedAccountType = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor, selecciona un tipo de cuenta.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32.0),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (selectedAccountType == "Estudiante") {
                            await agregarEstudiante(
                              nombreController.text,
                              correoController.text,
                              contrasenaController.text,
                              telefonoController.text,
                            ).then((value) async {
                              // await agregarCuenta(
                              //     correoController.text,
                              //     contrasenaController.text,
                              //     selectedAccountType);
                              Navigator.pushNamed(context, '/Bienvenido_User');
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DatosPension(
                                        nombre: nombreController.text,
                                        correo: correoController.text,
                                        contrasena: contrasenaController.text,
                                        telefono: telefonoController.text,
                                        tipocuenta: "Pension")));
                          }
                        }
                      },
                      child: SizedBox(
                        height: 40.0,
                        width: 110.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (selectedAccountType == "Estudiante")
                                ? const Text("Crear cuenta")
                                : const Text("Siguiente"),
                            if (selectedAccountType == "Estudiante")
                              const Icon(Icons.school), // Student icon
                            if (selectedAccountType != "Estudiante")
                              const Icon(
                                  Icons.navigate_next_sharp), // Pensioner icon
                            const SizedBox(width: 5.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

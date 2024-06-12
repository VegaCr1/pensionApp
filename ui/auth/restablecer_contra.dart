import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart'; // Import email validator package

class RestablecerContra extends StatefulWidget {
  const RestablecerContra({super.key});

  @override
  RestablecerContra_ createState() => RestablecerContra_();
}

class RestablecerContra_ extends State<RestablecerContra> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/inicio.jpg"),
            fit: BoxFit.cover, // Adjust as needed (cover, contain, fill, etc.)
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Prevent column from expanding
                children: [
                  const SizedBox(height: 20.0),
                  const Text(
                    '¿Olvido contraseña?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Ingrese su correo electrónico y le enviaremos un enlace para restablecer su contraseña.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(179, 255, 255,
                          255), // Lighter white text for readability
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefix: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      labelText: 'Correo electrónico',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ), // Set text color to black
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Rounded corners for text field
                        borderSide: const BorderSide(
                            color: Colors.white), // Light border
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese su correo electrónico.';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Correo electrónico no válido.';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate back to the login screen
                        Navigator.pushNamed(context, '/Restablecer_2');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          const Size(double.infinity, 40.0), // Span full width
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: Colors.green, // Green button color
                      elevation: 4.0,
                    ),
                    child: const Text(
                      'Enviar correo',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
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

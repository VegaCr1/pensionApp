import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pension_app/ui/pages/pension/detalla_pension.dart';
import 'dart:io';

// ignore: camel_case_types
class Add_Pension extends StatefulWidget {
  const Add_Pension({super.key});

  @override
  State<Add_Pension> createState() => Add_PensionState_();
}

// ignore: camel_case_types
class Add_PensionState_ extends State<Add_Pension> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _picker = ImagePicker();

  List<File?> imageFiles =
      List.filled(10, null); // List to store up to 10 images

  void _pickImage(int index) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFiles[index] = File(pickedFile.path);
      });
    }
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // Guardar la información del producto (imágenes, nombre, precio)
      // You can iterate through imageFiles to access and process uploaded images
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            name: _nameController.text,
            price: double.parse(_priceController.text),
            images: imageFiles, // Pass the list of images
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar pension'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(1.0),
            child: Form(
                key: _formKey,
                child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/inicio.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Dirección',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La dirección es obligatoria';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Precio',
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El precio es obligatorio';
                          }
                          if (double.tryParse(value) == null) {
                            return 'El precio debe ser un número válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        // Use Wrap to arrange image previews horizontally
                        spacing: 10.0,
                        children: [
                          for (int i = 0; i < 10; i++) // Loop definition
                            Row(
                              // Wrap each image and "Elegir imagen" text in a Row
                              children: [
                                if (imageFiles[i] != null)
                                  Image.file(
                                    imageFiles[i]!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () => _pickImage(i),
                                  child: const Text(
                                      'Elegir imagen'), // Consistent text
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _saveProduct,
                        child: const Text('Guardar'),
                      ),
                    ])))));
  }
}

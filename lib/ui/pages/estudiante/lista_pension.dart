import 'package:flutter/material.dart';

// Assuming you have a Pension class with relevant properties
class Pension {
  final String address;
  final double price;
  final List<String> imagePaths; // Assuming image paths are stored as strings

  const Pension(
      {required this.address, required this.price, required this.imagePaths});
}

// ignore: camel_case_types
class Lista_pension extends StatelessWidget {
  final List<Pension> pensions;

  const Lista_pension({super.key, required this.pensions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pensions.length,
      itemBuilder: (context, index) {
        final pension = pensions[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pension.address,
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Precio: \$${pension.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8.0),
                pension.imagePaths.isEmpty
                    ? const Text('Sin imágenes')
                    : Wrap(
                        spacing: 8.0,
                        children: [
                          for (final imagePath in pension.imagePaths)
                            Image.network(
                              imagePath,
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io';

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final double price;
  final File? image;

  // ignore: use_super_parameters
  const ProductDetailsScreen({
    Key? key,
    required this.name,
    required this.price,
    this.image, required List<File?> images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del producto: $name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Image.file(
                image!,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 20),
            Text(
              'Nombre: $name',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Precio: \$ ${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

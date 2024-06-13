// // ignore_for_file: avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
// // ignore: unused_import
// import 'package:flutter/rendering.dart';

// class Autenticacion {
//   final FirebaseAuth auth_ = FirebaseAuth.instance;

//   Future crearCuenta(String correo, String pass) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: correo, password: pass);
//       print(userCredential.user);
//       return (userCredential.user?.uid);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('contraseña débil');
//         return 1;
//       } else {
//         if (e.code == 'email-ready-in-use') {
//           print('la cuenta ay existe para ese correo ');
//           return 2;
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future inicioSesionCorreoYContrasena(String correo, String password) async {
//     try {
//       UserCredential userCredential = await auth_.signInWithEmailAndPassword(
//           email: correo, password: password);

//       final user = userCredential.user;

//       if (user?.uid != null) {
//         return user?.uid;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'Usuario y contraseña incorrecta') {
//         return 1;
//       } else if (e.code == 'Usuario y contraseña incorrecta') {
//         return 2;
//       }
//     }
//   }
// }

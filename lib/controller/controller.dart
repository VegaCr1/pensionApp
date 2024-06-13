import 'package:get/get.dart';

class DatosController extends GetxController {
  // Definición de variables reactivas para los datos del usuario
  final nombre = RxString('');
  final correo = RxString('');
  final contrasena = RxString('');
  final telefono = RxString('');
  final tipoCuenta = RxString('');

  // Método para actualizar el valor de la variable reactiva 'nombre'
  void actualizarNombre(String nuevoNombre) {
    nombre.value = nuevoNombre;
  }

  // Método para actualizar el valor de la variable reactiva 'correo'
  void actualizarCorreo(String nuevoCorreo) {
    correo.value = nuevoCorreo;
  }

  // Método para actualizar el valor de la variable reactiva 'contrasena'
  void actualizarContrasena(String nuevaContrasena) {
    contrasena.value = nuevaContrasena;
  }

  // Método para actualizar el valor de la variable reactiva 'telefono'
  void actualizarTelefono(String nuevoTelefono) {
    telefono.value = nuevoTelefono;
  }

  // Método para actualizar el valor de la variable reactiva 'tipoCuenta'
  void actualizarTipoCuenta(String nuevoTipoCuenta) {
    tipoCuenta.value = nuevoTipoCuenta;
  }

  // Método para obtener el valor actual de la variable reactiva 'nombre'
  String obtenerNombre() {
    return nombre.value;
  }

  // Método para obtener el valor actual de la variable reactiva 'correo'
  String obtenerCorreo() {
    return correo.value;
  }

  // Método para obtener el valor actual de la variable reactiva 'contrasena'
  String obtenerContrasena() {
    return contrasena.value;
  }

  // Método para obtener el valor actual de la variable reactiva 'telefono'
  String obtenerTelefono() {
    return telefono.value;
  }

  // Método para obtener el valor actual de la variable reactiva 'tipoCuenta'
  String obtenerTipoCuenta() {
    return tipoCuenta.value;
  }
}

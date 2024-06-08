import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pension_app/ui/pages/estudiante/editar_estudiante.dart';

class LogoutConfirmationPopup extends StatelessWidget {
  final BuildContext parentContext;

  const LogoutConfirmationPopup(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('¿Cerrar sesión?'),
      content: const Text('¿Estás seguro de cerrar sesión?'),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.pop(context), // Close dialog without logout
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Handle logout logic here (e.g., clear user data, navigate to login)
            Navigator.pop(context); // Close dialog after logout action
            Navigator.pushNamed(
                parentContext, '/Login'); // Example: Navigate to Login
          },
          child: const Text('Salir'),
        ),
      ],
    );
  }
}

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: onPressed,
    );
  }
}

class SettingsPopup extends StatelessWidget {
  final BuildContext parentContext;

  const SettingsPopup(this.parentContext, {super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Cuenta'),
      children: [
        // List of settings options (e.g., ListTile)
        ListTile(
          title: const Text('Editar datos estudiante '),
          onTap: () => Navigator.pushNamed(
              context, '/Editar_estudiante'), // Close dialog on selection
        ),
        ListTile(
          title: const Text('Editar datos Pension '),
          onTap: () => Navigator.pushNamed(
              context, '/Editar_pension'), // Close dialog on selection
        ),
        ListTile(
          title: const Text('Eliminar cuenta'),
          onTap: () =>
              confirmar_contrasena(context), // Llamar a la función directamente
        ),
      ],
    );
  }
}

// ignore: non_constant_identifier_names
void confirmar_contrasena(BuildContext context) {
  // ignore: no_leading_underscores_for_local_identifiers
  final _contrasenaController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Validación'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ingrese su contraseña'),
          TextFormField(
            controller: _contrasenaController,
            obscureText: false, // Keep password visible
            decoration: const InputDecoration(
              hintText: 'Contraseña',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            String contrasenaIngresada = _contrasenaController.text;
            if (validarContrasena(contrasenaIngresada)) {
              confirmar_para_eliminar(context);
              //
            } else {
              // Mostrar mensaje de error de contraseña incorrecta
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contraseña incorrecta'),
                ),
              );
            }
          },
          child: const Text('Confirmar'),
        ),
      ],
    ),
  );
}

// Función para validar la contraseña (reemplazar con tu lógica real)
bool validarContrasena(String contrasena) {
  // Implementar la lógica para validar la contraseña ingresada
  // (por ejemplo, compararla con la contraseña almacenada en el backend)
  return contrasena == '123'; // CTRAER LA CONTRASEÑA DE LA BASE DE DATOS
}

// ignore: non_constant_identifier_names
void confirmar_para_eliminar(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('¡Atención!'),
      content: const Text(
          '¿Está seguro de que desea eliminar su cuenta? Esta acción no es reversible.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            // Implementar la lógica para eliminar la cuenta
            // Simular la eliminación de la cuenta (reemplazar con la lógica real)
            await Future.delayed(const Duration(seconds: 2));
            print('Cuenta eliminada'); // Simulando la eliminación

            // Redirigir a '/Login'
            Navigator.pushReplacementNamed(context, '/Login');

            // Mostrar mensaje de confirmación
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                    'Cuenta eliminada exitosamente',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green),
            );
          },
          child: const Text(
            'Eliminar cuenta',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}

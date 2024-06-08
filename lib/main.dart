import 'package:firebase_core/firebase_core.dart';
import 'package:pension_app/ui/pages/pension/add_pension.dart';
import 'package:pension_app/ui/pages/estudiante/editar_estudiante.dart';
import 'package:pension_app/ui/pages/home/notificaciones.dart';
import 'package:pension_app/ui/pages/pension/editar_pension.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:pension_app/ui/auth/login.dart';
import 'package:pension_app/ui/auth/restablecer_2.dart';
import 'package:pension_app/ui/auth/restablecer_contra.dart';
import 'package:pension_app/ui/pages/home/home.dart';
import 'package:pension_app/ui/pages/pension/welcome_app_pension.dart';
import 'package:pension_app/ui/pages/estudiante/buscar_estudiante.dart';
import 'package:pension_app/ui/pages/home/welcome_usuario.dart';
import 'package:pension_app/ui/pages/pension/datosPension.dart';
import 'package:pension_app/ui/pages/estudiante/registrar.dart';
import 'package:pension_app/ui/pages/estudiante/selec_univerdiad.dart';
import 'package:pension_app/ui/pages/estudiante/welcome_estudiante.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// ignore: camel_case_types
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Pension App', // Set app title
      home: const Login(), // Ruta inicial: vista de login
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => const Login(), // Ruta para la vista de login
        '/Registrar': (context) => const RegistrarUsuario(),
        '/Bienvenido_User': (context) => const Usuario_creado_vista(),
        '/Bienvenido_App': (context) => const WelcomeApp(),
        '/Dato_Pension': (context) => DatosPension(
              nombre: "",
              correo: '',
              contrasena: "",
              telefono: "",
              tipocuenta: '',
            ),
        '/Restablecer_Contra': (context) => const RestablecerContra(),
        '/Restablecer_2': (context) => Restablecer_2(),
        '/Buscar_estudiante': (context) => const Buscar_estudiante(),
        '/Selec_univerdidad': (context) => const Selec_universidad(),
        '/Bienvenido_app': (context) => const Bienvenido(),
        '/Bienvenido_app_pension': (context) => const WelcomeAppPension(),
        '/Editar_estudiante': (context) => const Editar_estudiante(),
        '/Editar_pension': (context) => const Editar_pension(),
        '/Notificaciones': (context) => const NotificationPanel(),
        'Agregar_pension': (context) => const Add_Pension()

        //'/Chats_Estudiante': (context) => const ,
        //'/Selec_pension': (context) => const Selec_pension(),
      },
    );
  }
}

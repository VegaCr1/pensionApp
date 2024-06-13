import 'package:flutter/material.dart';
import 'package:pension_app/ui/pages/home/widget.dart';

class WelcomeApp extends StatelessWidget {
  const WelcomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use Stack for positioning
        children: [
          // Background image and other content
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/inicio.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 200.0),
                  const Text(
                    'Estudiante',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Avatar section
                  CircleAvatar(
                    radius: 50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    '¡Busca tu hogar fuera de casa!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Button 1 with icon
                      Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/Selec_univerdidad');
                            },
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Buscar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      // Button 2 with icon (same structure)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/Bienvenido_app_pension');
                            },
                            child: const Icon(
                              Icons.chat,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Chat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Notificaciones');
                          },
                          child: const Icon(
                            Icons.notifications_active,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Notificaciones',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SettingsPopup(context);
                              },
                            );
                          },
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Ajuste',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Positioned Exit button
          Positioned(
            top: 40.0, // Adjust top padding as needed
            right: 10.0, // Adjust right padding as needed
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogoutConfirmationPopup(context);
                  },
                );
              },
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white, // Adjust color as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}

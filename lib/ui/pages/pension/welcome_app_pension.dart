import 'package:flutter/material.dart';
import 'package:pension_app/ui/pages/home/widget.dart';

class WelcomeAppPension extends StatelessWidget {
  const WelcomeAppPension({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        // Wrap the Scaffold with WillPopScope
        onWillPop: () => Future.value(false), // Block back button press
        child: Scaffold(
          body: Stack(
            // Use Stack for positioning
            children: [
              Container(
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
                      'Pension',
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
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'Agregar_pension');
                            },
                            child: const Icon(
                              Icons.house,
                              color: Colors.white, // Adjust color as needed
                            ),
                          ),
                          const Text(
                            'Nueva',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '');
                            },
                            child: const Icon(
                              Icons.chat,
                              color: Colors.white, // Adjust color as needed
                            ),
                          ),
                          const Text(
                            'Chats',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/Notificaciones');
                            },
                            child: const Icon(
                              Icons.notifications_active,
                              color: Colors.white, // Adjust color as needed
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
                              color: Colors.white, // Adjust color as needed
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
                    const SizedBox(height: 50),
                  ],
                ),
              ),
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
        ));
  }
}

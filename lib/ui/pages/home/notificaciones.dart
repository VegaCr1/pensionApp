import 'package:flutter/material.dart';

class NotificationPanel extends StatefulWidget {
  const NotificationPanel({super.key});

  @override
  NotificationPanelState createState() => NotificationPanelState();
}

class NotificationPanelState extends State<NotificationPanel> {
  // List of NotificationItem objects with sample data
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'New Order Received!',
      content: 'Your order #12345 has been placed. Check it out!',
      icon: const Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
    ),
    NotificationItem(
      title: 'Important Update!',
      content: 'There\'s a new version of the app available. Please update.',
      icon: const Icon(
        Icons.system_update,
        color: Colors.white,
      ),
    ),
    NotificationItem(
      title: 'Reminder: Meeting Today',
      content: 'Your team meeting is at 2 PM. Don\'t forget!',
      icon: const Icon(
        Icons.calendar_today,
        color: Colors.white,
      ),
    ),
    NotificationItem(
      title: 'Friend Request Received',
      content: 'John Doe sent you a friend request on SocialApp.',
      icon: const Icon(Icons.person_add, color: Colors.white),
    ),
    NotificationItem(
      title: 'Happy Birthday!',
      content: 'Wishing you a happy birthday! ',
      icon: const Icon(
        Icons.cake,
        color: Colors.white,
      ),
    ),
  ];

  // Add a new notification (for demonstration purposes)
  void addNotification(NotificationItem notification) {
    setState(() {
      notifications.add(notification);
    });
  }

  // Remove a notification (for demonstration purposes)
  void removeNotification(NotificationItem notification) {
    setState(() {
      notifications.remove(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        backgroundColor: Colors.transparent, // Make app bar transparent
      ),
      body: Stack(
        children: [
          // Background image container (replace with your image path)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/inicio.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Notification list on top of the background image
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final notification = notifications[index];
                    return ListTile(
                      title: Text(notification.title),
                      subtitle: Text(notification.content),
                      leading: notification.icon,
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () => removeNotification(notification),
                      ),
                      onTap: () => navigateToNotificationDetails(notification),
                    );
                  },
                  childCount: notifications.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Class representing a notification item
class NotificationItem {
  final String title;
  final String content;
  final Icon icon;

  NotificationItem({
    required this.title,
    required this.content,
    required this.icon,
  });
}

// Placeholder function for navigating to notification details
void navigateToNotificationDetails(NotificationItem notification) {
  // Implement navigation to the notification details screen
  // Pass the notification object as an argument
  print('Navigating to details for: ${notification.title}');
}

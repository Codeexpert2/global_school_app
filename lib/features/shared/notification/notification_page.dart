import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:global_school/core/locale/generated/l10n.dart';
import 'package:global_school/core/themes/app_colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).notifications,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            // Example usage:
            final myNotification = NotificationData(
              id: index.toString(),
              title: 'New Message',
              body: 'You have a new message from John Doe.',
              date: DateTime.now(),
            );
            return NotificationCard(
              notification: myNotification,
            );
          },
        ));
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
  });

  final NotificationData notification; // Use a data model

  @override
  Widget build(BuildContext context) {
    return Card(
      // Use Card widget for built-in shadow and rounded corners
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: Badge(
          smallSize: 1,
          isLabelVisible: true,
          offset: const Offset(16, -8),
          label: const Icon(
            Icons.circle,
            size: 1,
            color: AppColors.error400,
          ),
          child: Icon(
            Icons.notifications,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              notification.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat.yMMMd().format(notification.date), // Format the date
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        subtitle: Text(
          notification.body,
        ),
        // trailing: const Icon(
        //   Icons.circle,
        //   size: 8,
        //   color: Colors.red,
        // ), // Add a chevron
        onTap: () {
          // Handle tap action (e.g., navigate to details screen)
          print('Notification tapped: ${notification.id}');
        },
      ),
    );
  }
}

class NotificationData {
  NotificationData(
      {required this.id,
      required this.title,
      required this.body,
      required this.date}); // Example data model
  final String id;
  final String title;
  final String body;
  final DateTime date;
}

import 'package:flutter/material.dart';

class GuardianNotificationPage extends StatelessWidget {
  const GuardianNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Guardian Notifications'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return NotificationCard(
              index: index.toString(),
            );
          },
        ));
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    this.index = '1',
  });

  final String index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                'Notification $index',
                style: const TextStyle(fontSize: 18.0),
              ),
              const Spacer(),
              const Text(
                '12/21/2015',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Text('This is a notification from Guardian App'),
          const SizedBox(height: 8.0),
          const Text('Tap to view more details'),
        ],
      ),
    );
  }
}

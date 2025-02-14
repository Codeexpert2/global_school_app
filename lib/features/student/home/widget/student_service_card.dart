import 'package:flutter/material.dart';

import 'package:global_school/core/router/app_routes.dart';

class StudentServiceCard extends StatelessWidget {
  const StudentServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.routeName,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(.7),
              color.withOpacity(.6),
              color.withOpacity(.5),
              color.withOpacity(.4),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.1),
              blurRadius: 8,
            ),
          ]),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 32,
            child: Icon(
              icon,
              size: 64,
              color: Colors.white.withOpacity(.25),
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white.withOpacity(0.5),
              child: Icon(icon, size: 28, color: color),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    // color: Colors.white,
                  ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                // color: Colors.grey.shade600,
                fontSize: 14,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              // color: Colors.grey,
            ),
            onTap: () => context.pushNamed(routeName),
          ),
        ],
      ),
    );
  }
}

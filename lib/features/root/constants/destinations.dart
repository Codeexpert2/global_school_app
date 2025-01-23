import 'package:flutter/material.dart';

const List<NavigationDestination> destinations = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.category_outlined),
    selectedIcon: Icon(Icons.category),
    label: 'Online Lesson',
  ),
  NavigationDestination(
    icon: Icon(Icons.search_outlined),
    selectedIcon: Icon(Icons.search),
    label: 'Search',
  ),
  NavigationDestination(
    icon: Icon(Icons.notifications_outlined),
    selectedIcon: Icon(Icons.notifications),
    label: 'Notifications',
  ),
  NavigationDestination(
    icon: Icon(Icons.person_outline),
    selectedIcon: Icon(Icons.person),
    label: 'Profile',
  ),
];

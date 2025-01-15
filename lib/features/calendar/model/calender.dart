import 'dart:ui';

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.location,
      this.description);
      
  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final String location;
  final String description;
}

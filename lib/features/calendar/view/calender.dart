import 'package:flutter/material.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/features/calendar/model/calender.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentCalendarPage extends StatefulWidget {
  const StudentCalendarPage({super.key});

  @override
  State<StudentCalendarPage> createState() => _StudentCalendarPageState();
}

class _StudentCalendarPageState extends State<StudentCalendarPage> {
  late CalendarDataSource _calendarDataSource;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final meetings = _getStudentSchedule();
    setState(() {
      _calendarDataSource = MeetingDataSource(meetings);
      _isLoading = false;
    });
  }

  List<Meeting> _getStudentSchedule() {
    final today = DateTime.now();
    return [
      Meeting(
          'محاضرة الرياضيات',
          today.add(const Duration(hours: 5)),
          today.add(const Duration(hours: 6)),
          const Color(0xFF0F8644),
          'قاعة 101',
          'محاضرة حساب التفاضل والتكامل'),
      Meeting(
          'اجتماع مع المستشار',
          today.add(const Duration(hours: 11)),
          today.add(const Duration(hours: 12)),
          const Color(0xFF8B0000),
          'المكتب الرئيسي',
          'مراجعة الخطة الدراسية'),
      Meeting(
          'ورشة برمجة',
          today.add(const Duration(days: 1, hours: 14)),
          today.add(const Duration(days: 1, hours: 16)),
          const Color(0xFF1E90FF),
          'مختبر 303',
          'ورشة حول أساسيات Flutter'),
      Meeting(
          'مشروع المجموعة',
          today.add(const Duration(days: 2, hours: 10)),
          today.add(const Duration(days: 2, hours: 12)),
          const Color(0xFFFFA500),
          'غرفة الاجتماعات',
          'مناقشة تفاصيل مشروع التخرج'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        // showBackButton: false,
        title: 'Student Calendar Page',
        // onBackPressed: () {
        //   Navigator.pop(context);
        // },
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SfCalendar(
              view: CalendarView.week,
              dataSource: _calendarDataSource,
              allowedViews: const [
                CalendarView.day,
                CalendarView.week,
                CalendarView.month,
                CalendarView.schedule
              ],
              onTap: _onCalendarTapped,
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
            ),
    );
  }

  void _onCalendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      final meeting = details.appointments!.first as Meeting;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(meeting.eventName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('التاريخ: ${meeting.from}'),
              Text(
                  'الوقت: ${meeting.from.hour}:${meeting.from.minute} - ${meeting.to.hour}:${meeting.to.minute}'),
              Text('المكان: ${meeting.location}'),
              Text('الوصف: ${meeting.description}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('إغلاق'),
            ),
          ],
        ),
      );
    }
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => _getMeeting(index).from;

  @override
  DateTime getEndTime(int index) => _getMeeting(index).to;

  @override
  String getSubject(int index) => _getMeeting(index).eventName;

  @override
  Color getColor(int index) => _getMeeting(index).background;

  Meeting _getMeeting(int index) => appointments![index];
}

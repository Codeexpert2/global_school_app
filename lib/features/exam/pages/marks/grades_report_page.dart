import 'package:flutter/material.dart';
import 'package:global_school/features/exam/pages/marks/marks_printer.dart';

class GradesReportPage extends StatelessWidget {
  GradesReportPage({super.key});

  final List<Map<String, dynamic>> subjects = [
    {'name': 'الرياضيات', 'fullMark': 100, 'studentMark': 85},
    {'name': 'الفيزياء', 'fullMark': 100, 'studentMark': 90},
    {'name': 'الكيمياء', 'fullMark': 100, 'studentMark': 78},
    {'name': 'الأحياء', 'fullMark': 100, 'studentMark': 88},
    {'name': 'التاريخ', 'fullMark': 100, 'studentMark': 92},
  ];

  final String studentName = 'محمد أحمد';
  final String fatherName = 'أحمد علي';
  final String motherName = 'فاطمة محمد';
  final String studentClass = 'الصف التاسع';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الجلاء المدرسي',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: DataTable(
                  columnSpacing: 16,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'المادة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'العلامة الكاملة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'علامة الطالب',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: subjects
                      .map(
                        (subject) => DataRow(
                          cells: [
                            DataCell(Text(subject['name'])),
                            DataCell(Text(subject['fullMark'].toString())),
                            DataCell(Text(subject['studentMark'].toString())),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                PdfPrinterPage.generatePdf(
                  studentName: studentName,
                  fatherName: fatherName,
                  motherName: motherName,
                  studentClass: studentClass,
                  subjects: subjects,
                );
              },
              icon: const Icon(Icons.print),
              label: const Text(
                'طباعة العلامات',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFF6F7FB),
    );
  }
}

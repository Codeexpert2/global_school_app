import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show rootBundle;

class PdfPrinterPage {
  static Future<pw.Font> loadCairoFont() async {
    final fontData = await rootBundle.load('assets/fonts/Cairo-Regular.ttf');
    return pw.Font.ttf(fontData);
  }

  static void generatePdf({
    required String studentName,
    required String fatherName,
    required String motherName,
    required String studentClass,
    required List<Map<String, dynamic>> subjects,
  }) async {
    final pdf = pw.Document();
    final cairoFont = await loadCairoFont();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'الجلاء المدرسي',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                  font: cairoFont,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'اسم الطالب: $studentName',
                style: pw.TextStyle(font: cairoFont),
              ),
              pw.Text(
                'اسم الأب: $fatherName',
                style: pw.TextStyle(font: cairoFont),
              ),
              pw.Text(
                'اسم الأم: $motherName',
                style: pw.TextStyle(font: cairoFont),
              ),
              pw.Text(
                'الصف: $studentClass',
                style: pw.TextStyle(font: cairoFont),
              ),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['المادة', 'العلامة الكاملة', 'علامة الطالب'],
                data: subjects
                    .map((subject) => [
                          subject['name'],
                          subject['fullMark'],
                          subject['studentMark'],
                        ])
                    .toList(),
                cellAlignment: pw.Alignment.centerRight,
                cellStyle: pw.TextStyle(
                  font: cairoFont,
                ),
                headerStyle: pw.TextStyle(
                  font: cairoFont,
                  fontWeight: pw.FontWeight.bold,
                ),
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey300,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}

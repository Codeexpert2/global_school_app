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
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end, // المحاذاة للنصوص من اليمين
          children: [
            pw.Text(
              'الجلاء المدرسي',
              textDirection: pw.TextDirection.rtl, // اتجاه النص من اليمين لليسار
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
                font: cairoFont,
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'اسم الطالب: $studentName',
              textDirection: pw.TextDirection.rtl,
              style: pw.TextStyle(font: cairoFont),
            ),
            pw.Text(
              'اسم الأب: $fatherName',
              textDirection: pw.TextDirection.rtl,
              style: pw.TextStyle(font: cairoFont),
            ),
            pw.Text(
              'اسم الأم: $motherName',
              textDirection: pw.TextDirection.rtl,
              style: pw.TextStyle(font: cairoFont),
            ),
            pw.Text(
              'الصف: $studentClass',
              textDirection: pw.TextDirection.rtl,
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
                // textDirection: pw.TextDirection.rtl,
              ),
              headerStyle: pw.TextStyle(
                font: cairoFont,
                fontWeight: pw.FontWeight.bold,
                // textDirection: pw.TextDirection.rtl,
              ),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
            ),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }
}

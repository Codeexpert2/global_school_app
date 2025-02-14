import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({
    super.key,
    required this.pdfPath,
  });
  final String? pdfPath;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  Future<void> moveFileToDownloads() async {
    try {
      final sourcePath = widget.pdfPath;
      final downloadsDirectory = await getExternalStorageDirectory();
      if (downloadsDirectory != null) {
        final destinationPath = '${downloadsDirectory.path}/SavedDoc2.pdf';
        final file = File(sourcePath ?? '');

        if (await file.exists()) {
          await file.copy(destinationPath);
          log('تم نسخ الملف إلى $destinationPath');
        } else {
          log('الملف غير موجود');
        }
      } else {
        log('تعذر الوصول إلى مجلد التنزيلات');
      }
    } catch (e) {
      log('حدث خطأ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عرض ملف PDF'),
      ),
      body: Stack(
        children: [
          // SfPdfViewer.file(
          //   File(widget.pdfPath),
          // ),
          SfPdfViewer.asset(
            widget.pdfPath ?? '',
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: moveFileToDownloads,
              child: const Text('حفظ الملف'),
            ),
          ),
        ],
      ),
    );
  }
}

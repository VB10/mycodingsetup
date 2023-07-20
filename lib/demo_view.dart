import 'package:core/package/pdf/custom_pdf_controller.dart';
import 'package:core/package/pdf/pdf_viewer.dart';
import 'package:core/package/validator/url_validator.dart';
import 'package:flutter/material.dart';

class DemoView extends StatefulWidget {
  const DemoView({super.key});
  @override
  State<DemoView> createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  final PdfxController _pdfViewerController = PdfxController('assets');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pdfViewerController.nextPage,
      ),
      body: CustomPDFView(
        validator: UrlValidator(),
        pdfViewerController: _pdfViewerController,
        url:
            'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
      ),
    );
  }
}

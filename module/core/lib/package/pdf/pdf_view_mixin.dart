import 'package:core/package/pdf/pdf_viewer.dart';
import 'package:flutter/material.dart';

import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'custom_pdf_controller.dart';

mixin CustomPDFViewMixin on State<CustomPDFView> {
  late final PdfViewerController _pdfViewerController;
  late final PdfController pdfXController;
  late final CustomPdfController pdfController;
  PdfViewerController get pdfViewerController => _pdfViewerController;

  bool isValid = false;
  late final String url;
  @override
  void initState() {
    super.initState();
    final controller = widget.pdfViewerController;
    if (controller is SyncfusionPdfController) {
      _pdfViewerController = controller.pdfViewerController;
    }

    if (controller is PdfxController) {
      pdfXController = controller.pdfController;
    }

    pdfController = controller;
    url = widget.url;
    isValid = widget.validator.hasMatch(url);
  }

  @override
  void dispose() {
    super.dispose();
    _pdfViewerController.dispose();
  }
}

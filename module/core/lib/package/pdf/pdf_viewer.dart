import 'package:core/package/pdf/pdf_view_mixin.dart';
import 'package:flutter/material.dart';

import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../validator/custom_validator.dart';
import 'custom_pdf_controller.dart';

final class CustomPDFView extends StatefulWidget {
  const CustomPDFView({
    required this.url,
    required this.pdfViewerController,
    required this.validator,
    super.key,
  });
  final String url;
  final CustomPdfController pdfViewerController;
  final CustomValidator validator;
  @override
  State<CustomPDFView> createState() => _CustomPDFViewState();
}

class _CustomPDFViewState extends State<CustomPDFView> with CustomPDFViewMixin {
  @override
  Widget build(BuildContext context) {
    if (!isValid) {
      return const SizedBox.shrink();
    }

    if (pdfController is PdfxController) {
      return PdfView(
        controller: pdfXController,
      );
    }

    if (pdfController is SyncfusionPdfController) {
      return SfPdfViewer.network(
        widget.url,
        controller: pdfViewerController,
      );
    }

    return const SizedBox.shrink();
  }
}

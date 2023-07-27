// import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

abstract class CustomPdfController {
  void nextPage();
  void previousPage();
  void dispose();
}

class SyncfusionPdfController implements CustomPdfController {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  PdfViewerController get pdfViewerController => _pdfViewerController;
  @override
  void nextPage() {
    _pdfViewerController.nextPage();
  }

  @override
  void previousPage() {
    _pdfViewerController.previousPage();
  }

  @override
  void dispose() {
    _pdfViewerController.dispose();
  }
}

class PdfxController implements CustomPdfController {
  // PdfxController(String url) {
  //   pdfController = PdfController(
  //     document: PdfDocument.openAsset(url),
  //   );
  // }

  // late final PdfController pdfController;

  @override
  void dispose() {
    // pdfController.dispose();
  }

  @override
  void nextPage() {
    // pdfController.nextPage(duration: Duration.zero, curve: Curves.bounceIn);
  }

  @override
  void previousPage() {
    // pdfController.previousPage(curve: Curves.bounceIn, duration: Duration.zero);
  }
}

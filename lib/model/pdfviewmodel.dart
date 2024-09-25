// To parse this JSON data, do
//
//     final pdfViewModel = pdfViewModelFromJson(jsonString);

import 'dart:convert';

List<PdfViewModel> pdfViewModelFromJson(String str) => List<PdfViewModel>.from(
    json.decode(str).map((x) => PdfViewModel.fromJson(x)));

String pdfViewModelToJson(List<PdfViewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PdfViewModel {
  String patientExportFile;
  String patientExportFolderPath;
  dynamic exportUrl;

  PdfViewModel({
    required this.patientExportFile,
    required this.patientExportFolderPath,
    required this.exportUrl,
  });

  factory PdfViewModel.fromJson(Map<String, dynamic> json) => PdfViewModel(
        patientExportFile: json["patientExportFile"],
        patientExportFolderPath: json["patientExportFolderPath"],
        exportUrl: json["exportURL"],
      );

  Map<String, dynamic> toJson() => {
        "patientExportFile": patientExportFile,
        "patientExportFolderPath": patientExportFolderPath,
        "exportURL": exportUrl,
      };
}

// ignore_for_file: deprecated_member_use, must_be_immutable, depend_on_referenced_packages, library_private_types_in_public_api, non_constant_identifier_names, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  String pdfUrl = "";
  PdfViewerPage({super.key, required this.pdfUrl});
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late File Pfile;
  bool isLoading = false;
  Future<void> loadNetwork() async {
    print("pdf page");
    print(widget.pdfUrl);
    setState(() {
      isLoading = true;
    });
    var url = widget.pdfUrl;
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });

    print(Pfile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork();

    super.initState();
  }

  deviceBack() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return deviceBack();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            "PDF Viewer",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: SizedBox(
                  height: 510,
                  width: 395,
                  child: PDFView(
                    filePath: Pfile.path,
                  ),
                ),
              ),
      ),
    );
  }
}

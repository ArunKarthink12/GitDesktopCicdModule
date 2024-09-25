// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Center(
            child: Image.asset('images/nointernet.jpg',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text('Whoops !',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.035,
                          color: Colors.indigo[500],
                          fontWeight: FontWeight.w700))),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text('No internet connection found.',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600))),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              child: Text("Check your connection or Try again",
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.015,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600))),
            ),
          ]),
        ),
      ],
    );
  }
}

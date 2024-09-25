// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';

class DummyDetails extends StatefulWidget {
  const DummyDetails({Key? key}) : super(key: key);

  @override
  _DummyDetailsState createState() => _DummyDetailsState();
}

class _DummyDetailsState extends State<DummyDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: circleContainer(color: appcolor),
        ),
        Text(
          'RESET PASSWORD',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '''Set the new password for your account so you can login and access all the features.''',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

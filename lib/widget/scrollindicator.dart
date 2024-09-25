import 'package:flutter/material.dart';

class ScrollIndicator {
  scrollIndicator(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.transparent, width: 2)),
              alignment: Alignment.bottomCenter,
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

  static scrollSwitch(bool type, BuildContext context) {
    switch (type) {
      case true:
        ScrollIndicator().scrollIndicator(context);
        break;
      case false:
        Navigator.pop(context);
        break;
    }
  }
}

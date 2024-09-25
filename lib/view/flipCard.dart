import 'dart:math';

import 'dart:developer';
import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/controller/viewdetailscontroller/getresult/get_result_listColntoller.dart';
import 'package:doctor_module/model/test_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WidgetFlipper extends StatefulWidget {
  int? index;
  int? innerIndex;
  List<TestDetailsmodel>? data;
  WidgetFlipper({
    Key? key,
    this.frontWidget,
    this.backWidget,
    this.index,
    this.data,
    this.innerIndex,
  }) : super(key: key);

  final Widget? frontWidget;
  final Widget? backWidget;

  @override
  _WidgetFlipperState createState() => _WidgetFlipperState();
}

class _WidgetFlipperState extends State<WidgetFlipper>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? _frontRotation;
  Animation<double>? _backRotation;
  bool isFrontVisible = true;
  GetResultListcolntoller getResultListcolntoller =
      Get.put(GetResultListcolntoller());
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller!);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(controller!);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedCard(
          animation: _backRotation!,
          child: widget.backWidget!,
        ),
        AnimatedCard(
          animation: _frontRotation!,
          child: widget.frontWidget!,
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: _tapDetectionControls(),
        // ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: _tapCommandControls(
        //       index: widget.index, innerIndex: widget.innerIndex),
        // )
      ],
    );
  }

  Widget _tapCommandControls({index, innerIndex}) {
    TextEditingController commands = TextEditingController();
    commands.text = widget.data!.first.lstvisit.first.lstorderlist[index]
        .lstorderdetail[innerIndex].resultcomments
        .toString();
    return Center(
        child: Material(
            color: appColor1, // Background color of the button
            shape: CircleBorder(),
            child: IconButton(
              icon: Icon(Icons.comment), // Comment icon
              color: Colors.white, // Icon color
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: 80.0.wp, // Adjust width as needed
                        height: 25.0.hp, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15.0.hp,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      20), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    widget
                                        .data!
                                        .first
                                        .lstvisit
                                        .first
                                        .lstorderlist[index]
                                        .lstorderdetail[innerIndex]
                                        .resultcomments = value;
                                  },
                                  controller: commands,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your comment here...',
                                    border: InputBorder
                                        .none, // Remove the underline
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.0.hp,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        // log();
                                        getResultListcolntoller
                                            .action(action: "SD")
                                            .then((value) {
                                          Get.back();

                                          // showMyDialog(title: "Approve");
                                        });
                                        print(
                                            "checking :: ${index} List inside ${innerIndex}");
                                      },
                                      child: Text("Save")))
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                );
              },
            )));
  }

  Widget _tapDetectionControls() {
    return GestureDetector(
        onTap: _leftRotation,
        child: Icon(isFrontVisible == true
            ? Icons.difference_outlined
            : Icons.bar_chart_sharp));
    //   Stack(
    //   fit: StackFit.expand,
    //   children: <Widget>[
    //     GestureDetector(
    //       onTap: _leftRotation,
    //       child: FractionallySizedBox(
    //         widthFactor: 0.5,
    //         heightFactor: 1.0,
    //         alignment: Alignment.topLeft,
    //         child: Container(
    //           color: Colors.transparent,
    //         ),
    //       ),
    //     ),
    //     GestureDetector(
    //       onTap: _rightRotation,
    //       child: FractionallySizedBox(
    //         widthFactor: 0.5,
    //         heightFactor: 1.0,
    //         alignment: Alignment.topRight,
    //         child: Container(
    //           color: Colors.transparent,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  void _leftRotation() {
    _toggleSide();
  }

  void _rightRotation() {
    _toggleSide();
  }

  void _toggleSide() {
    if (isFrontVisible == true) {
      controller!.forward();
      isFrontVisible = false;
    } else {
      controller!.reverse();
      isFrontVisible = true;
    }
    setState(() {});
  }
}

class AnimatedCard extends StatelessWidget {
  AnimatedCard({
    this.child,
    this.animation,
  });

  final Widget? child;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, Widget? child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation!.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}

class CommandSection extends StatefulWidget {
  List<TestDetailsmodel>? data;
  int index;
  int innerIndex;

  CommandSection(
      {super.key, this.data, required this.index, required this.innerIndex});

  @override
  State<CommandSection> createState() => _CommandSectionState();
}

class _CommandSectionState extends State<CommandSection> {
  GetResultListcolntoller getResultListcolntoller =
      Get.put(GetResultListcolntoller());
  @override
  Widget build(BuildContext context) {
    return tapCommandControls(
        index: widget.index, innerIndex: widget.innerIndex);
    // Action when the button is pressed
  }

  Widget tapCommandControls({index, innerIndex}) {
    TextEditingController commands = TextEditingController();
    commands.text = widget.data!.first.lstvisit.first.lstorderlist[index]
        .lstorderdetail[innerIndex].resultcomments
        .toString();
    return Center(
        child: Material(
            color: appColor1, // Background color of the button
            shape: CircleBorder(),
            child: IconButton(
              icon: Icon(Icons.comment), // Comment icon
              color: Colors.white, // Icon color
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                        child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: 80.0.wp, // Adjust width as needed
                        height: 25.0.hp, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(20), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 15.0.hp,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      20), // Rounded corners
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    widget
                                        .data!
                                        .first
                                        .lstvisit
                                        .first
                                        .lstorderlist[index]
                                        .lstorderdetail[innerIndex]
                                        .resultcomments = value;
                                  },
                                  controller: commands,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your comment here...',
                                    border: InputBorder
                                        .none, // Remove the underline
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.0.hp,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        // log();
                                        getResultListcolntoller
                                            .action(action: "SD")
                                            .then((value) {
                                          Get.back();

                                          // showMyDialog(title: "Approve");
                                        });
                                        print(
                                            "checking :: ${index} List inside ${innerIndex}");
                                      },
                                      child: Text("Save")))
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                );
              },
            )));
  }
}

class GraphSection extends StatefulWidget {
  List<TestDetailsmodel> data;
  int index;
  int innerIndex;

  GraphSection(
      {super.key,
      required this.data,
      required this.index,
      required this.innerIndex});

  @override
  State<GraphSection> createState() => _GraphSectionState();
}

class _GraphSectionState extends State<GraphSection> {
  GetResultListcolntoller getResultListcolntoller =
      Get.put(GetResultListcolntoller());
  List<_SalesData> datagraph = [
    _SalesData('12/03/2024', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return tabGraphVector(index: widget.index, innerIndex: widget.innerIndex);
    // Action when the button is pressed
  }

  Widget tabGraphVector({index, innerIndex}) {
    TextEditingController commands = TextEditingController();
    commands.text = widget.data!.first.lstvisit.first.lstorderlist[index]
        .lstorderdetail[innerIndex].resultcomments
        .toString();
    return Center(
        child: Material(
            color: appColor1, // Background color of the button
            shape: CircleBorder(),
            child: IconButton(
              icon: Icon(Icons.auto_graph_sharp), // Comment icon
              color: Colors.white, // Icon color
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      alignment: Alignment.center,
                      child: SfCartesianChart(
                          primaryXAxis: const CategoryAxis(),
                          title:
                              const ChartTitle(text: 'Patient Data analysis'),
                          legend: const Legend(isVisible: true),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <CartesianSeries<_SalesData, String>>[
                            LineSeries<_SalesData, String>(
                                dataSource: datagraph,
                                xValueMapper: (_SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (_SalesData sales, _) =>
                                    sales.sales,
                                name: 'Result',
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true))
                          ]),
                    );
                  },
                );
              },
            )));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

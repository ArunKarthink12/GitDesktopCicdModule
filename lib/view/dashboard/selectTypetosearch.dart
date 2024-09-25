import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/const/styleText.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> list = <String>[
    'All',
    'Patient-Id',
    'Patient-Name',
  ];
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());

  String dropdownValue = "All";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
          onPressed: () {
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      height: 30.0.hp,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 30),
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: list.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      print(list[index]);
                                      viewdetailsController.searchType.value =
                                          "0";
                                      viewdetailsController.visitIdSearch.text =
                                          "";
                                      viewdetailsController.searchName.value =
                                          "All";
                                      viewdetailsController.visitIdSearch
                                          .clear();

                                      if (list[index] == "Patient-Id") {
                                        viewdetailsController.searchType.value =
                                            "1";
                                        viewdetailsController.searchName.value =
                                            list[index];
                                      } else {
                                        if (list[index] == "Patient-Name") {
                                          viewdetailsController
                                              .searchType.value = "2";
                                          viewdetailsController
                                              .searchName.value = list[index];
                                        } else {
                                          viewdetailsController
                                              .searchType.value = "0";
                                          viewdetailsController
                                              .searchName.value = list[index];
                                        }
                                      }

                                      Get.back();
                                      print(viewdetailsController
                                          .searchType.value);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            height: 4.0.hp,
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  list[index].toString(),
                                                  style: textstyle3.copyWith(
                                                      fontSize: 10.0.sp),
                                                ))),
                                        Checkbox(
                                          value: viewdetailsController
                                                      .searchName.value ==
                                                  list[index]
                                              ? true
                                              : false,
                                          onChanged: (value) {
                                            print(list[index]);
                                            viewdetailsController
                                                .searchType.value = "0";
                                            viewdetailsController
                                                .visitIdSearch.text = "";
                                            viewdetailsController
                                                .searchName.value = "All";
                                            viewdetailsController.visitIdSearch
                                                .clear();

                                            if (list[index] == "Patient-Id") {
                                              viewdetailsController
                                                  .searchType.value = "1";
                                              viewdetailsController.searchName
                                                  .value = list[index];
                                            } else {
                                              if (list[index] ==
                                                  "Patient-Name") {
                                                viewdetailsController
                                                    .searchType.value = "2";
                                                viewdetailsController.searchName
                                                    .value = list[index];
                                              } else {
                                                viewdetailsController
                                                    .searchType.value = "0";
                                                viewdetailsController.searchName
                                                    .value = list[index];
                                              }
                                            }

                                            Get.back();
                                            print(viewdetailsController
                                                .searchType.value);
                                          },
                                        )
                                      ],
                                    ));
                              },
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 30,
                            child: Text(
                              "Search By :",
                              style: textstyle3.copyWith(fontSize: 12.0.sp),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          icon: const Icon(Icons.search)),
    );
  }
}

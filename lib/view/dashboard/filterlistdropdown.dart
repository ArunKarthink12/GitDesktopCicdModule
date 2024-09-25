// ignore_for_file: must_be_immutable

import 'package:doctor_module/const/responsive.dart';
import 'package:doctor_module/controller/sort/servicefiltercontroller.dart';
import 'package:doctor_module/model/branchmodel.dart';
import 'package:doctor_module/model/routedetail.dart';
import 'package:doctor_module/model/servicefiltermodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/viewdetailscontroller/view_details_controller.dart';

class ServiceFilterDropdown extends StatefulWidget {
  List<GetServiceDetail> datas;
  ServiceFilterDropdown({super.key, required this.datas});

  @override
  State<ServiceFilterDropdown> createState() => _ServiceFilterDropdownState();
}

class _ServiceFilterDropdownState extends State<ServiceFilterDropdown> {
  GetServiceDetail? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  ServicefilterController servicefilterController =
      Get.put(ServicefilterController());
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  final TextEditingController iconController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            height: 5.0.hp,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<GetServiceDetail>(
                isExpanded: true,
                hint: Text(
                  servicefilterController.tempSelectedServicename.value == "" &&
                          servicefilterController.selectedServicename.value ==
                              ""
                      ? "Service"
                      : servicefilterController.tempSelectedServicename.value ==
                              ""
                          ? servicefilterController.selectedServicename.value
                          : servicefilterController
                              .tempSelectedServicename.value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: widget.datas
                    .map((GetServiceDetail item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.serviceName.toLowerCase(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  setState(() {
                    servicefilterController.tempSelectedServiceType.value =
                        value!.serviceType.toString();

                    servicefilterController.tempSelectedServicename.value =
                        value.serviceName.toString();

                    servicefilterController.tempSelectedServiceid.value =
                        value.serviceNo.toString();
                  });
                  print(selectedValue!.serviceName);
                  print(selectedValue!.serviceNo);
                  print(selectedValue!.serviceType);
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 200,
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 40.0.hp,
                    width: MediaQuery.of(context).size.width,
                    isOverButton: false),
                menuItemStyleData: MenuItemStyleData(
                  selectedMenuItemBuilder: (context, child) {
                    return Container(
                      height: 2.0.hp,
                      width: 2.0.wp,
                      color: Colors.amber,
                    );
                  },
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 10,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an Service...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.serviceName
                        .toString()
                        .toLowerCase()
                        .contains(searchValue);
                  },
                ),
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
          Visibility(
            visible:
                servicefilterController.tempSelectedServicename.value == "" &&
                        servicefilterController.selectedServicename.value == ""
                    ? false
                    : true,
            child: GestureDetector(
                onTap: () async {
                  servicefilterController.tempSelectedServiceType.value = " ";

                  servicefilterController.tempSelectedServiceid.value = "0";
                  servicefilterController.tempSelectedServicename.value = "";

                  servicefilterController.selectedServiceType.value = " ";

                  servicefilterController.selectedServiceid.value = "0";
                  servicefilterController.selectedServicename.value = "";
                  print(servicefilterController.selectedServiceType.value);
                  print(servicefilterController.selectedServiceid.value);
                  print(servicefilterController.selectedServicename.value);
                  await viewdetailsController.viewlistController(
                      venuBranchNo:
                          servicefilterController.tempSelectedBranchId.value,
                      customerNo:
                          servicefilterController.selectedCustomerid.value == ""
                              ? "0"
                              : servicefilterController
                                  .selectedCustomerid.value,
                      visitId: viewdetailsController.visitIdSearch.text,
                      serviceId:
                          servicefilterController.selectedServiceid.value == ""
                              ? "0"
                              : servicefilterController.selectedServiceid.value
                                  .toString(),
                      serviceType: servicefilterController
                                  .selectedServiceType.value ==
                              ""
                          ? " "
                          : servicefilterController.selectedServiceType.value
                              .toString(),
                      fromDate: viewdetailsController.selectFromDate.value,
                      toDate: viewdetailsController.selectToDate.value);
                  Get.appUpdate();
                  print(servicefilterController.selectedServiceType.value);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ),
        ],
      );
    });
  }
}

class CustomerFilterDropdown extends StatefulWidget {
  List<GetCustomerDetail> datas;
  CustomerFilterDropdown({super.key, required this.datas});

  @override
  State<CustomerFilterDropdown> createState() => _CustomerFilterDropdownState();
}

class _CustomerFilterDropdownState extends State<CustomerFilterDropdown> {
  GetCustomerDetail? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  ServicefilterController servicefilterController =
      Get.put(ServicefilterController());
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            height: 5.0.hp,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<GetCustomerDetail>(
                isExpanded: true,
                hint: Text(servicefilterController
                                .tempSelectedCustomername.value ==
                            "" &&
                        servicefilterController.selectedCustomername.value == ""
                    ? "Client"
                    : servicefilterController.tempSelectedCustomername.value !=
                            ""
                        ? servicefilterController.tempSelectedCustomername.value
                        : servicefilterController.selectedCustomername.value),
                items: widget.datas
                    .map((GetCustomerDetail item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.customerName.toLowerCase(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  setState(() {
                    servicefilterController.tempSelectedCustomername.value =
                        value!.customerName.toString();

                    servicefilterController.tempSelectedCustomerid.value =
                        value.customerNo.toString();
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 200,
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 38.0.hp,
                    width: MediaQuery.of(context).size.width,
                    isOverButton: false),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an Service...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.customerName
                        .toString()
                        .toLowerCase()
                        .contains(searchValue);
                  },
                ),
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
          Visibility(
            visible:
                servicefilterController.tempSelectedCustomername.value == "" &&
                        servicefilterController.selectedCustomername.value == ""
                    ? false
                    : true,
            child: GestureDetector(
                onTap: () async {
                  servicefilterController.tempSelectedCustomerid.value = "0";
                  servicefilterController.tempSelectedCustomername.value = "";

                  servicefilterController.selectedCustomerid.value = "0";
                  servicefilterController.selectedCustomername.value = "";

                  await viewdetailsController.viewlistController(
                      venuBranchNo:
                          servicefilterController.tempSelectedBranchId.value,
                      customerNo:
                          servicefilterController.selectedCustomerid.value == ""
                              ? "0"
                              : servicefilterController
                                  .selectedCustomerid.value,
                      visitId: viewdetailsController.visitIdSearch.text,
                      serviceId:
                          servicefilterController.selectedServiceid.value == ""
                              ? "0"
                              : servicefilterController.selectedServiceid.value
                                  .toString(),
                      serviceType: servicefilterController
                                  .selectedServiceType.value ==
                              ""
                          ? " "
                          : servicefilterController.selectedServiceType.value
                              .toString(),
                      fromDate: viewdetailsController.selectFromDate.value,
                      toDate: viewdetailsController.selectToDate.value);
                  Get.appUpdate();
                  print(servicefilterController.selectedServiceType.value);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ),
        ],
      );
    });
  }
}

class BranchFilterDropdown extends StatefulWidget {
  List<BranchModel> datas;
  BranchFilterDropdown({super.key, required this.datas});

  @override
  State<BranchFilterDropdown> createState() => _BranchFilterDropdownState();
}

class _BranchFilterDropdownState extends State<BranchFilterDropdown> {
  BranchModel? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  ServicefilterController servicefilterController =
      Get.put(ServicefilterController());
  ViewdetailsController viewdetailsController =
      Get.put(ViewdetailsController());
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            height: 5.0.hp,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<BranchModel>(
                isExpanded: true,
                hint: Text(servicefilterController
                                .tempSelectedBranchName.value ==
                            "" &&
                        servicefilterController.selectedBranchName.value == ""
                    ? "Branch"
                    : servicefilterController.tempSelectedBranchName.value == ""
                        ? servicefilterController.selectedBranchName.value
                        : servicefilterController.tempSelectedBranchName.value),
                items: widget.datas
                    .map((BranchModel item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.venueBranchName.toLowerCase(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  setState(() {
                    servicefilterController.tempSelectedBranchName.value =
                        value!.venueBranchName.toString();
                    servicefilterController.tempSelectedBranchId.value =
                        value.venueBranchNo.toString();
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 200,
                ),
                dropdownStyleData: DropdownStyleData(
                    maxHeight: 40.0.hp,
                    width: MediaQuery.of(context).size.width,
                    isOverButton: false),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an Service...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.venueBranchName
                        .toString()
                        .toLowerCase()
                        .contains(searchValue);
                  },
                ),
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          ),
          Visibility(
            visible:
                servicefilterController.tempSelectedBranchName.value == "" &&
                        servicefilterController.selectedBranchName.value == ""
                    ? false
                    : true,
            child: GestureDetector(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  servicefilterController.tempSelectedBranchId.value =
                      pref.getString("venueBranchNo").toString();
                  servicefilterController.tempSelectedBranchName.value = "";

                  servicefilterController.selectedBranchId.value =
                      servicefilterController.tempSelectedBranchId.value;
                  servicefilterController.selectedBranchName.value = "";

                  await viewdetailsController.viewlistController(
                      venuBranchNo:
                          servicefilterController.tempSelectedBranchId.value,
                      customerNo:
                          servicefilterController.selectedCustomerid.value == ""
                              ? "0"
                              : servicefilterController
                                  .selectedCustomerid.value,
                      visitId: viewdetailsController.visitIdSearch.text,
                      serviceId:
                          servicefilterController.selectedServiceid.value == ""
                              ? "0"
                              : servicefilterController.selectedServiceid.value
                                  .toString(),
                      serviceType: servicefilterController
                                  .selectedServiceType.value ==
                              ""
                          ? " "
                          : servicefilterController.selectedServiceType.value
                              .toString(),
                      fromDate: viewdetailsController.selectFromDate.value,
                      toDate: viewdetailsController.selectToDate.value);
                  Get.appUpdate();
                  print(servicefilterController.selectedServiceType.value);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          ),
        ],
      );
    });
  }
}

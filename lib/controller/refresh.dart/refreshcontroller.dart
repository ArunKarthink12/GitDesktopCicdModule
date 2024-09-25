import 'package:doctor_module/controller/sort/servicefiltercontroller.dart';
import 'package:doctor_module/controller/viewdetailscontroller/view_details_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefreshController extends GetxController {
  ViewdetailsController viewdetailsController = Get.find();
  ServicefilterController servicefilterController = Get.find();
  final RefreshController refreshControllerpendings =
      RefreshController(initialRefresh: false);
  final RefreshController refreshControllerapprove =
      RefreshController(initialRefresh: false);
  void pendingonRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    Future.delayed(Duration.zero, () async {
      await viewdetailsController.viewlistController(
          venuBranchNo: servicefilterController.selectedBranchId.value,
          customerNo: servicefilterController.selectedCustomerid.value,
          visitId: viewdetailsController.visitIdSearch.text,
          serviceId: servicefilterController.selectedServiceid.value,
          serviceType: servicefilterController.selectedServiceType.value,
          fromDate: viewdetailsController.selectFromDate.value,
          toDate: viewdetailsController.selectToDate.value);
    }).then((value) {
      refreshControllerpendings.refreshCompleted();
    });
  }

  void approveonRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    Future.delayed(Duration.zero, () async {
      await viewdetailsController.viewlistController(
          venuBranchNo: servicefilterController.selectedBranchId.value,
          customerNo: servicefilterController.selectedCustomerid.value,
          visitId: viewdetailsController.visitIdSearch.text,
          serviceId: servicefilterController.selectedServiceid.value,
          serviceType: servicefilterController.selectedServiceType.value,
          fromDate: viewdetailsController.selectFromDate.value,
          toDate: viewdetailsController.selectToDate.value);
    }).then((value) {
      refreshControllerapprove.refreshCompleted();
    });
  }
}

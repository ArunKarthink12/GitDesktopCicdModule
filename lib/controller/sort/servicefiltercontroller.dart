import 'package:doctor_module/model/branchmodel.dart';
import 'package:doctor_module/model/servicefiltermodel.dart';
import 'package:doctor_module/service/sort/servicefilterservice.dart';
import 'package:get/get.dart';

class ServicefilterController extends GetxController {
  var client = ServicefilterService();
  RxBool isLoading = false.obs;
  RxBool isLoadingbranch = false.obs;
  List<Servicefiltermodel> getviewlistdata = <Servicefiltermodel>[];
  List<BranchModel> getviewlistbranchdata = <BranchModel>[];
  RxString selectedServiceType = " ".obs;
  RxString tempSelectedServiceType = " ".obs;
  RxString selectedServicename = "".obs;
  RxString tempSelectedServicename = "".obs;
  RxString selectedServiceid = "0".obs;
  RxString tempSelectedServiceid = "0".obs;
  RxString selectedCustomername = "".obs;
  RxString tempSelectedCustomername = "".obs;
  RxString selectedCustomerid = "0".obs;
  RxString tempSelectedCustomerid = "0".obs;
  RxString tempSelectedBranchName = "".obs;
  RxString selectedBranchName = "".obs;
  RxString tempSelectedBranchId = "1".obs;
  RxString selectedBranchId = "".obs;
  Future servicefilterController() async {
    getviewlistdata.clear();
    isLoading(false);
    try {
      var response = await client.serviceFiltersservice();

      if (response != null) {
        getviewlistdata.add(response);

        isLoading(true);
      } else {
        isLoading(true);
      }
    } catch (e) {
      rethrow;
    }
  }

  clearServiceFilter() {
    tempSelectedServiceType.value = " ";
    tempSelectedServiceid.value = "0";
    tempSelectedServicename.value = "";
  }

  Future branchfilterController() async {
    getviewlistbranchdata.clear();
    isLoadingbranch(false);
    try {
      var response = await client.branchFilterController();

      if (response != null) {
        getviewlistbranchdata = response;

        isLoadingbranch(true);
      } else {
        isLoadingbranch(true);
      }
    } catch (e) {
      rethrow;
    }
  }
}

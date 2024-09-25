import 'package:doctor_module/model/routedetail.dart';
import 'package:doctor_module/service/sort/routdetails.dart';
import 'package:get/get.dart';

class RoutelistController extends GetxController {
  var client = RoutelistService();
  List<Routemodel> getviewlistdata = <Routemodel>[];
  RxBool isLoading = false.obs;
  Future routelistController() async {
    getviewlistdata.clear();
    isLoading(false);
    try {
      var response = await client.routDetailsservice();

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
}

import 'package:doctor_module/const/colors.dart';
import 'package:doctor_module/model/loginmodel.dart';
import 'package:doctor_module/service/loginservice/loginservice.dart';
import 'package:doctor_module/widget/circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginscreenController extends GetxController {
  TextEditingController emailId = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool rememberMe = false.obs;
  RxBool isloginLoad = false.obs;

  List<Loginmodel> getloginmodel = <Loginmodel>[];

  var loginclient = LoginService();
  Widget multiButton({
    Widget? multiwidget,
    height,
    width,
    borderRadius,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: appcolor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        alignment: Alignment.center,
        child: multiwidget,
      ),
    );
  }

  Future loginController({context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (emailId.text.isEmpty) {
      loginToasterAlert(
          icon: Icons.close,
          context: context,
          title: "Please enter valied email",
          color: Colors.red);
    } else if (password.text.isEmpty) {
      loginToasterAlert(
          icon: Icons.close,
          context: context,
          title: "Please enter password",
          color: Colors.red);
    } else {
      getloginmodel.clear();

      isloginLoad(false);
      try {
        var response = await loginclient.loginService(
            context: context, username: emailId.text, password: password.text);

        if (response != null) {
          pref.setString("isLogin", "true");
          getloginmodel.add(response);

          pref.setString(
              "authToken", getloginmodel.first.data.token.toString());
          pref.setString("_qualification",
              getloginmodel.first.data.qualification.toString());
          pref.setString("_contactNumber",
              getloginmodel.first.data.contactNumber.toString());
          pref.setString(
              "_roleDetails", getloginmodel.first.data.roleDetails.toString());
          pref.setString("_doctorImageInNetworkUrl",
              getloginmodel.first.data.doctorImageInNetworkUrl.toString());
          pref.setString(
              "_doctorName", getloginmodel.first.data.doctorName.toString());
          pref.setString("venueBranchNo",
              getloginmodel.first.data.venueBranchNo.toString());
          pref.setString(
              "venueNo", getloginmodel.first.data.venueNo.toString());
          pref.setString("userNo", getloginmodel.first.data.userNo.toString());

          Fluttertoast.showToast(msg: "Login successfully");

          Get.toNamed('/bottomnavibar');
          isloginLoad(true);
        } else {
          Fluttertoast.showToast(msg: "Login failed");
        }
      } catch (e) {
        print("som error$e");
      }
    }
  }
}

loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Center(child: CircularProgressIndicator())),
    );
  }
}

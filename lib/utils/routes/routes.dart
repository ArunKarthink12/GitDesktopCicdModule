// import 'package:doctor_module/main.dart';
import 'package:doctor_module/view/PrescriptionScreen/PrescriptionScreen.dart';
import 'package:doctor_module/view/bottomnavigationbar/bottomnavibar.dart';
import 'package:doctor_module/view/dashboard/dashboard.dart';
import 'package:doctor_module/view/forgot_password/forgot_otp_screen.dart';
// import 'package:doctor_module/view/draft/draftmainscreen.dart';
import 'package:doctor_module/view/forgot_password/forgotpassword.dart';
import 'package:doctor_module/view/login/login_screen.dart';
import 'package:doctor_module/view/notification/notificationscreen.dart';
import 'package:doctor_module/view/settings/appointtimming/appointmenttimming.dart';
import 'package:doctor_module/view/settings/changepassword/changepassword.dart';
import 'package:doctor_module/view/settings/personaldetails/personaldetails.dart';
import 'package:doctor_module/view/settings/professionaldetails/professionaldetails.dart';
import 'package:doctor_module/view/settings/settings/settingsoptions.dart';
import 'package:doctor_module/view/settings/support/support.dart';
import 'package:doctor_module/view/settings/tearmsancondition/tearmsandcondition.dart';
import 'package:doctor_module/view/view_Details/approved_test_details.dart';
import 'package:doctor_module/view/view_Details/pending_test_details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static final routes = [
    // GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: "/recallpage", page: () => const ViewdetailsApprovedScreen()),

    GetPage(
        name: '/bottomnavibar', page: () => const BottomNaviCustomizedWidget()),
    GetPage(name: '/login', page: () => const LoginScreen()),
    GetPage(name: '/forgotpassword', page: () => const ForgotPassword()),
    GetPage(name: '/dashboard', page: () => const DashboardScreen()),
    // GetPage(name: '/draft', page: () => const Draftscreen()),
    GetPage(name: '/viewdetailspage', page: () => const ViewPatientDetails()),
    GetPage(name: '/notificationpage', page: () => const NotificationPage()),
    GetPage(name: '/profilesettings', page: () => const Profilesettings()),
    GetPage(name: '/changepassword', page: () => const ChangePassword()),
    GetPage(
        name: '/professionaldetails', page: () => const ProfessionalDetails()),
    GetPage(name: '/personaldetails', page: () => const PersonalDetails()),
    GetPage(name: '/supportscreen', page: () => const SupportScreen()),
    GetPage(
        name: '/appointmenttiming',
        page: () => const AppointmenttimingScreen()),
    GetPage(
        name: '/termsandcondition', page: () => const TermsConditionScreen()),
    GetPage(
        name: '/prescriptionscreen', page: () => const PrescriptionScreen()),
    GetPage(name: '/forgototp', page: () => ForgotOTPScreen()),

    //
  ];
}

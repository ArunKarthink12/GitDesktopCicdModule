// import 'package:doctor_module/const/colors.dart';
// import 'package:doctor_module/const/responsive.dart';
// import 'package:doctor_module/view/reset_password/create_password.dart';
// import 'package:doctor_module/widget/circle_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:pin_code_fields/pin_code_fields.dart';

// class ForgotOtpField extends StatefulWidget {
//   const ForgotOtpField({Key? key}) : super(key: key);

//   @override
//   State<ForgotOtpField> createState() => _ForgotOtpFieldState();
// }

// class _ForgotOtpFieldState extends State<ForgotOtpField> {
//   bool hasError = false;
//   String currentText = "";
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               // height: MediaQuery.of(context).size.height * 0.1,
//               // width: MediaQuery.of(context).size.width * 0.8,
//               child: Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 20),
//                   child: PinCodeTextField(
//                     appContext: context,
//                     textStyle: GoogleFonts.jost(
//                         textStyle: TextStyle(
//                             fontSize: MediaQuery.of(context).size.height * 0.02,
//                             fontWeight: FontWeight.w600)),
//                     pastedTextStyle: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     length: 6,
//                     //obscureText: true,
//                     // obscuringCharacter: '*',
//                     // obscuringWidget: FlutterLogo(
//                     //   size: 24,
//                     // ),
//                     blinkWhenObscuring: true,
//                     animationType: AnimationType.fade,

//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.box,
//                       borderRadius: BorderRadius.circular(5),
//                       fieldHeight: 7.0.hp,
//                       fieldWidth: 13.0.wp,
//                       activeColor: Colors.grey,
//                       selectedFillColor: appcolor,
//                       selectedColor: Colors.white,
//                       inactiveColor: Colors.grey,
//                       inactiveFillColor: Colors.white,
//                       activeFillColor: hasError ? Colors.amber : Colors.black12,
//                     ),
//                     cursorColor: Colors.white,
//                     animationDuration: const Duration(milliseconds: 300),
//                     enableActiveFill: true,
//                     keyboardType: TextInputType.number,

//                     onChanged: (value) {
//                       // ignore: avoid_print
//                       print(value);
//                       setState(() {
//                         currentText = value;
//                       });
//                     },
//                     // onCompleted: (value) {
//                     //   print('success');
//                     // },
//                     onCompleted: (value) {
//                       // forgotOtpController.forgotOtp(value);
//                     },
//                   )),
//             ),
//             SizedBox(
//               height: 1.0.hp,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (context) => const LoginScreen()),
//                     // );
//                   },
//                   child: Text(
//                     'If you didn\'t receive a code!',
//                     style: GoogleFonts.jost(
//                         textStyle: TextStyle(
//                             fontSize: 10.00.sp,
//                             color: const Color(0xff373737),
//                             fontWeight: FontWeight.w500)),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 1.0.wp,
//                 ),
//                 InkWell(
//                   onTap: () {},
//                   child: Text(
//                     'Resend',
//                     style: GoogleFonts.jost(
//                         textStyle: TextStyle(
//                             fontSize: 10.00.sp,
//                             // color: ,
//                             decoration: TextDecoration.underline,
//                             fontWeight: FontWeight.w500)),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 25.00.hp),
//             multiButton(
//                 height: 5.0.hp,
//                 borderRadius: 7.0.sp,
//                 multiwidget: Text("VERIFY",
//                     style: TextStyle(
//                         fontSize: 12.0.sp,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w700)),
//                 width: MediaQuery.of(context).size.width - 30.0.wp,
//                 bgcolor: appcolor,
//                 onTap: () {
//                   // if (formKey.currentState!.validate()) {
//                   // loginscreenController.loginController(context: context);

//                   Get.to(const CreatenewPassword());
//                   // }
//                   // toasterAlert(context: context);
//                 }),
//             // ButtonIconButton(
//             //   press: () async {
//             //     // Get.to(CreatenewPassword());
//             //     if (formKey.currentState!.validate()) {
//             //       if (forgotOtpController.forgotOtp.value.isEmpty) {
//             //         Fluttertoast.showToast(msg: 'Please enter otp');
//             //       } else if (formKey.currentState!.validate()) {
//             //         await forgotOtpController
//             //             .forgotOtpController(
//             //                 email:
//             //                     forgotPasswordController.email.text.toString())
//             //             .then((value) => Get.to(CreatenewPassword(
//             //                 email: forgotPasswordController.email.text
//             //                     .toString())));
//             //       }
//             //     }
//             //   },
//             //   bordercolor: appcolor1,
//             //   text: 'VERIFY',
//             // ),
//             SizedBox(height: 4.00.hp),
//           ],
//         ),
//       ),
//     );
//   }
// }

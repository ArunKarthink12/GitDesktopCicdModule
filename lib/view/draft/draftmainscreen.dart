// import 'package:doctor_module/const/colors.dart';
// import 'package:doctor_module/const/responsive.dart';
// import 'package:doctor_module/const/styleText.dart';
// import 'package:doctor_module/widget/circle_widget.dart';
// // import 'package:doctor_module/const/styleText.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:multi_dropdown/multiselect_dropdown.dart';

// List sortList = [
//   'Seacrh By Visit ID',
//   'Seacrh By Service Name',
//   'Seacrh By Branch',
//   'Seacrh By CustomerName',
//   'Seacrh By Route'
// ];

// class Draftscreen extends StatefulWidget {
//   const Draftscreen({super.key});

//   @override
//   State<Draftscreen> createState() => _DraftscreenState();
// }

// class _DraftscreenState extends State<Draftscreen> {
//   bool selected = false;
//   // List<String> items = ['Banana', 'Apple', 'Orange', 'Grapes'];

//   List<String> list = <String>['One', 'Two', 'Three', 'Four'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: IconButton(
//                 icon: Icon(Icons.sort_by_alpha),
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled:
//                         true, // Ensures the bottom sheet takes up the entire screen height
//                     builder: (BuildContext context) {
//                       return SingleChildScrollView(
//                         physics:
//                             AlwaysScrollableScrollPhysics(), // Allow scrolling even when content is not overflowed
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).viewInsets.bottom),
//                           child: Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: SizedBox(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Sort by",
//                                         style: GoogleFonts.jost(
//                                             fontWeight: FontWeight.w700,
//                                             color: Colors.black),
//                                       ),
//                                       CircleAvatar(
//                                         child: Icon(Icons.close),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 // height: 40.0.hp,
//                                 child: ListView.separated(
//                                   physics: NeverScrollableScrollPhysics(),
//                                   separatorBuilder: (context, index) {
//                                     return SizedBox(
//                                       height: 2.0.hp,
//                                     );
//                                   },
//                                   itemCount: sortList.length,
//                                   shrinkWrap: true,
//                                   itemBuilder: (context, index) {
//                                     return Padding(
//                                       padding: const EdgeInsets.all(12.0),
//                                       child: Container(
//                                         // height: 5.0.hp,
//                                         // color: Colors.amber,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(25.0.sp)),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: const Color.fromARGB(
//                                                     255, 211, 210, 210),
//                                               ),
//                                               BoxShadow(
//                                                 color: const Color.fromARGB(
//                                                     255, 221, 219, 219),
//                                               )
//                                             ]),
//                                         // child: MultiSelectDropDown.network(
//                                         //   onOptionSelected: (options) {
//                                         //     print(options);
//                                         //   },
//                                         //   networkConfig: NetworkConfig(
//                                         //     url:
//                                         //         'https://jsonplaceholder.typicode.com/users',
//                                         //     method: RequestMethod.get,
//                                         //     headers: {
//                                         //       'Content-Type':
//                                         //           'application/json',
//                                         //     },
//                                         //   ),
//                                         //   hint: '${sortList[index]}',
//                                         //   animateSuffixIcon: true,
//                                         //   hintColor: Colors.black,
//                                         //   chipConfig: const ChipConfig(
//                                         //       wrapType: WrapType.scroll),
//                                         //   responseParser: (response) {
//                                         //     final list =
//                                         //         (response as List<dynamic>)
//                                         //             .map((e) {
//                                         //       final item =
//                                         //           e as Map<String, dynamic>;
//                                         //       return ValueItem(
//                                         //         label: item['name'],
//                                         //         value: item['id'].toString(),
//                                         //       );
//                                         //     }).toList();

//                                         //     return Future.value(list);
//                                         //   },
//                                         //   responseErrorBuilder:
//                                         //       ((context, body) {
//                                         //     return const Padding(
//                                         //       padding: EdgeInsets.all(16.0),
//                                         //       child: Text(
//                                         //           'Error fetching the data'),
//                                         //     );
//                                         //   }),
//                                         // ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               multiButton(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   bgcolor: appcolor,
//                                   borderRadius: 25.0.sp,
//                                   height: 5.5.hp,
//                                   multiwidget: Text(
//                                     "APPLY",
//                                     style: GoogleFonts.jost(
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white),
//                                   ),
//                                   width: MediaQuery.of(context).size.width -
//                                       20.0.wp),
//                               SizedBox(
//                                 height: 2.0.hp,
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             )
//           ],
//           centerTitle: true,
//           title: Text("PENDINGS", style: header),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(20.0.sp),
//             child: const SizedBox(
//                 child: Column(
//               children: [
//                 // user profile
//                 // DraftUserdetails(),
//                 //tags
//                 Tagsdetails(),
//                 //topic with filter
//                 TopicfilterDetails(),
//                 // list
//                 DraftistDetailsView()
//               ],
//             )),
//           ),
//         ));
//   }
// }

// class DraftistDetailsView extends StatefulWidget {
//   const DraftistDetailsView({super.key});

//   @override
//   State<DraftistDetailsView> createState() => _DraftistDetailsViewState();
// }

// class _DraftistDetailsViewState extends State<DraftistDetailsView> {
//   List colorsItem = [Colors.red, Colors.green, Colors.orange];
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.separated(
//         separatorBuilder: (context, index) {
//           return SizedBox(height: 2.0.hp);
//         },
//         itemCount: colorsItem.length,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return SizedBox(
//             child: Stack(
//               children: [
//                 Card(
//                   elevation: 2,
//                   color: Colors.white,
//                   child: SizedBox(
//                       height: 24.0.hp,
//                       width: MediaQuery.of(context).size.width,
//                       child: cardDetails(index: index)),
//                 ),
//                 SizedBox(
//                   child: Icon(
//                     Icons.bookmark,
//                     color: colorsItem[index],
//                     size: 25.0.sp,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget cardDetails({index}) {
//     return Padding(
//       padding: EdgeInsets.all(15.0.sp),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           //name age and appointmentdate& visitorsID
//           Container(
//             color: Colors.transparent,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   child: Row(
//                     children: [
//                       SizedBox(
//                           child: CircleAvatar(
//                         backgroundImage: const ExactAssetImage(
//                           "images/doc_1.jpg",
//                         ),
//                         radius: 20.0.sp,
//                       )),
//                       SizedBox(
//                         width: 2.0.wp,
//                       ),
//                       SizedBox(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Patient Name",
//                               style: textstyle3.copyWith(fontSize: 12.0.sp),
//                             ),
//                             Text(
//                               "Male - 21 - yr old",
//                               style: GoogleFonts.jost(
//                                   color:
//                                       const Color.fromARGB(255, 133, 133, 132),
//                                   fontSize: 8.0.sp),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       height: 3.0.hp,
//                       width: 20.0.wp,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(25.0.sp),
//                           ),
//                           color: const Color.fromARGB(255, 203, 225, 244)),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         "Today",
//                         style: TextStyle(color: appcolor),
//                       ),
//                     ),
//                     Text(
//                       "Visite Id: B1323",
//                       style: GoogleFonts.jost(
//                           color: Color.fromARGB(255, 0, 0, 0),
//                           fontSize: 8.0.sp),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 2.0.hp,
//           ),
//           //time date
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             //mainrow
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
// //calender and date
//                 Container(
//                   child: Row(
//                     children: [
//                       Icon(Icons.calendar_month),
//                       Text(
//                         "25 Mar, 2023",
//                         style: GoogleFonts.jost(
//                             color: const Color.fromARGB(255, 133, 133, 132),
//                             fontSize: 10.0.sp),
//                       )
//                     ],
//                   ),
//                 ),
// //time and duration
//                 Container(
//                   child: Row(
//                     children: [
//                       Icon(Icons.timelapse_rounded),
//                       Text(
//                         "10:00 am - 10:30 am",
//                         style: GoogleFonts.jost(
//                             color: const Color.fromARGB(255, 133, 133, 132),
//                             fontSize: 10.0.sp),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 1.5.hp,
//           ),
//           //view Details
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               multiButton(
//                   onTap: () {
//                     Get.toNamed("/viewdetailspage");
//                   },
//                   bgcolor: appcolor,
//                   borderRadius: 6.0.sp,
//                   height: 4.0.hp,
//                   multiwidget: Text(
//                     "VIEW DETAILS",
//                     style: GoogleFonts.jost(
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                         fontSize: 10.0.sp),
//                   ),
//                   width: 35.0.wp),
//               // multiButton(
//               //     onTap: () {
//               //       Get.toNamed("/prescriptionscreen");
//               //     },
//               //     bgcolor: Colors.white,
//               //     borderRadius: 6.0.sp,
//               //     height: 4.0.hp,
//               //     multiwidget: Text(
//               //       "PRESCRIPTION",
//               //       style: GoogleFonts.jost(
//               //           fontWeight: FontWeight.w700,
//               //           color: appcolor,
//               //           fontSize: 10.0.sp),
//               //     ),
//               //     width: 35.0.wp),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DraftUserdetails extends StatefulWidget {
//   const DraftUserdetails({super.key});

//   @override
//   State<DraftUserdetails> createState() => _DraftUserdetailsState();
// }

// class _DraftUserdetailsState extends State<DraftUserdetails> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           GestureDetector(
//             onTap: () {
//               // Get.toNamed("/draft");
//             },
//             child: SizedBox(
//               height: 3.5.hp,
//               width: 7.0.wp,
//               child: Image.asset("images/filter.png", fit: BoxFit.cover),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Tagsdetails extends StatefulWidget {
//   const Tagsdetails({super.key});

//   @override
//   State<Tagsdetails> createState() => _TagsdetailsState();
// }

// class _TagsdetailsState extends State<Tagsdetails> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//               width: 50.0.wp,
//               color: Colors.transparent,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   newWidget(tagscolor: Colors.red, title: "Stat"),
//                   newWidget(tagscolor: Colors.orange, title: "Critical"),
//                   newWidget(tagscolor: Colors.yellow, title: "Abnormal"),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }

//   Widget newWidget({tagscolor, title}) {
//     return SizedBox(
//       child: Row(
//         children: [
//           Container(
//               height: 2.0.hp,
//               width: 2.0.wp,
//               decoration:
//                   BoxDecoration(color: tagscolor, shape: BoxShape.circle)),
//           //
//           Text(title),
//         ],
//       ),
//     );
//   }
// }

// class TopicfilterDetails extends StatefulWidget {
//   const TopicfilterDetails({super.key});

//   @override
//   State<TopicfilterDetails> createState() => _TopicfilterDetailsState();
// }

// class _TopicfilterDetailsState extends State<TopicfilterDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Row(
//         children: [
//           //calender
//           calenderProperties(),
//           //filter
//           filterProperties()
//         ],
//       ),
//     );
//   }

//   Widget calenderProperties() {
//     return Container();
//   }

//   Widget filterProperties() {
//     return Container();
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mcb_parent_app/controllers/feedback_controller.dart';
import 'package:mcb_parent_app/models/about_school_model.dart';
import 'package:mcb_parent_app/models/feedback_dropdown_model.dart';
import 'package:mcb_parent_app/models/feedback_questions_model.dart';
import 'package:mcb_parent_app/models/teacher_cht_model.dart';
import 'package:mcb_parent_app/service/repository.dart';
import 'package:mcb_parent_app/utils/constants.dart';
import 'package:mcb_parent_app/utils/session_manager.dart';
import 'package:mcb_parent_app/views/announcement_views/detailed_announcement_view.dart';
import 'package:mcb_parent_app/views/attendance_view.dart';
import 'package:mcb_parent_app/views/chat_views/chat_profiles_view.dart';
import 'package:mcb_parent_app/views/fee_payment_views/fee_payment_view.dart';
import 'package:mcb_parent_app/views/feedback_survey_views/feedback_survey_view.dart';
import 'package:mcb_parent_app/views/leave_request_views/leave_request_view.dart';
import 'package:mcb_parent_app/views/lunch_views/student_lunch_menu_view.dart';
import 'package:mcb_parent_app/views/parent_concerns/parent_concern_view.dart';
import 'package:mcb_parent_app/views/school_library_view.dart';
import 'package:mcb_parent_app/views/school_store_view/school_store_view.dart';
import 'package:mcb_parent_app/views/web_view.dart';
import 'package:mcb_parent_app/widgets/gradient_text_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controllers/authController.dart';
import '../../controllers/dashboard_controller.dart';
import '../../models/announcements_model.dart';
import '../../utils/logger.dart';
import '../../utils/page_navigation.dart';
import '../announcement_views/announcements_view.dart';
import '../classdairy_views/class_diary_view.dart';
import '../gallery_views/gallery_view.dart';
import '../school_calender_view.dart';
import '../school_transport_views/school_transport_view.dart';
import '../whats_new_view/whats_new_view.dart';

class SchoolView extends StatefulWidget {
  const SchoolView({super.key});

  @override
  State<SchoolView> createState() => _SchoolViewState();
}

class _SchoolViewState extends State<SchoolView> {
  List typeList=['Add to Calendar'];

  // final value =  NumberFormat('#,##,000');
  MenuController controller=MenuController ();
  List colors = [Colors.red, Colors.green, Colors.deepOrangeAccent];
  List colors1 = [Colors.deepOrangeAccent, Colors.blue, Colors.orange];
  final dashCtrl = Get.find<DashBoardController>();
  final authCtrl = Get.find<AuthController>();
  List <TeachersChatListModel> chtdata=[];
  final feedbackCtrl=Get.put(FeedBackController());
  // final Calendar calendar=Calendar();
  DeviceCalendarPlugin deviceCalendarPlugin=DeviceCalendarPlugin();

  @override
  void initState(){
    super.initState();


  }

  void getBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        context: context,
        isDismissible:false,
        enableDrag:false,
        isScrollControlled: true,
        builder: (context) => Container(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              color: Colors.white,
            ),
            height: context.height/1.3,
            child: Container(
                decoration:  BoxDecoration(
                    color: Colors.grey
                ),
                child: SafeArea(child:Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar:  AppBar(
                    actions: [
                      IconButton(onPressed: (){
                        Navigator.pop(context, true);
                      }, icon: Icon(Icons.cancel,color: Colors.grey,))
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                  ),
                  body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          // width: Get.width,
                          height: Get.height / 8,
                          fit: BoxFit.fill,
                          imageUrl: SessionManager.getString(
                              Constants.pref_Branchlogo),
                          placeholder: (context, url) =>
                          const Center(
                              child:
                              CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              CachedNetworkImage(
                                // width: Get.width,
                                height: Get.height / 8,
                                fit: BoxFit.fill,
                                imageUrl: SessionManager.getString(
                                    Constants.pref_schoolLogoUrl),
                                placeholder: (context, url) =>
                                const Center(
                                    child:
                                    CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        '${Constants.ImagePath}noschoolimg.png',
                                        // width: Get.width,
                                        // height: 58,
                                        // fit: BoxFit.fill,
                                      ),
                                    ),
                              ),
                        ),
                        Text(textScaleFactor: 1,
                            dashCtrl
                                .sibilmodel.organisationName
                                .toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20),
                          child: Text(textScaleFactor: 1,
                            dashCtrl.sibilmodel.branchAddress
                                .toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                (dashCtrl.aboutschl[0].aboutUs)!=null&&Bidi.stripHtmlIfNeeded(dashCtrl.aboutschl[0].aboutUs.toString())!=""&&Bidi.stripHtmlIfNeeded(dashCtrl.aboutschl[0].aboutUs.toString())!="null"?
                                HtmlWidget(
                                  dashCtrl.aboutschl[0].aboutUs.toString().contains('%')?
                                  Uri.decodeFull(dashCtrl.aboutschl[0].aboutUs.toString()):
                                  dashCtrl.aboutschl[0].aboutUs.toString(),
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                  // style: {
                                  //   "body": Style(
                                  //       fontSize: FontSize(14),
                                  //       color: Colors.black,
                                  //       fontWeight: FontWeight.w300,
                                  //       textAlign: TextAlign.justify
                                  //   ),
                                  // },
                                ):Center(),
                                dashCtrl.aboutschl[0].bannerImage!=null&& dashCtrl.aboutschl[0].bannerImage!=''? CachedNetworkImage(
                                  // width: Get.width,
                                  // height: Get.height / 5,
                                  fit: BoxFit.fill,
                                  imageUrl: dashCtrl.aboutschl[0].bannerImage.toString(),
                                  placeholder: (context, url) =>
                                  const Center(
                                      child:
                                      CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          '${Constants.ImagePath}noimage.jpg',
                                          // width: Get.width,
                                          // height: 58,
                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                ):Center(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),))
        ));
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: (Colors.grey.withOpacity(0.09)),
              offset: const Offset(0.0, 1.5),
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ], color: Colors.white),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 50,right: 50),
                    child: CachedNetworkImage(
                      // width: Get.width,
                      height: Get.height / 9,
                      fit: BoxFit.fill,
                      imageUrl: SessionManager.getString(
                          Constants.pref_Branchlogo),
                      placeholder: (context, url) =>
                      const Center(
                          child:
                          CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              color: Colors.white,
                              child: Image.asset(
                                '${Constants.ImagePath}logo.png',
                                height: Get.height / 7,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    alignment: Alignment.center,
                    child: Text(
                      textScaleFactor: 1,
                      SessionManager.getString(Constants.pref_BranchName),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),textAlign: TextAlign.center,),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20),
                    child: Text(textScaleFactor: 1,
                      dashCtrl.sibilmodel.branchAddress
                          .toString().trimRight(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // dashCtrl.aboutschl.length>0?  (dashCtrl.aboutschl[0].googleMapURL!=null&&dashCtrl.aboutschl[0].googleMapURL!='')||(dashCtrl.aboutschl[0].latitude!=null&&dashCtrl.aboutschl[0].latitude!=''&&
                  //     dashCtrl.aboutschl[0].longitude!=null&&dashCtrl.aboutschl[0].longitude!='')?
                  // InkWell(
                  //   onTap: () {
                  //      if(dashCtrl.aboutschl[0].latitude!=null&&dashCtrl.aboutschl[0].latitude!=''&&
                  //         dashCtrl.aboutschl[0].longitude!=null&&dashCtrl.aboutschl[0].longitude!=''){
                  //       Constants.launchurl(Constants.google_map_Url+'${dashCtrl.aboutschl[0].latitude},${dashCtrl.aboutschl[0].longitude}');
                  //     }else if( dashCtrl.aboutschl[0].googleMapURL!=null&&dashCtrl.aboutschl[0].googleMapURL!=''){
                  //        Constants.launchurl(dashCtrl.aboutschl[0].googleMapURL.toString());
                  //      }
                  //   },
                  //   child: Image.asset(Constants.IconPath+'locateus.png',fit: BoxFit.fill,width: context.isTablet?150:Get.width/4,),
                  // ):Center():Center(),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const Divider(
                  //   thickness: 2,
                  //   height: 0,
                  // ),
                  // SizedBox(
                  //   height: 50,
                  //   child: Row(
                  //     children: [
                  //       dashCtrl.aboutschl.length>0? dashCtrl.aboutschl[0].aboutUs!=null&&dashCtrl.aboutschl[0].aboutUs!=''?   Expanded(
                  //         child: InkWell(
                  //           onTap: () async {
                  //             if(dashCtrl.aboutschl.length>0){
                  //               getBottomSheet(context);}else{
                  //               Logger.showSnackBartrans(title: 'Alert', msg: Constants.No_Data);
                  //             }
                  //           },
                  //           child: Container(
                  //             alignment: Alignment.center,
                  //             child:
                  //             GradientText(
                  //               'About School',
                  //               style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                  //               gradient: LinearGradient(
                  //                   begin: Alignment.centerRight,
                  //                   end:  Alignment.centerLeft,
                  //                   colors: Constants.appThemegradient),
                  //             ),
                  //
                  //           ),
                  //         ),
                  //       ):Center():Center(),
                  //       dashCtrl.aboutschl.length>0? dashCtrl.aboutschl[0].aboutUs!=null&&dashCtrl.aboutschl[0].aboutUs!=''?   const VerticalDivider(
                  //         thickness: 2,
                  //       ):Center():Center(),
                  //      dashCtrl.isschoolpolicies.value? Expanded(
                  //         child: InkWell(
                  //           onTap: (){
                  //             Repository().getSchoolPolicies(dashCtrl.sibilmodel.studentEnrollmentId, dashCtrl.sibilmodel.academicYearID);
                  //           },
                  //           child: Container(
                  //             alignment: Alignment.center,
                  //             child:
                  //             GradientText(
                  //               'School Policies',
                  //               style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                  //               gradient: LinearGradient(
                  //                   begin: Alignment.centerRight,
                  //                   end:  Alignment.centerLeft,
                  //                   colors: Constants.appThemegradient),
                  //             ),
                  //           ),
                  //         ),
                  //       ):Center(),
                  //       dashCtrl.isschoolpolicies.value? const VerticalDivider(
                  //         thickness: 2,
                  //       ):Center(),
                  //       Expanded(
                  //         child: InkWell(
                  //           onTap: (){
                  //             Repository().getSchoolAchievements(dashCtrl.sibilmodel.organisationID, dashCtrl.sibilmodel.branchID, dashCtrl.sibilmodel.academicYearID);
                  //           },
                  //           child: Container(
                  //             alignment: Alignment.center,
                  //             child:
                  //             GradientText(
                  //               'Achievements',
                  //               style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                  //               gradient: LinearGradient(
                  //                   begin: Alignment.centerRight,
                  //                   end:  Alignment.centerLeft,
                  //                   colors: Constants.appThemegradient),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
              Positioned(
                top: 5,
                right: 5,
                child: dashCtrl.aboutschl.isNotEmpty?  (dashCtrl.aboutschl[0].googleMapURL!=null&&dashCtrl.aboutschl[0].googleMapURL!='')||(dashCtrl.aboutschl[0].latitude!=null&&dashCtrl.aboutschl[0].latitude!=''&&
                    dashCtrl.aboutschl[0].longitude!=null&&dashCtrl.aboutschl[0].longitude!='')?
                InkWell(
                  onTap: () {
                    dashCtrl.themeBack();
                    if(dashCtrl.aboutschl[0].latitude!=null&&dashCtrl.aboutschl[0].latitude!=''&&
                        dashCtrl.aboutschl[0].longitude!=null&&dashCtrl.aboutschl[0].longitude!=''){
                      Constants.launchurl(Constants.google_map_Url+'${dashCtrl.aboutschl[0].latitude},${dashCtrl.aboutschl[0].longitude}');
                    }else if( dashCtrl.aboutschl[0].googleMapURL!=null&&dashCtrl.aboutschl[0].googleMapURL!=''){
                      Constants.launchurl(dashCtrl.aboutschl[0].googleMapURL.toString());
                    }
                  },
                  child: Image.asset(Constants.IconPath+'locationpingif.gif',
                    fit: BoxFit.fill,
                    height: 40,
                    width: 40,
                    // width: context.isTablet?150:Get.width/4,
                  ),
                ):Center():Center(),)
            ],
          ),
        ),
        SizedBox(height: 10,),
        // Container(
        //   padding: dashCtrl.isTransport.value|| dashCtrl.isLunch.value?const EdgeInsets.only(left: 10):EdgeInsets.all(20),
        //   decoration: BoxDecoration(boxShadow: [
        //     BoxShadow(
        //       color: (Colors.grey.withOpacity(0.09)),
        //       offset: const Offset(0.0, 1.5),
        //       blurRadius: 2,
        //       spreadRadius: 2,
        //     ),
        //   ], color: Colors.white),
        //   child: Row(
        //     children: [
        //       Expanded(
        //           flex: 6,
        //           child: Column(
        //             children: [
        //               Container(
        //                 alignment: Alignment.centerLeft,
        //                 child: const Text(textScaleFactor: 1,
        //                   'Student Status ⚡',
        //                   style: TextStyle(
        //                       fontSize: 14, fontWeight: FontWeight.w400),
        //                   textAlign: TextAlign.start,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               Row(
        //                 children: [
        //                   Image.asset(
        //                     '${Constants.IconPath}schoolbag.png',
        //                     height: 40,
        //                     fit: BoxFit.fill,
        //                   ),
        //                   Expanded(
        //                     child: Column(
        //                       children: [
        //                         Container(
        //                           alignment: Alignment.centerLeft,
        //                           child: Text(textScaleFactor: 1,
        //                             dashCtrl.punchTimingsList.isNotEmpty? '${dashCtrl.punchTimingsList[0].timing??'--'} - ${dashCtrl.punchTimingsList[0].type??'--'}':'No Data Available',
        //                             style: const TextStyle(
        //                                 fontSize: 12,
        //                                 fontWeight: FontWeight.w500),
        //                             textAlign: TextAlign.start,
        //                             overflow: TextOverflow.ellipsis,
        //                           ),
        //                         ),
        //                         const SizedBox(
        //                           height: 5,
        //                         ),
        //                         if(dashCtrl.punchTimingsList.isNotEmpty)
        //                           if(dashCtrl.punchTimingsList[0].type.toString().toUpperCase()=='PRESENT')
        //                             dashCtrl.punchTimingsList.isNotEmpty? dashCtrl.punchTimingsList[0].checkInTime!=''&&dashCtrl.punchTimingsList[0].checkInTime.toString()!='null'? Container(
        //                               alignment: Alignment.centerLeft,
        //                               child: Text(textScaleFactor: 1,
        //                                 dashCtrl.punchTimingsList[0].timing.toString().toLowerCase()=='morning'?'Clock In: ${dashCtrl.punchTimingsList[0].checkInTime}':dashCtrl.punchTimingsList[0].timing.toString().toLowerCase()=='afternoon'?'Clock Out: ${dashCtrl.punchTimingsList[0].checkInTime}':'Clock In: ${dashCtrl.punchTimingsList[0].checkInTime}',
        //                                 style: const TextStyle(
        //                                     fontSize: 12,
        //                                     fontWeight: FontWeight.w500),
        //                                 textAlign: TextAlign.start,
        //                                 overflow: TextOverflow.ellipsis,
        //                               ),
        //                             ):const Center():const Center(),
        //                         SizedBox(height: 5,),
        //
        //                         if(dashCtrl.punchTimingsList.length>1)
        //                           Container(
        //                             alignment: Alignment.centerLeft,
        //                             child: Text(textScaleFactor: 1,
        //                               '${dashCtrl.punchTimingsList[1].timing??'--'} - ${dashCtrl.punchTimingsList[1].type??'--'}',
        //                               style: const TextStyle(
        //                                   fontSize: 12,
        //                                   fontWeight: FontWeight.w500),
        //                               textAlign: TextAlign.start,
        //                               overflow: TextOverflow.ellipsis,
        //                             ),
        //                           ),
        //                         const SizedBox(
        //                           height: 5,
        //                         ),
        //                         if(dashCtrl.punchTimingsList.length>1)
        //                           if(dashCtrl.punchTimingsList[1].type.toString().toUpperCase()=='PRESENT')
        //                             dashCtrl.punchTimingsList[1].checkOutTime!=''&&dashCtrl.punchTimingsList[1].checkOutTime.toString()!='null'?  Container(
        //                               alignment: Alignment.centerLeft,
        //                               child: Text(textScaleFactor: 1,
        //                                 dashCtrl.punchTimingsList[1].timing.toString().toLowerCase()=='morning'?'Clock In: ${dashCtrl.punchTimingsList[1].checkInTime}':dashCtrl.punchTimingsList[1].timing.toString().toLowerCase()=='afternoon'?'Clock Out: ${dashCtrl.punchTimingsList[1].checkInTime}':'Clock Out: ${dashCtrl.punchTimingsList[1].checkInTime}',
        //                                 style: const TextStyle(
        //                                     fontSize: 12,
        //                                     fontWeight: FontWeight.w500),
        //                                 textAlign: TextAlign.start,
        //                                 overflow: TextOverflow.ellipsis,
        //                               ),
        //                             ):const Center(),
        //
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               )
        //             ],
        //           )),
        //       dashCtrl.isTransport.value|| dashCtrl.isLunch.value? Container(
        //         height: 130,
        //         child: const VerticalDivider(
        //           width: 1,
        //           thickness: 1,
        //         ),
        //       ):Center(),
        //       // Expanded(
        //       //     child: Column(
        //       //       children: [
        //       //         CachedNetworkImage(
        //       //           imageUrl: dashCtrl.studenttimeMdl.iconPath.toString(),
        //       //           // width: 50,
        //       //           fit: BoxFit.fill,
        //       //           placeholder: (context, url) => const Center(
        //       //               child: CircularProgressIndicator(
        //       //                 color: Colors.orange,
        //       //               )),
        //       //           errorWidget: (context, url, error) => Align(
        //       //             alignment: Alignment.center,
        //       //             child: Image.asset(
        //       //               '${Constants.IconPath}mathseducation.gif',
        //       //               width: 80,
        //       //               fit: BoxFit.fill,
        //       //             ),
        //       //           ),
        //       //         ),
        //       //         Container(
        //       //           alignment: Alignment.center,
        //       //           child: Text(textScaleFactor: 1,
        //       //             dashCtrl.studenttimeMdl.subjectName??'--',
        //       //             style: const TextStyle(
        //       //                 fontSize: 12, fontWeight: FontWeight.w300),
        //       //             textAlign: TextAlign.center,
        //       //             overflow: TextOverflow.ellipsis,
        //       //           ),
        //       //         ),
        //       //         const SizedBox(
        //       //           height: 5,
        //       //         ),
        //       //         Container(
        //       //           alignment: Alignment.center,
        //       //           child: Text(textScaleFactor: 1,
        //       //             // 'Updated @ '+dashCtrl.studenttimeMdl.,
        //       //             dashCtrl.studenttimeMdl.duration
        //       //                 ??'--',
        //       //             style: const TextStyle(
        //       //                 fontSize: 12,
        //       //                 fontWeight: FontWeight.w300),
        //       //             textAlign: TextAlign.center,
        //       //             overflow: TextOverflow.fade,
        //       //           ),
        //       //         ),
        //       //       ],
        //       //     )),
        //       Expanded(
        //           flex: 4,
        //           child: Column(children: [
        //             dashCtrl.isTransport.value?
        //             dashCtrl.schoolTransportList[Constants.api_getPrivateTransportData].isEmpty&&dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp].isNotEmpty?(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL']!=''&&dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL'].toString()!='null')?Padding(
        //               padding: const EdgeInsets.all(5),
        //               child: Container(
        //                 decoration: BoxDecoration(
        //                   color: Constants.hexToColor('#fafafa'),
        //                   border: Border.all(color: Colors.black26),
        //                   borderRadius: BorderRadius.circular(5),
        //                 ),
        //                 child: Row(
        //                   children: [
        //                     Expanded(
        //                         child:   MenuAnchor(
        //                           controller: controller,
        //                           builder: (BuildContext context, MenuController controller1, Widget? child) {
        //                             return InkWell(
        //                               onTap: () async {
        //                                 dashCtrl.themeBack();
        //                                 // transportdata=await Repository().getSchoolTransportTrackDetails(dashCtrl.sibilmodel.studentEnrollmentId, dashCtrl.sibilmodel.classID);
        //                                 if(dashCtrl.schoolTransportList[Constants.api_getPrivateTransportData].isEmpty&&dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp].isNotEmpty){
        //                                   if(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp].length>1){
        //                                     if (controller.isOpen) {
        //                                       controller.close();
        //                                     }else{
        //                                       controller.open();
        //                                     }
        //                                   }else if(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp].length>0){
        //                                     if(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL']!=null&&dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL'].toString()!=''){
        //                                       Constants.launchurl(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL'].toString());
        //                                       // Constants.appBarInstantGradient1=Constants.darkyellowColor;
        //                                       // Constants.appBarInstantGradient2=Constants.lightyellowColor ;
        //                                       // Constants.appBarwebViewColor=Colors.black ;
        //                                       // Get.toNamed(WebView.routeName,arguments: {'url':dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL'].toString(),'title':'Bus Tracking'});
        //                                     }else{
        //                                       Logger.showSnackBartrans(title: 'Alert', msg: 'Tracking Not Available');
        //                                     }
        //                                   }else{
        //                                     Logger.showSnackBartrans(title: 'Alert', msg: 'Tracking Not Available');
        //                                   }
        //                                 }else{
        //                                   Logger.showSnackBartrans(title: 'Alert', msg: 'Tracking Not Available');
        //                                 }
        //                               },
        //                               child: Padding(
        //                                 padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
        //                                 child: Row(
        //                                   children: [
        //                                     Image.asset(Constants.IconPath+'school-bus1.png',height: 30,),
        //                                     SizedBox(width: 5,),
        //                                     Expanded(
        //                                       child: Column(children: [
        //                                         Container(
        //                                           alignment: Alignment.centerLeft,
        //                                           child: Text(
        //                                             'Availing',
        //                                             textScaleFactor: 1,
        //                                             style: TextStyle(
        //                                                 fontSize: 12,
        //                                                 color: Colors.black38
        //                                             ),
        //                                             textAlign: TextAlign.start,
        //                                           ),
        //                                         ),
        //                                         SizedBox(height: 5,),
        //                                         Container(
        //                                           alignment: Alignment.centerLeft,
        //                                           child: Text(
        //                                               '''Transport''',
        //                                               textScaleFactor: 1,
        //                                               style: TextStyle(
        //                                                 fontSize: 14,
        //                                               ),
        //                                               textAlign: TextAlign.start
        //                                           ),
        //                                         ),
        //                                         SizedBox(height: 5,),
        //                                         Container(
        //                                           alignment: Alignment.centerLeft,
        //                                           child: Text(
        //                                               '''Track >>''',
        //                                               textScaleFactor: 1,
        //                                               style: TextStyle(
        //                                                   fontSize: 14,
        //                                                   color: Colors.green,
        //                                                   decoration: TextDecoration.underline
        //                                               ),
        //                                               textAlign: TextAlign.start
        //                                           ),
        //                                         ),
        //                                       ],),
        //                                     ),
        //                                   ],
        //                                 ),
        //                               ),
        //                             );
        //                           },
        //                           menuChildren: List<Column>.generate(1, (int index) {
        //                             return Column(children: [
        //                               InkWell(
        //                                 onTap: (){
        //                                   dashCtrl.themeBack();
        //                                   // closemcontroller();
        //                                   if (controller.isOpen) {
        //                                     controller.close();
        //                                   }else{
        //                                     controller.open();
        //                                   }
        //                                   FocusScopeNode currentFocus = FocusScope.of(context);
        //                                   if (!currentFocus.hasPrimaryFocus) {
        //                                     currentFocus.unfocus();
        //                                   }
        //                                   if(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL']!=null&&dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL'].toString()!=''){
        //                                     Constants.appBarInstantGradient1=Constants.darkyellowColor;
        //                                     Constants.appBarInstantGradient2=Constants.lightyellowColor ;
        //                                     Constants.appBarwebViewColor=Colors.black ;
        //                                     Get.toNamed(WebView.routeName,arguments: {'url':dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][0]['trackURL'].toString(),'title':'Bus Tracking'});
        //                                   }else{
        //                                     Logger.showSnackBartrans(title: 'Alert', msg: 'Tracking Not Available');
        //                                   }
        //                                   setState(() {
        //                                   });
        //                                 },
        //                                 child: Container(
        //                                   padding: const EdgeInsets.only(left: 10,right: 10),
        //                                   child: Row(
        //                                     children: [
        //                                       const Text(textScaleFactor: 1,'Pick-Up  ',
        //                                         style: TextStyle(
        //                                           color: Colors.black,
        //                                           fontSize: 14,
        //                                           fontWeight: FontWeight.w400,
        //                                         ),),
        //                                       Icon(Icons.arrow_forward_ios_outlined,size: 10,),
        //                                       Icon(Icons.arrow_forward_ios_outlined,size: 10,),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                               Divider(),
        //                               InkWell(
        //                                 onTap: (){
        //                                   dashCtrl.themeBack();
        //                                   if (controller.isOpen) {
        //                                     controller.close();
        //                                   }else{
        //                                     controller.open();
        //                                   }
        //                                   FocusScopeNode currentFocus = FocusScope.of(context);
        //                                   if (!currentFocus.hasPrimaryFocus) {
        //                                     currentFocus.unfocus();
        //                                   }
        //                                   if(dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][1]['trackURL']!=null&&dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][1]['trackURL'].toString()!=''){
        //                                     Constants.appBarInstantGradient1=Constants.darkyellowColor;
        //                                     Constants.appBarInstantGradient2=Constants.lightyellowColor ;
        //                                     Constants.appBarwebViewColor=Colors.black ;
        //                                     Get.toNamed(WebView.routeName,arguments: {'url':dashCtrl.schoolTransportList[Constants.api_getStudentTransportInfoApp][1]['trackURL'].toString(),'title':'Bus Tracking'});
        //                                   }else{
        //                                     Logger.showSnackBartrans(title: 'Alert', msg: 'Tracking Not Available');
        //                                   }
        //                                   setState(() {
        //                                   });
        //
        //                                 },
        //                                 child: Container(
        //                                   padding: const EdgeInsets.only(left: 10,right: 10),
        //                                   child: Row(
        //                                     children: [
        //                                       const Text(textScaleFactor: 1,'Drop-off  ',
        //                                         style: TextStyle(
        //                                           fontSize: 14,
        //                                           color: Colors.black,
        //                                           fontWeight: FontWeight.w400,
        //                                         ),),
        //                                       Icon(Icons.arrow_forward_ios_outlined,size: 10,),
        //                                       Icon(Icons.arrow_forward_ios_outlined,size: 10,),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],);}
        //
        //                           ),
        //                         )
        //                     ),
        //
        //                     dashCtrl.isfeedbackforms.value? InkWell(
        //                       onTap: ()async{
        //                         dashCtrl.themeBack();
        //                         feedbackCtrl.saveFeedback=[];
        //                         feedbackCtrl.rating=[];
        //                         feedbackCtrl.currentPage=0;
        //                         var FeedBackDropDownbyType=await Repository().getFeedBackDropDownbyType(dashCtrl.sibilmodel.studentEnrollmentId,dashCtrl.sibilmodel.studentEnrollmentId,1);
        //                         feedbackCtrl.feebackdropDownMdl=[];
        //                         feedbackCtrl.feebackdropDownMdl.addAll(FeedBackDropDownbyType.map<FeedBackDropDownModel>((e)=>FeedBackDropDownModel.fromJson(e)));
        //                         var questions=await Repository().getFeedBackQuestions(dashCtrl.sibilmodel.studentEnrollmentId,1);
        //                         feedbackCtrl.feebackquestionsMdl=[];
        //                         feedbackCtrl.feebackquestionsMdl.addAll(questions.map<FeedBackQuestionsModel>((e)=>FeedBackQuestionsModel.fromJson(e)));
        //                         feedbackCtrl.rating = List<double>.filled(feedbackCtrl.feebackquestionsMdl.length, 1);
        //                         if(feedbackCtrl.feebackquestionsMdl.isNotEmpty){
        //                           feedbackCtrl.feedbackQuestionSheet(feedbackCtrl.feebackdropDownMdl[0].name.toString(),feedbackCtrl.feebackdropDownMdl[0],context);
        //                         }else{
        //                           Logger.showSnackBartrans(title: 'Alert', msg: 'No Data Found');
        //                         }
        //                       },
        //                       child: Padding(
        //                         padding: const EdgeInsets.only(right: 5),
        //                         child: Image.asset(Constants.IconPath+'feedbackunselected.png',height: 25,),
        //                       ),
        //                     ):Center()
        //                   ],
        //                 ),
        //               ),
        //             ):
        //             Padding(
        //               padding: const EdgeInsets.all(5),
        //               child: Container(
        //                 decoration: dashCtrl.isLunch.value?BoxDecoration(
        //                   color: Constants.hexToColor('#fafafa'),
        //                   border: Border.all(color: Colors.black26),
        //                   borderRadius: BorderRadius.circular(5),
        //                 ):BoxDecoration(),
        //                 child: Row(
        //                   children: [
        //                     Expanded(
        //                         child:   InkWell(
        //                           onTap: () async {
        //                             dashCtrl.themeBack();
        //                             Constants.menuTitle='Transport';
        //                             Get.toNamed(SchoolTransportView.routeName);
        //                             //Repository().getSchoolTransportDetails(dashCtrl.sibilmodel.studentEnrollmentId, dashCtrl.sibilmodel.classID);
        //                           },
        //                           child: Padding(
        //                             padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
        //                             child: Row(
        //                               children: [
        //                                 Image.asset(Constants.IconPath+'school-bus1.png',height: 30,),
        //                                 SizedBox(width: 5,),
        //                                 Expanded(
        //                                   child: Column(children: [
        //                                     Container(
        //                                       alignment: Alignment.centerLeft,
        //                                       child: Text(
        //                                         'Availing',
        //                                         textScaleFactor: 1,
        //                                         style: TextStyle(
        //                                             fontSize: 12,
        //                                             color: Colors.black38
        //                                         ),
        //                                         textAlign: TextAlign.start,
        //                                       ),
        //                                     ),
        //                                     SizedBox(height: 5,),
        //                                     Container(
        //                                       alignment: Alignment.centerLeft,
        //                                       child: Text(
        //                                           '''Transport''',
        //                                           textScaleFactor: 1,
        //                                           style: TextStyle(
        //                                             fontSize: 14,
        //                                           ),
        //                                           textAlign: TextAlign.start
        //                                       ),
        //                                     ),
        //                                     SizedBox(height: 5,),
        //                                   ],),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         )
        //
        //                     ),
        //                     dashCtrl.isfeedbackforms.value?  InkWell(
        //                       // style: ButtonStyle(
        //                       //   padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        //                       //   elevation: MaterialStateProperty.all(0),
        //                       //   backgroundColor: MaterialStateProperty.all(Colors.transparent)
        //                       // ),
        //                       onTap: ()async{
        //                         dashCtrl.themeBack();
        //                         feedbackCtrl.saveFeedback=[];
        //                         feedbackCtrl.rating=[];
        //                         feedbackCtrl.currentPage=0;
        //                         var FeedBackDropDownbyType=await Repository().getFeedBackDropDownbyType(dashCtrl.sibilmodel.studentEnrollmentId,dashCtrl.sibilmodel.studentEnrollmentId,1);
        //                         feedbackCtrl.feebackdropDownMdl=[];
        //                         feedbackCtrl.feebackdropDownMdl.addAll(FeedBackDropDownbyType.map<FeedBackDropDownModel>((e)=>FeedBackDropDownModel.fromJson(e)));
        //                         var questions=await Repository().getFeedBackQuestions(dashCtrl.sibilmodel.studentEnrollmentId,1);
        //                         feedbackCtrl.feebackquestionsMdl=[];
        //                         feedbackCtrl.feebackquestionsMdl.addAll(questions.map<FeedBackQuestionsModel>((e)=>FeedBackQuestionsModel.fromJson(e)));
        //                         feedbackCtrl.rating = List<double>.filled(feedbackCtrl.feebackquestionsMdl.length, 1);
        //                         if(feedbackCtrl.feebackquestionsMdl.isNotEmpty){
        //                           feedbackCtrl.feedbackQuestionSheet(feedbackCtrl.feebackdropDownMdl[0].name.toString(),feedbackCtrl.feebackdropDownMdl[0],context);
        //                         }else{
        //                           Logger.showSnackBartrans(title: 'Alert', msg: 'No Data Found');
        //                         }
        //                       },
        //                       child: Padding(
        //                         padding: const EdgeInsets.only(right: 5),
        //                         child: Image.asset(Constants.IconPath+'feedbackunselected.png',height: 25,),
        //                       ),
        //                     ):Center()
        //                   ],
        //                 ),
        //               ),
        //             ):Padding(
        //               padding: const EdgeInsets.all(5),
        //               child: Container(
        //                 decoration: dashCtrl.isLunch.value?BoxDecoration(
        //                   color: Constants.hexToColor('#fafafa'),
        //                   border: Border.all(color: Colors.black26),
        //                   borderRadius: BorderRadius.circular(5),
        //                 ):BoxDecoration(),
        //                 child: Row(
        //                   children: [
        //                     Expanded(
        //                         child:   InkWell(
        //                           onTap: () async {
        //                             dashCtrl.themeBack();
        //                             Constants.menuTitle='Transport';
        //                             Get.toNamed(SchoolTransportView.routeName);
        //                             // Repository().getSchoolTransportDetails(dashCtrl.sibilmodel.studentEnrollmentId, dashCtrl.sibilmodel.classID);
        //                           },
        //                           child: Padding(
        //                             padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
        //                             child: Row(
        //                               children: [
        //                                 Image.asset(Constants.IconPath+'school-bus1.png',height: 30,),
        //                                 SizedBox(width: 5,),
        //                                 Expanded(
        //                                   child: Column(children: [
        //                                     Container(
        //                                       alignment: Alignment.centerLeft,
        //                                       child: Text(
        //                                         'Availing',
        //                                         textScaleFactor: 1,
        //                                         style: TextStyle(
        //                                             fontSize: 12,
        //                                             color: Colors.black38
        //                                         ),
        //                                         textAlign: TextAlign.start,
        //                                       ),
        //                                     ),
        //                                     SizedBox(height: 5,),
        //                                     Container(
        //                                       alignment: Alignment.centerLeft,
        //                                       child: Text(
        //                                           '''Transport''',
        //                                           textScaleFactor: 1,
        //                                           style: TextStyle(
        //                                             fontSize: 14,
        //                                           ),
        //                                           textAlign: TextAlign.start
        //                                       ),
        //                                     ),
        //                                     SizedBox(height: 5,),
        //                                   ],),
        //                                 ),
        //                               ],
        //                             ),
        //                           ),
        //                         )
        //
        //                     ),
        //                     dashCtrl.isfeedbackforms.value?  InkWell(
        //                       // style: ButtonStyle(
        //                       //   padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        //                       //   elevation: MaterialStateProperty.all(0),
        //                       //   backgroundColor: MaterialStateProperty.all(Colors.transparent)
        //                       // ),
        //                       onTap: ()async{
        //                         dashCtrl.themeBack();
        //                         feedbackCtrl.saveFeedback=[];
        //                         feedbackCtrl.rating=[];
        //                         feedbackCtrl.currentPage=0;
        //                         var FeedBackDropDownbyType=await Repository().getFeedBackDropDownbyType(dashCtrl.sibilmodel.studentEnrollmentId,dashCtrl.sibilmodel.studentEnrollmentId,1);
        //                         feedbackCtrl.feebackdropDownMdl=[];
        //                         feedbackCtrl.feebackdropDownMdl.addAll(FeedBackDropDownbyType.map<FeedBackDropDownModel>((e)=>FeedBackDropDownModel.fromJson(e)));
        //                         var questions=await Repository().getFeedBackQuestions(dashCtrl.sibilmodel.studentEnrollmentId,1);
        //                         feedbackCtrl.feebackquestionsMdl=[];
        //                         feedbackCtrl.feebackquestionsMdl.addAll(questions.map<FeedBackQuestionsModel>((e)=>FeedBackQuestionsModel.fromJson(e)));
        //                         feedbackCtrl.rating = List<double>.filled(feedbackCtrl.feebackquestionsMdl.length, 1);
        //                         if(feedbackCtrl.feebackquestionsMdl.isNotEmpty){
        //                           feedbackCtrl.feedbackQuestionSheet(feedbackCtrl.feebackdropDownMdl[0].name.toString(),feedbackCtrl.feebackdropDownMdl[0],context);
        //                         }else{
        //                           Logger.showSnackBartrans(title: 'Alert', msg: 'No Data Found');
        //                         }
        //                       },
        //                       child: Padding(
        //                         padding: const EdgeInsets.only(right: 5),
        //                         child: Image.asset(Constants.IconPath+'feedbackunselected.png',height: 25,),
        //                       ),
        //                     ):Center()
        //                   ],
        //                 ),
        //               ),
        //             ):Center(),
        //             dashCtrl.isLunch.value?Padding(
        //               padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
        //               child: Container(
        //                 decoration:  dashCtrl.isTransport.value?BoxDecoration(
        //                   color: Constants.hexToColor('#fafafa'),
        //                   border: Border.all(color: Colors.black26),
        //                   borderRadius: BorderRadius.circular(5),
        //                 ):BoxDecoration(),
        //                 child: Row(
        //                   children: [
        //                     Expanded(
        //                       child: InkWell(
        //                         onTap: (){
        //                           dashCtrl.themeBack();
        //                           Constants.menuTitle='Lunch';
        //                           Repository().getStudentLunchDetails(dashCtrl.sibilmodel.studentEnrollmentId, dashCtrl.sibilmodel.branchID,int.parse(DateTime.now().month.toString()), int.parse(DateTime.now().year.toString()),'');
        //                         },
        //                         child: Padding(
        //                           padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5),
        //                           child: Row(
        //                             children: [
        //                               Image.asset(Constants.IconPath+'oatmeal.png',height: 30),
        //                               SizedBox(width: 5,),
        //                               Expanded(
        //                                 child:Container(
        //                                   alignment: Alignment.centerLeft,
        //                                   child: Text(
        //                                       'Lunch',
        //                                       textScaleFactor: 1,
        //                                       style: TextStyle(
        //                                         fontSize: 16,
        //                                       ),
        //                                       textAlign: TextAlign.start
        //                                   ),
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                     dashCtrl.isfeedbackforms.value?  InkWell(
        //                       // style: ButtonStyle(
        //                       //   padding: MaterialStateProperty.all(EdgeInsets.all(0)),
        //                       //   elevation: MaterialStateProperty.all(0),
        //                       //   backgroundColor: MaterialStateProperty.all(Colors.transparent)
        //                       // ),
        //                       onTap: ()async{
        //                         dashCtrl.themeBack();
        //                         feedbackCtrl.saveFeedback=[];
        //                         feedbackCtrl.rating=[];
        //                         feedbackCtrl.currentPage=0;
        //                         var FeedBackDropDownbyType=await Repository().getFeedBackDropDownbyType(dashCtrl.sibilmodel.studentEnrollmentId,dashCtrl.sibilmodel.studentEnrollmentId,2);
        //                         feedbackCtrl.feebackdropDownMdl=[];
        //                         feedbackCtrl.feebackdropDownMdl.addAll(FeedBackDropDownbyType.map<FeedBackDropDownModel>((e)=>FeedBackDropDownModel.fromJson(e)));
        //                         var questions=await Repository().getFeedBackQuestions(dashCtrl.sibilmodel.studentEnrollmentId,2);
        //                         feedbackCtrl.feebackquestionsMdl=[];
        //                         feedbackCtrl.feebackquestionsMdl.addAll(questions.map<FeedBackQuestionsModel>((e)=>FeedBackQuestionsModel.fromJson(e)));
        //                         feedbackCtrl.rating = List<double>.filled(feedbackCtrl.feebackquestionsMdl.length, 1);
        //                         if(feedbackCtrl.feebackquestionsMdl.isNotEmpty){
        //                           feedbackCtrl.feedbackQuestionSheet(feedbackCtrl.feebackdropDownMdl[0].name.toString(),feedbackCtrl.feebackdropDownMdl[0],context);
        //                         }else{
        //                           Logger.showSnackBartrans(title: 'Alert', msg: 'No Data Found');
        //                         }
        //                       },
        //                       child: Padding(
        //                         padding: const EdgeInsets.only(right: 5),
        //                         child: Image.asset(Constants.IconPath+'feedbackunselected.png',height: 25,),
        //                       ),
        //                     ):Center()
        //                   ],
        //                 ),
        //               ),
        //             ):Center(),
        //           ],))
        //     ],
        //   ),
        // ),
        // dashCtrl.isAttendance.value
        //     ?
        // InkWell(
        //   onTap: ()async {
        //     dashCtrl.themeBack();
        //     // Repository().getStudentAttendenceStatus(
        //     //     dashCtrl.sibilmodel.academicYearID,
        //     //     dashCtrl.sibilmodel.studentEnrollmentId);
        //     Constants.menuTitle='Attendance';
        //     Get.toNamed(AttendanceView.routeName);
        //   },
        //   child: Container(
        //     alignment: Alignment.centerLeft,
        //     padding: const EdgeInsets.all(20),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Text(textScaleFactor: 1,
        //               dashCtrl.attendenceperMdl.monthName!=null?   "Attendance (${dashCtrl.attendenceperMdl.monthName??''})": "Attendance",
        //               style: const TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w400,
        //               )),
        //         ),
        //         const Icon(
        //           Icons.arrow_forward_ios,
        //           size: 20,
        //         )
        //       ],
        //     ),
        //   ),
        // )
        //     : const Center(),
        //
        // Container(
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         color: (Colors.grey.withOpacity(0.09)),
        //         offset: const Offset(0.0, 1.5),
        //         blurRadius: 2,
        //         spreadRadius: 2,
        //       ),
        //     ],
        //     color: Colors.white,
        //   ),
        //
        //   child: Row(
        //     children: [
        //       dashCtrl.isAttendance.value?    Expanded(
        //           child: Container(
        //             decoration: const BoxDecoration(
        //                 border: Border(
        //                     right: BorderSide(color: Colors.black12)
        //                 )
        //             ),
        //             padding: const EdgeInsets.all(10),
        //             child: Column(
        //               children: [
        //                 Row(
        //                   children: [
        //                     Image.asset(
        //                         '${Constants.IconPath}location 1.png'),
        //                     Text(textScaleFactor: 1,
        //                       dashCtrl.attendenceperMdl.percentage != null
        //                           ?  '  ${((double.parse(dashCtrl
        //                           .attendenceperMdl.presented
        //                           .toString()) /
        //                           double.parse(dashCtrl
        //                               .attendenceperMdl
        //                               .totalWorking
        //                               .toString())) *
        //                           100)
        //                           .toStringAsFixed(2)}%':'  0%',
        //                       overflow: TextOverflow.ellipsis,
        //                       style: const TextStyle(
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: 14,
        //                       ),
        //                     )
        //                   ],
        //                 ),
        //                 const SizedBox(
        //                   height: 5,
        //                 ),
        //                 Container(
        //                   alignment: Alignment.centerLeft,
        //                   child: const Text(textScaleFactor: 1,
        //                     'Over all %',
        //                     overflow: TextOverflow.ellipsis,
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           )):const Center(),
        //       dashCtrl.isAttendance.value?   Expanded(
        //           child: Container(
        //             decoration: const BoxDecoration(
        //                 border: Border(
        //                     right: BorderSide(color: Colors.black12)
        //                 )
        //             ),
        //             padding: const EdgeInsets.all(10),
        //             child: Column(
        //               children: [
        //                 Row(
        //                   children: [
        //                     Image.asset(
        //                         '${Constants.IconPath}attendencesss.png'),
        //                     Text(textScaleFactor: 1,
        //                       dashCtrl.attendenceperMdl.percentage != null
        //                           ? '  ${double.parse(dashCtrl.attendenceperMdl.presented.toString())
        //                           .toStringAsFixed(0)}':'  0',
        //                       overflow: TextOverflow.ellipsis,
        //                       style: const TextStyle(
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: 14,
        //                       ),
        //                     ),
        //                     Text(textScaleFactor: 1,
        //                       dashCtrl.attendenceperMdl.percentage != null
        //                           ? '/${double.parse(dashCtrl
        //                           .attendenceperMdl.totalWorking
        //                           .toString())
        //                           .toStringAsFixed(0)}':'/0',
        //                       overflow: TextOverflow.ellipsis,
        //                       style: const TextStyle(
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: 12,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 const SizedBox(
        //                   height: 5,
        //                 ),
        //                 Container(
        //                   alignment: Alignment.centerLeft,
        //                   child: const Text(textScaleFactor: 1,
        //                     'Present Days',
        //                     overflow: TextOverflow.ellipsis,
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           )):const Center(),
        //       dashCtrl.isApplyStudentLeave.value?  Expanded(
        //           flex: 1,
        //           child: InkWell(
        //             onTap: ()async{
        //               dashCtrl.themeBack();
        //               // var data=await Repository().getStudentLeaveDetailsBySID(dashCtrl.sibilmodel.studentEnrollmentId, dashCtrl.sibilmodel.academicYearID);
        //               Constants.menuTitle='Apply Leave';
        //               Get.toNamed(LeaveRequestView.routeName,arguments: {'from':1});
        //             },
        //             child: Container(
        //               padding: const EdgeInsets.all(5),
        //               child: Column(
        //                 children: [
        //                   Container(alignment: Alignment.centerLeft,
        //                       child: Image.asset('${Constants.IconPath}apology.png')),
        //                   const SizedBox(
        //                     height: 5,
        //                   ),
        //                   Container(
        //                     alignment: Alignment.centerLeft,
        //                     child: GradientText(
        //                       'Leave Intimations',
        //                       style: const TextStyle(
        //                         fontWeight: FontWeight.w400,
        //                         fontSize: 12,
        //                       ),
        //                       overflow: TextOverflow.ellipsis,
        //                       maxlines: 1,
        //                       gradient: LinearGradient(colors: [
        //                         Constants.hexToColor('#009CFF'),
        //                         Constants.hexToColor('#246699'),
        //                       ]),
        //                     ),
        //                   )
        //                 ],
        //               ),
        //             ),
        //           )):const Center(),
        //     ],
        //   ),
        // ),
        Wrap(
          children: [
        for(int i=0;i<dashCtrl.classspecificlist.length;i++)...[
              if(dashCtrl.classspecificlist[i]["menuName"]=="gallery")
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,bottom:12,right: 12.0),
                  child:
                  InkWell(
                    onTap: (){
                      Constants.menuTitle='Gallery';
                      Get.toNamed(GalleryView.routeName);
                    },
                    child:menuContainer(dashCtrl.classspecificlist[i]["menuTitle"].toString(),dashCtrl.classspecificlist[i]['iconUrl'],"Childs Gallery", Get.width/2.8,),
                  ),
                ),
              if(dashCtrl.classspecificlist[i]["menuName"]=="todayupdates")
                Padding(
                  padding: const EdgeInsets.only(left:  12.0,bottom:12,right: 12.0),
                  child:
                  InkWell(
                    onTap: (){
                      Constants.menuTitle='What\'s New';
                      Get.toNamed(WhatsNewView.routeName);
                    },
                    child:menuContainer(dashCtrl.classspecificlist[i]["menuTitle"].toString(),dashCtrl.classspecificlist[i]['iconUrl'],"Today updates", Get.width/2,),
                  ),
                ),
              if(dashCtrl.classspecificlist[i]["menuName"]=="classdiary")
                Padding(
          padding:const EdgeInsets.only(left: 12.0,bottom:12,right: 12.0),
          child:
          InkWell(
            onTap: (){
              Constants.menuTitle='Class Diary';
             Get.toNamed(ClassDiaryView.routeName);
            },
            child:menuContainer(dashCtrl.classspecificlist[i]["menuTitle"].toString(),dashCtrl.classspecificlist[i]['iconUrl'],"View Today's classwork and homework", Get.width,),
          ),
        ),
        ],
    ],
    ),


        Wrap(
          children: [
          for(int i=0;i<dashCtrl.communicationlist.length;i++)...[
            if(dashCtrl.communicationlist[i]["menuName"]=="chat")
              Padding(
                padding: const EdgeInsets.only(left: 12.0,bottom:3,right: 12.0),
                child:
                InkWell(
                  onTap: (){
                    Constants.menuTitle='Student Wall';
                    Get.toNamed(ChatProfileView.routeName);
                  },
                  child:menuContainer(dashCtrl.communicationlist[i]["menuTitle"].toString(),dashCtrl.communicationlist[i]['iconUrl'],"Messages", Get.width/2.5,),
                ),
              ),
            if(dashCtrl.communicationlist[i]["menuName"]=="announcements")
              Padding(
                padding: const EdgeInsets.only(left: 12.0,bottom:14,right: 12.0),
                child:
                InkWell(
                  onTap: (){
                    Constants.menuTitle='Attendance';
                    Get.toNamed(AnnouncementsView.routeName);
                  },
                  child:menuContainer(dashCtrl.communicationlist[i]["menuTitle"].toString(),dashCtrl.communicationlist[i]['iconUrl'],"Important posts from school", Get.width/1.2,),
                ),
              ),
          ],
        ],),

        
        
        
        //
        // dashCtrl.communicationlist.isNotEmpty?
        // Container(
        //   alignment: Alignment.centerLeft,
        //   padding: const EdgeInsets.all(20),
        //   child: const Text(textScaleFactor: 1,"Communication 💬",
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.w400,
        //       )),
        // ):Center(),
        // dashCtrl.communicationlist.isNotEmpty?GridView.builder(
        //   padding: const EdgeInsets.all(0),
        //   gridDelegate:
        //   const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3,
        //       crossAxisSpacing: 2,
        //       mainAxisSpacing: 2,
        //       mainAxisExtent: 100),
        //   shrinkWrap: true,
        //   physics:
        //   const NeverScrollableScrollPhysics(),
        //   itemBuilder: (BuildContext context, int i) {
        //     return InkWell(
        //       onTap: () {
        //         dashCtrl.themeBack();
        //         Constants.menuName=dashCtrl.communicationlist[i]['menuName']??'';
        //         Constants.menuTitle=dashCtrl.communicationlist[i]['menuTitle']??'';
        //         String webURl='';
        //         if(Constants.menuApplyStudentLeave.trim()==Constants.menuName.trim()){
        //           Get.toNamed(LeaveRequestView.routeName);
        //         }else if(Constants.menugeneo.trim()==Constants.menuName.trim()){
        //           Constants.launchurl('${Constants.geneoUrl}${SessionManager.getString(Constants.pref_mUserGUID)}&token=${SessionManager.getString(Constants.pref_mid_Token)}');
        //         }else if(dashCtrl.communicationlist[i]['redirectURL'].toString()!='null'&&dashCtrl.communicationlist[i]['redirectURL'].toString()!=''&&dashCtrl.communicationlist[i]['redirectURL'].toString().length>0){
        //           webURl=Repository().getparsedWebUrl(dashCtrl.communicationlist[i]['redirectURL']);
        //           Constants.launchurl(webURl);
        //         }else if(dashCtrl.communicationlist[i]['webViewURL'].toString()!='null'&&dashCtrl.communicationlist[i]['webViewURL'].toString()!=''&&dashCtrl.communicationlist[i]['webViewURL'].toString().length>0){
        //           webURl=Repository().getparsedWebUrl(dashCtrl.communicationlist[i]['webViewURL']);
        //           Constants.appBarInstantGradient1=Constants.lightorganceColor;
        //           Constants.appBarInstantGradient2=Constants.appThemeColor ;
        //           Constants.appBarwebViewColor=Colors.white;
        //           Get.toNamed(WebView.routeName,arguments:{'title':Constants.menuTitle,'url':webURl});
        //         }else{
        //           if(Constants.menuchat==Constants.menuName){
        //             // dashCtrl.chatcontroller.index=0;
        //           }else if(Constants.menuconversations==Constants.menuName){
        //             // dashCtrl.chatcontroller.index=1;
        //           }
        //           PageNavigation().menuRouting(Constants.menuName);
        //         }
        //         if(Constants.menuchat==Constants.menuName){
        //           // dashCtrl.chatcontroller.index=0;
        //         }else if(Constants.menuconversations==Constants.menuName){
        //           // dashCtrl.chatcontroller.index=1;
        //         }
        //
        //         setState(() {
        //
        //         });
        //       },
        //       child: Container(
        //         padding: EdgeInsets.only(bottom: 10),
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             boxShadow: [
        //               BoxShadow(
        //                 color: (Colors.grey
        //                     .withOpacity(0.09)),
        //                 offset:
        //                 const Offset(0.0, 1.5),
        //                 blurRadius: 0,
        //                 spreadRadius: 2,
        //               ),
        //             ]),
        //         child:Column(
        //           children: [
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Expanded(
        //               child:  dashCtrl.communicationlist[i]['count']!=0&&dashCtrl.communicationlist[i]['count'].toString()!='null'?Stack(
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.all(10),
        //                     child: CachedNetworkImage(
        //                         imageUrl: dashCtrl.communicationlist[i]['iconUrl']
        //                             .toString(),
        //                         fit: BoxFit.fill,
        //                         // width: Get.width / 8,
        //                         placeholder: (context, url) => const Center(
        //                             child: CircularProgressIndicator()),
        //                         errorWidget: (context, url, error) => Image.asset(
        //                           Constants.IconPath +
        //                               Constants.ImagePath +'noimage.jpg',
        //                           fit: BoxFit.fitWidth,width: Get.width/ 8,)
        //                     ),
        //                   ),
        //                   Positioned(
        //                     right: 0,
        //                     top: 10,
        //                     child:
        //                     Container(
        //                       alignment:
        //                       Alignment
        //                           .center,
        //                       padding: const EdgeInsets
        //                           .only(
        //                           left: 5,
        //                           right: 5),
        //                       // width:27,
        //                       height: 17,
        //                       decoration:
        //                       BoxDecoration(
        //                           borderRadius: BorderRadius.circular(
        //                               7),
        //                           gradient:
        //                           LinearGradient(
        //                             begin:
        //                             Alignment.centerLeft,
        //                             end:
        //                             Alignment.centerRight,
        //                             colors: Constants.appThemegradient,
        //                           )),
        //                       child: Text(
        //                         dashCtrl.communicationlist[i]['count'].toString(),
        //                         style: const TextStyle(
        //                             color: Colors
        //                                 .white),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ): Padding(
        //                 padding: const EdgeInsets.all(10),
        //                 child: CachedNetworkImage(
        //                     imageUrl: dashCtrl.communicationlist[i]['iconUrl']
        //                         .toString(),
        //                     fit: BoxFit.fill,
        //                     // width: Get.width / 8,
        //                     placeholder: (context, url) => const Center(
        //                         child: CircularProgressIndicator()),
        //                     errorWidget: (context, url, error) => Image.asset(
        //                         Constants.ImagePath +'noimage.jpg',
        //                         fit: BoxFit.fitWidth,
        //                         width: Get.width / 8)
        //                 ),
        //               ),
        //               // Image.asset(
        //               //     Constants.IconPath +
        //               //         dashCtrl.administrationlist[i]
        //               //         ['imageName'])
        //             ),
        //             Text(textScaleFactor: 1,
        //               dashCtrl.communicationlist[i]['menuTitle'].toString(),
        //               overflow: TextOverflow.ellipsis,
        //               style: const TextStyle(
        //                   fontSize: 12,
        //                   color: Colors.grey,
        //                   fontWeight: FontWeight.w400
        //               ),
        //               maxLines: 1,
        //               textAlign: TextAlign.center,
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        //   itemCount: dashCtrl.communicationlist.length,
        // ):Center(),
        // dashCtrl.administrationlist.isNotEmpty?Container(
        //   alignment: Alignment.centerLeft,
        //   padding: const EdgeInsets.all(20),
        //   child: const Text(textScaleFactor: 1,"Administration 🏫",
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.w400,
        //       )),
        // ):Center(),
        // dashCtrl.administrationlist.isNotEmpty?GridView.builder(
        //   padding: const EdgeInsets.all(0),
        //   gridDelegate:
        //   const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3,
        //       crossAxisSpacing: 2,
        //       mainAxisSpacing: 2,
        //       mainAxisExtent: 100),
        //   shrinkWrap: true,
        //   physics:
        //   const NeverScrollableScrollPhysics(),
        //   itemBuilder: (BuildContext context, int i) {
        //     return InkWell(
        //       onTap: (){
        //         dashCtrl.themeBack();
        //         Constants.menuName=dashCtrl.administrationlist[i]['menuName']??'';
        //         Constants.menuTitle=dashCtrl.administrationlist[i]['menuTitle']??'';
        //         String webURl='';
        //         if(Constants.menuApplyStudentLeave.trim()==Constants.menuName.trim()){
        //           Get.toNamed(LeaveRequestView.routeName);
        //         }else if(Constants.menugeneo.trim()==Constants.menuName.trim()){
        //           Constants.launchurl('${Constants.geneoUrl}${SessionManager.getString(Constants.pref_mUserGUID)}&token=${SessionManager.getString(Constants.pref_mid_Token)}');
        //         }else if(dashCtrl.administrationlist[i]['redirectURL'].toString()!='null'&&dashCtrl.administrationlist[i]['redirectURL'].toString()!=''&&dashCtrl.administrationlist[i]['redirectURL'].toString().length>0){
        //           webURl=Repository().getparsedWebUrl(dashCtrl.administrationlist[i]['redirectURL']);
        //           Constants.launchurl(webURl);
        //         }else if(dashCtrl.administrationlist[i]['webViewURL'].toString()!='null'&&dashCtrl.administrationlist[i]['webViewURL'].toString()!=''&&dashCtrl.administrationlist[i]['webViewURL'].toString().length>0){
        //           webURl=Repository().getparsedWebUrl(dashCtrl.administrationlist[i]['webViewURL']);
        //           Constants.appBarInstantGradient1=Constants.lightorganceColor;
        //           Constants.appBarInstantGradient2=Constants.appThemeColor ;
        //           Constants.appBarwebViewColor=Colors.white;
        //           Get.toNamed(WebView.routeName,arguments:{'title':Constants.menuTitle,'url':webURl});
        //         }else{
        //           if(Constants.menuchat==Constants.menuName){
        //             // dashCtrl.chatcontroller.index=0;
        //           }else if(Constants.menuconversations==Constants.menuName){
        //             // dashCtrl.chatcontroller.index=1;
        //           }
        //           PageNavigation().menuRouting(Constants.menuName);
        //         }
        //         if(Constants.menuchat==Constants.menuName){
        //           // dashCtrl.chatcontroller.index=0;
        //         }else if(Constants.menuconversations==Constants.menuName){
        //           // dashCtrl.chatcontroller.index=1;
        //         }
        //       },
        //       child: Container(
        //         padding: EdgeInsets.only(bottom: 10),
        //         decoration: BoxDecoration(
        //             color: Colors.white,
        //             boxShadow: [
        //               BoxShadow(
        //                 color: (Colors.grey
        //                     .withOpacity(0.09)),
        //                 offset: const Offset(0.0, 1.5),
        //                 blurRadius: 0,
        //                 spreadRadius: 2,
        //               ),
        //             ]),
        //         child: Column(
        //           children: [
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Expanded(
        //               child:  dashCtrl.administrationlist[i]['count']!=0&&dashCtrl.administrationlist[i]['count'].toString()!='null'?Stack(
        //                 children: [
        //                   Padding(
        //                     padding: const EdgeInsets.all(10),
        //                     child: CachedNetworkImage(
        //                         imageUrl: dashCtrl.administrationlist[i]['iconUrl']
        //                             .toString(),
        //                         fit: BoxFit.fill,
        //                         // width: Get.width / 8,
        //                         placeholder: (context, url) => const Center(
        //                             child: CircularProgressIndicator()),
        //                         errorWidget: (context, url, error) => Image.asset(
        //                           Constants.IconPath +
        //                               dashCtrl.administrationlist[i]['menuTitle'],
        //                           fit: BoxFit.fitWidth,width: Get.width/ 8,)
        //                     ),
        //                   ),
        //                   Positioned(
        //                     right: 0,
        //                     top: 10,
        //                     child:
        //                     Container(
        //                       alignment:
        //                       Alignment
        //                           .center,
        //                       padding: const EdgeInsets
        //                           .only(
        //                           left: 5,
        //                           right: 5),
        //                       // width:27,
        //                       height: 17,
        //                       decoration:
        //                       BoxDecoration(
        //                           borderRadius: BorderRadius.circular(
        //                               7),
        //                           gradient:
        //                           LinearGradient(
        //                             begin:
        //                             Alignment.centerLeft,
        //                             end:
        //                             Alignment.centerRight,
        //                             colors: Constants.appThemegradient,
        //                           )),
        //                       child: Text(
        //                         dashCtrl.administrationlist[i]['count'].toString(),
        //                         style: const TextStyle(
        //                             color: Colors
        //                                 .white),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ): Padding(
        //                 padding: const EdgeInsets.all(10),
        //                 child: CachedNetworkImage(
        //                     imageUrl: dashCtrl.administrationlist[i]['iconUrl']
        //                         .toString(),
        //                     fit: BoxFit.fill,
        //                     // width: Get.width / 8,
        //                     placeholder: (context, url) => const Center(
        //                         child: CircularProgressIndicator()),
        //                     errorWidget: (context, url, error) => Image.asset(
        //                         Constants.ImagePath +'noimage.jpg',
        //                         fit: BoxFit.fitWidth,
        //                         width: Get.width / 8)
        //                 ),
        //               ),
        //               // Image.asset(
        //               //     Constants.IconPath +
        //               //         dashCtrl.administrationlist[i]
        //               //         ['imageName'])
        //             ),
        //             Text(textScaleFactor: 1,
        //               dashCtrl.administrationlist[i]['menuTitle'].toString(),
        //               overflow: TextOverflow.ellipsis,
        //               style: const TextStyle(
        //                   fontSize: 12,
        //                   color: Colors.grey,
        //                   fontWeight: FontWeight.w400
        //               ),
        //               maxLines: 1,
        //               textAlign: TextAlign.center,
        //             )
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        //   itemCount: dashCtrl.administrationlist.length,
        // ):Center(),
        // if(dashCtrl.isInvoiceFee.value)
        //   Column(
        //     children: [
        //       dashCtrl.isFee.value&&dashCtrl.isImmediateFee.value? dashCtrl.duedashboard.isNotEmpty?
        //       const SizedBox(
        //         height: 20,
        //       )
        //           :Center():Center(),
        //       dashCtrl.isFee.value&&dashCtrl.isImmediateFee.value? dashCtrl.duedashboard.isNotEmpty?
        //       Container(
        //         padding: const EdgeInsets.all(20),
        //         decoration: BoxDecoration(boxShadow: [
        //           BoxShadow(
        //             color: (Colors.grey.withOpacity(0.09)),
        //             offset: const Offset(0.0, 1.5),
        //             blurRadius: 2,
        //             spreadRadius: 2,
        //           ),
        //         ], color: Colors.white),
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 Expanded(
        //                     child: Row(
        //                       children: [
        //                         Text(textScaleFactor: 1,
        //                             dashCtrl.duedashboard.length>1?'Immediate ':
        //                             "Term ${dashCtrl.duedashboard[0].insallmentSno}/${dashCtrl.duedashboard[0].noOfTimesPay} .",
        //                             style: TextStyle(
        //                                 fontSize: 14,
        //                                 fontWeight:
        //                                 FontWeight.w500,
        //                                 color: Colors.blue)),
        //                         Expanded(
        //                           child: Text(textScaleFactor: 1,
        //                             "Fee Payment (${dashCtrl.sibilmodel.className.toString()} . ${dashCtrl.sibilmodel.section.toString()})",
        //                             style: const TextStyle(
        //                               fontSize: 14,
        //                               fontWeight:
        //                               FontWeight.w500,
        //                             ),
        //                             maxLines: 1,
        //                             overflow: TextOverflow.ellipsis,
        //
        //                           ),
        //                         ),
        //                       ],
        //                     )),
        //                 IconButton(
        //                     onPressed: () {
        //                       Get.toNamed(SchoolFeePaymentView.routeName);
        //                     },
        //                     icon: const Icon(Icons
        //                         .arrow_forward_ios_outlined))
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Row(
        //               children: [
        //                 Expanded(
        //                   child: Column(
        //                     children: [
        //                       Container(
        //                         alignment:
        //                         Alignment.centerLeft,
        //                         child: Text(textScaleFactor: 1,Constants.rupeesymbol+
        //                             authCtrl.value.format(int.parse(double.parse(dashCtrl
        //                                 .duefinalamount
        //                                 .toString())
        //                                 .toStringAsFixed(0))),
        //                           style: const TextStyle(
        //                             fontSize: 24,
        //                             fontWeight:
        //                             FontWeight.w400,
        //                           ),
        //                         ),
        //                       ),
        //                       Row(
        //                         children: [
        //                           const Text(textScaleFactor: 1,"Due Date :",
        //                               style: TextStyle(
        //                                 fontSize: 12,
        //                                 fontWeight:
        //                                 FontWeight.w300,
        //                               )),
        //                           Text(textScaleFactor: 1,
        //                               dashCtrl.duedashboard[0]
        //                                   .dueDate
        //                                   .toString(),
        //                               style:
        //                               const TextStyle(
        //                                 fontSize: 12,
        //                                 fontWeight:
        //                                 FontWeight.w400,
        //                               ))
        //                         ],
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //                 InkWell(
        //                   onTap: () {
        //                     dashCtrl.themeBack();
        //                     Get.toNamed(SchoolFeePaymentView.routeName);
        //                   },
        //                   child: Container(
        //                     alignment: Alignment.center,
        //                     width: 120,
        //                     height: 36,
        //                     decoration: BoxDecoration(
        //                         border: Border.all(
        //                             color:Constants.appThemeColor),
        //                         borderRadius:
        //                         BorderRadius.circular(
        //                             20)),
        //                     child:  Text(textScaleFactor: 1,"Pay Now",
        //                         style: TextStyle(
        //                           color: Constants.appThemeColor,
        //                           fontSize:
        //                           14,
        //                           fontWeight:
        //                           FontWeight.w400,
        //                         )),
        //                   ),
        //                 )
        //               ],
        //             )
        //           ],
        //         ),
        //       )
        //           :Center():Center(),
        //     ],
        //   ),
        // dashCtrl.isAnnouncememnts.value?dashCtrl.announcemodel.isNotEmpty
        //     ? Container(
        //   alignment: Alignment.centerLeft,
        //   padding: const EdgeInsets.all(20),
        //   child: Row(
        //     children: [
        //       const Text(textScaleFactor: 1,"Latest Updates ",
        //           style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w400,
        //           )),//🔊
        //       Image.asset(Constants.IconPath+'speaker.png',height: 17,)
        //     ],
        //   ),
        // )
        //     : const Center():Center(),





















        // dashCtrl.isAnnouncememnts.value?dashCtrl.announcemodel.length > 0
        //     ? ListView.separated(
        //   physics:
        //   const NeverScrollableScrollPhysics(),
        //   padding: EdgeInsets.zero,
        //   shrinkWrap: true,
        //   itemCount:
        //   dashCtrl.announcemodel.length,
        //   itemBuilder:
        //       (BuildContext context, int i) {
        //     return Container(
        //       decoration:
        //       BoxDecoration(boxShadow: [
        //         BoxShadow(
        //           color: (Colors.grey
        //               .withOpacity(0.09)),
        //           offset:
        //           const Offset(0.0, 1.5),
        //           blurRadius: 2,
        //           spreadRadius: 2,
        //         ),
        //       ], color: Colors.white),
        //       child: Column(
        //         children: [
        //           Container(
        //             padding: const EdgeInsets.only(
        //                 left: 20,
        //                 top: 20,
        //                 bottom: 20),
        //             alignment: Alignment.centerLeft,
        //             // width: Get.width,
        //             // height: 80,
        //             child: Row(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: BoxDecoration(
        //                     color: colors[i % colors.length],
        //                     shape: BoxShape.circle,
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius:
        //                     BorderRadius.circular(50),
        //                     child: CachedNetworkImage(
        //                       imageUrl:  dashCtrl.announcemodel[i]
        //                           .photoUrl
        //                           .toString(),
        //                       fit: BoxFit.cover,
        //                       placeholder: (context,
        //                           url) =>
        //                       const Center(
        //                           child:
        //                           CircularProgressIndicator()),
        //                       errorWidget: (context,
        //                           url, error) =>
        //                           Align(
        //                               alignment:
        //                               Alignment
        //                                   .center,
        //                               child: Text(textScaleFactor: 1,
        //                                 dashCtrl.announcemodel[
        //                                 i]
        //                                     .prefix
        //                                     .toString().toUpperCase(),
        //                                 style: TextStyle(
        //                                     fontWeight:
        //                                     FontWeight
        //                                         .w500,
        //                                     fontSize:
        //                                     16,
        //                                     color: Colors
        //                                         .white),
        //                               )
        //
        //                             // Image.asset(
        //                             //   '${Constants.ImagePath}noimage.jpg',
        //                             //   // width: Get.width,
        //                             //   // height: 58,
        //                             //   // fit: BoxFit.fill,
        //                             // ),
        //                           ),),
        //                   ),),
        //                 const SizedBox(
        //                   width: 10,
        //                 ),
        //                 Expanded(
        //                   flex: 3,
        //                   child: Column(
        //                     children: [
        //                       Container(
        //                         alignment: Alignment.centerLeft,
        //                         // width:
        //                         // Get.width / 2,
        //                         child: Text(textScaleFactor: 1,
        //                           dashCtrl.announcemodel[
        //                           i]
        //                               .announcementFrom
        //                               .toString(),
        //                           style: const TextStyle(
        //                               fontWeight:
        //                               FontWeight
        //                                   .w500,
        //                               fontSize:
        //                               16),
        //                           textAlign:
        //                           TextAlign
        //                               .start,
        //                           maxLines: 1,
        //                           overflow: TextOverflow.ellipsis,
        //                         ),
        //                       ),
        //                       Container(
        //                         alignment: Alignment.centerLeft,
        //                         child: Text(textScaleFactor: 1,
        //                           // dashCtrl
        //                           //     .announcemodel[
        //                           // i]
        //                           //     .announcementFrom
        //                           //     .toString()+
        //                           dashCtrl.announcemodel[
        //                           i]
        //                               .sdate
        //                               .toString(),
        //                           style: const TextStyle(
        //                               color: Colors
        //                                   .grey,
        //                               fontWeight:
        //                               FontWeight
        //                                   .w300,
        //                               fontSize: 12),
        //                           maxLines: 1,
        //                           overflow: TextOverflow.ellipsis,
        //                           textAlign: TextAlign.start,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //
        //                 // IconButton(
        //                 //   onPressed: () {},
        //                 //   icon: Image.asset(
        //                 //     '${Constants.IconPath}archive-add.png',
        //                 //     color: Colors.grey,
        //                 //   ),
        //                 // ),
        //                 dashCtrl.announcemodel[i].isViewed==true?Image.asset(
        //                   '${Constants.IconPath}announceread.png',
        //                   color: Constants.hexToColor('#0D1282').withOpacity(0.18),
        //                   height: 25,
        //                 ): Stack(
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.only(right: 3),
        //                       child: Image.asset(
        //                         '${Constants.IconPath}announceunread.png',
        //                         color: Constants.hexToColor('#0D1282').withOpacity(0.18),
        //                         height: 25,
        //                       ),
        //                     ),
        //                     Positioned(
        //                         right: 0,
        //                         top: 0,
        //                         child: Container(
        //                           height: 8,
        //                           width: 8,
        //                           decoration: BoxDecoration(
        //                               shape: BoxShape.circle,
        //                               color: Colors.red
        //                           ),
        //                         ))
        //                   ],
        //                 ),
        //                 MenuAnchor(
        //                   builder:
        //                       (BuildContext context, MenuController controller, Widget? child) {
        //                     return IconButton(
        //                       onPressed: () {
        //                         if (controller.isOpen) {
        //                           controller.close();
        //                         } else {
        //                           controller.open();
        //                         }
        //                       },
        //                       icon:
        //                       Image.asset(
        //                         '${Constants.IconPath}morecircle.png',
        //                         // color: Colors.black,
        //                       ),
        //                     );
        //                   },
        //                   menuChildren: List<MenuItemButton>.generate(
        //                     typeList.length,
        //                         (int index) => MenuItemButton(
        //                         onPressed: () async {
        //                           await retrieveCalendars();
        //                           await dashCtrl.getEventAddGoogleCalendar( context,dashCtrl.announcemodel[i]);
        //                           setState(() {
        //
        //                           });},
        //                         child:  Text(textScaleFactor: 1,typeList[index].toString())
        //                     ),
        //                   ),
        //                 ),
        //                 // IconButton(
        //                 //   onPressed: () {},
        //                 //   icon:
        //                 //   Image.asset(
        //                 //     '${Constants.IconPath}googleaddcalendar.png',
        //                 //     // color: Colors.black,
        //                 //   ),
        //                 // ),
        //               ],
        //             ),
        //           ),
        //           const Divider(
        //               thickness: 1, height: 0),
        //           // Container(
        //           //   alignment: Alignment.centerLeft,
        //           //   padding: const EdgeInsets.only(left: 20,top: 10),
        //           //   child: Container(
        //           //     padding:
        //           //     EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
        //           //     decoration: BoxDecoration(
        //           //       borderRadius:
        //           //       BorderRadius
        //           //           .circular(3),
        //           //       color: colors1[i % colors.length],
        //           //     ),
        //           //     child: Text(textScaleFactor: 1,
        //           //       dashCtrl.announcemodel[i]
        //           //           .announcementType
        //           //           .toString(),
        //           //       style: TextStyle(
        //           //           color:
        //           //           Colors.white,
        //           //           fontSize: 12
        //           //       ),
        //           //     ),
        //           //   ),
        //           // ),
        //           Container(
        //             alignment: Alignment.centerLeft,
        //             padding: const EdgeInsets.only(left: 20,top: 10),
        //             child: Text(textScaleFactor: 1,
        //               dashCtrl.announcemodel[i]
        //                   .announcementType
        //                   .toString(),
        //               style: TextStyle(
        //                   color:
        //                   Colors.black,
        //                   // fontSize: 12
        //                 fontWeight: FontWeight.w600
        //               ),
        //             ),
        //           ),
        //           SizedBox(height: 10,),
        //           Padding(padding: EdgeInsets.only(left: 20,right: 10),
        //             child:Column(children: [
        //               Container(
        //                 alignment: Alignment.centerLeft,
        //                 child: HtmlWidget(
        //                  dashCtrl. announcemodel[i]
        //                       .announcementTitle
        //                       .toString(),
        //                 ),
        //               ),
        //               SizedBox(height: 10,),
        //               Row(
        //                 children: [
        //                   Expanded(
        //                     child: Container(
        //                         alignment: Alignment.centerLeft,
        //                         child: Text(Bidi.stripHtmlIfNeeded(dashCtrl.announcemodel[i].announcementMessage??''),maxLines: 1,overflow: TextOverflow.ellipsis,)),
        //                   ),
        //                   TextButton(
        //                       onPressed: ()async{
        //                         var data=await Repository().getAnnouncementMessageByID(dashCtrl.announcemodel[i].announcementID, dashCtrl.sibilmodel.userID);
        //                         if(data['status'].toString()=='1'){
        //                           dashCtrl.announcemodel[i].isViewed==true;
        //                           setState(() {
        //                           });
        //                         }
        //                         Get.toNamed(DetailedAnnouncementView.routeName,arguments: dashCtrl.announcemodel[i]);
        //                       },
        //                       child: Text('View More..',style: TextStyle(color: Constants.appThemeColor),))
        //                 ],
        //               ),
        //               // Container(
        //               //   alignment: Alignment.centerLeft,
        //               //   child: HtmlWidget(dashCtrl.announcemodel[i]
        //               //       .announcementMessage
        //               //       .toString(),
        //               //     onTapUrl: (url)=>
        //               //         Constants.launchurl(url.toString()),
        //               //     renderMode: RenderMode.column,
        //               //   ),
        //               // ),
        //               // dashCtrl.announcemodel[i].viewers!=null?
        //               // Builder(
        //               //     builder: (context) {
        //               //       List <Viewers>attachmnt=[];
        //               //       List <Viewers>attachmentImages=[];
        //               //       attachmnt.addAll(dashCtrl.announcemodel[i].viewers!.map((e) => Viewers.fromJson(e)));
        //               //       attachmentImages.addAll(attachmnt.where((element) =>  element.filePath.toString().toUpperCase().contains('PNG') ||
        //               //           element.filePath.toString().toUpperCase().contains('JPG') ||
        //               //           element.filePath.toString().toUpperCase().contains('GIF') ||
        //               //           element.filePath.toString().toUpperCase().contains('HEIC') ||
        //               //           element.filePath.toString().toUpperCase().contains('HEIF') ||
        //               //           element.filePath.toString().toUpperCase().contains('JPEG')));
        //               //       return Column(
        //               //         children: [
        //               //           attachmentImages.length>0? CarouselSlider(
        //               //               options: CarouselOptions(
        //               //                   autoPlay: attachmentImages.length>1?true:false,
        //               //                   aspectRatio: 1.2,
        //               //                   viewportFraction: 1,
        //               //                   enlargeCenterPage: true,
        //               //                   autoPlayInterval: const Duration(seconds: 5)),
        //               //               items:attachmentImages
        //               //                   .map((item) {return Container(
        //               //                 decoration: BoxDecoration(
        //               //                     borderRadius:
        //               //                     BorderRadius.circular(15)),
        //               //                 margin: const EdgeInsets.all(0),
        //               //                 child:CachedNetworkImage(
        //               //                   imageUrl: item.filePath ?? '',
        //               //                   fit: BoxFit.fill,
        //               //                   width: Get.width,
        //               //                   height: Get.height,
        //               //                   placeholder: (ctx, url) => const Center(
        //               //                     child: CircularProgressIndicator(),
        //               //                   ),
        //               //                   errorWidget: (ctx, url, error) =>
        //               //                       Image.asset(
        //               //                           '${Constants.ImagePath}noimage.jpg'),
        //               //                 ),
        //               //               );})
        //               //                   .toList()):Center(),
        //               //           ListView.separated(
        //               //               padding: EdgeInsets.zero,
        //               //               shrinkWrap: true,
        //               //               physics: NeverScrollableScrollPhysics(),
        //               //               itemBuilder: (BuildContext context, int index) {
        //               //                 return attachmnt[index].filePath.toString()!='null'&&attachmnt[index].filePath!=''?Column(
        //               //                   children: [
        //               //                     SizedBox(height: 10,),
        //               //                     InkWell(
        //               //                       onTap: () async {
        //               //                         authCtrl.permissionReady = await  authCtrl.checkPermission();
        //               //                         print( authCtrl.permissionReady);
        //               //                         if( authCtrl.permissionReady) {
        //               //                           Repository().openFile(url: attachmnt[index]
        //               //                               .filePath.toString(),
        //               //                               name: attachmnt[index]
        //               //                                   .fileName.toString());
        //               //                         }
        //               //                       },
        //               //                       child: Container(
        //               //                         decoration: BoxDecoration(
        //               //                           color: Constants.backGroundColor,
        //               //                           borderRadius: BorderRadius.circular(10),
        //               //                         ),
        //               //                         padding: EdgeInsets.all(10),
        //               //                         child: Row(
        //               //                           children: [
        //               //                             Image.asset(
        //               //                                 attachmnt[index].fileType.toString(),height: 30,
        //               //                               fit: BoxFit.fill,
        //               //                             ),
        //               //                             Expanded(
        //               //                                 child: Text(textScaleFactor: 1,
        //               //                                   "  " + attachmnt[index].fileName.toString(),
        //               //                                   maxLines: 1,
        //               //                                   overflow: TextOverflow.ellipsis,
        //               //                                 )),
        //               //                             Icon(
        //               //                               Icons.arrow_forward_ios,
        //               //                               size: 15,
        //               //                               color: Colors.grey,
        //               //                             )
        //               //                           ],
        //               //                         ),
        //               //                       ),
        //               //                     ),
        //               //                   ],
        //               //                 ):Center();
        //               //               },
        //               //               separatorBuilder: (ctx, i) => SizedBox(
        //               //                 height: 10,
        //               //               ),
        //               //               itemCount: attachmnt.length),
        //               //         ],
        //               //       );
        //               //     }
        //               // ):Center(),
        //               SizedBox(height: 10,),
        //             ],),),
        //           const Divider(
        //               thickness: 1, height: 0),
        //           Row(
        //             children: [
        //               SizedBox(width: 20,),
        //               Expanded(
        //                   child: IconButton(
        //                       onPressed: () {
        //                         dashCtrl.getcomments(dashCtrl.announcemodel[i].announcementID, context,'1');
        //                       },
        //                       icon:  Row(
        //                         children: [
        //                           // Expanded(
        //                           //     child:
        //                           //     Center()),
        //                           Icon(Icons.message_outlined,color: Colors.black54),
        //                           // Image.asset(Constants
        //                           //     .IconPath +
        //                           //     'message-text.png'),
        //                           Text(textScaleFactor: 1,'  '+dashCtrl.announcemodel[i]
        //                               .noOfComments
        //                               .toString(),style: TextStyle(color: Colors.black54),),
        //                           // Expanded(
        //                           //     child:
        //                           //     Center()),
        //                         ],
        //                       ))),
        //               Expanded(
        //                 flex: 1,
        //                 child: IconButton(
        //                     onPressed: () {
        //                       String message="Using MyClassBoard :${dashCtrl.sibilmodel.organisationName}\n${dashCtrl.announcemodel[i].announcementType}\n${dashCtrl.announcemodel[i].sdate}\n${Bidi.stripHtmlIfNeeded(dashCtrl.announcemodel[i].announcementTitle.toString())}+\n"+Bidi.stripHtmlIfNeeded(dashCtrl.announcemodel[i].announcementMessage.toString());
        //                       String title=" ";
        //                       Repository().shareAnnounce(title,message);
        //                     },
        //                     icon: Row(
        //                       children: [
        //                         Icon(Icons.share_outlined,color: Colors.black54),
        //                         Text(textScaleFactor: 1,''
        //                             .toString(),style: TextStyle(color: Colors.black54),),
        //                       ],
        //                     )
        //                   // Image.asset(
        //                   //     Constants
        //                   //         .IconPath +
        //                   //         'send-2.png')
        //                 ),
        //               ),
        //               Expanded(
        //                 flex: 1,
        //                   child:
        //                   Row(children: [
        //                     Icon(Icons.remove_red_eye_outlined,color: Colors.black54,),
        //                     Expanded(
        //                       child: Text(textScaleFactor: 1,'  '+dashCtrl.announcemodel[
        //                       i]
        //                           .noOfViews
        //                           .toString(),
        //                         style: TextStyle(color: Colors.black54),
        //                         overflow: TextOverflow.ellipsis,
        //                         maxLines: 1,
        //                         textAlign: TextAlign.start,
        //
        //                       ),
        //                     ),
        //                     // Expanded(
        //                     //     child:
        //                     //     Center()),
        //                   ],
        //                   )),
        //               dashCtrl.isChat.value? Expanded(
        //                   flex: 2,
        //                   child: IconButton(
        //                       onPressed: () {
        //                         chtdata=[];
        //                         chtdata.add(TeachersChatListModel(
        //                           userID: dashCtrl.announcemodel[i].userID,
        //                           staffCode1: dashCtrl.announcemodel[i].staffCode1.toString(),
        //                           staffname: dashCtrl.announcemodel[i].staffFullName!=''?dashCtrl.announcemodel[i].staffFullName:dashCtrl.announcemodel[i].announcementFrom,
        //                           photoUrl:dashCtrl. announcemodel[i].photoUrl,
        //                           prefix: dashCtrl.announcemodel[i].prefix.toString().toUpperCase(),
        //                           type:dashCtrl.announcemodel[i].designation,
        //                           subjectName: '',
        //                         ));
        //                         Repository().getSchoolChtProfile(
        //                             dashCtrl.sibilmodel.userID,
        //                             dashCtrl.announcemodel[i].userID,
        //                             dashCtrl.sibilmodel.branchID,
        //                             dashCtrl.sibilmodel.organisationID,
        //                             dashCtrl.sibilmodel.classID,
        //                             dashCtrl.sibilmodel.branchSectionID,
        //                             chtdata[0],'',0);
        //                         // Repository().getSchoolChtProfile(dashCtrl.sibilmodel.userID,dashCtrl.teacherchtMdl[i].userID, dashCtrl.sibilmodel.branchID, dashCtrl.sibilmodel.organisationID, dashCtrl.sibilmodel.classID, dashCtrl.sibilmodel.branchSectionID,dashCtrl.teacherchtMdl[i],'');
        //                       },
        //                       icon: Row(
        //                         children: [
        //                           Image.asset(Constants
        //                               .IconPath +
        //                               'repeate-one.png',height: 30,color: Colors.black87,),
        //                           Expanded(
        //                             child: const Text(textScaleFactor: 1,
        //                                 '  Private Reply',style: TextStyle(color: Colors.black54,fontSize: 12),),
        //                           )
        //                         ],
        //                       ))):Center(),
        //             ],
        //           )
        //         ],
        //       ),
        //     );
        //   },
        //   separatorBuilder:+
        //       (BuildContext context,
        //       int index) =>
        //   const SizedBox(
        //     height: 10,
        //   ),
        // )
        //     : const Center():Center(),
      ],
    );
  }
  retrieveCalendars() async {
    try {
      var permissionsGranted = await deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess &&  (permissionsGranted.data == null || permissionsGranted.data == false)) {
        permissionsGranted = await deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || permissionsGranted.data == null || permissionsGranted.data == false) {
          return;
        }
      }
      final calendarsResult = await deviceCalendarPlugin.retrieveCalendars();
      // setState(() {
      List <Calendar>dummy=[];
      dummy = calendarsResult.data as List<Calendar>;
      dashCtrl.calendars=[];
      dashCtrl.calendars .addAll(dummy.where((element) => element.isReadOnly==false));
      // });
    } on PlatformException catch (e, s) {
      debugPrint('RETRIEVE_CALENDARS: $e, $s');
    }
  }
  Widget menuContainer(String title,String iconUrl,String desc,double width){
    return  Container(
      width:width,
      padding: const  EdgeInsets.fromLTRB(7,10,7,5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: (Colors.grey
                  .withOpacity(0.09)),
              offset:
              const Offset(0.0, 1.5),
              blurRadius: 0,
              spreadRadius: 2,
            ),
          ]),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${title}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(height: 5,),
          Text("$desc",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black54),)
          , Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CachedNetworkImage(
                  imageUrl: iconUrl
                      .toString(),
                  fit: BoxFit.fill,
                  width: Get.width / 8,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(
                    Constants.IconPath +
                        Constants.ImagePath +'noimage.jpg',
                    fit: BoxFit.fitWidth,width: Get.width/ 8,)
              ),
            ),
          )
        ],
      ),




    );
  }


}
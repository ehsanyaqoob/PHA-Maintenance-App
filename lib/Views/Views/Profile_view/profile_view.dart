import 'dart:io';

import 'package:get/get.dart';
import 'package:pharesidence/Controllers/profile_avatar.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/bottm_sheet.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_generic_button.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/homeView.dart';
import 'package:pharesidence/Views/Views/Profile_view/Account/account_view.dart';
import 'package:pharesidence/Views/Views/Profile_view/Edit_Profile/profile_sec_view.dart';

import '../../../Generic_Widgets/Widgets/custom_loarder.dart';
import '../../../Shared/Prefrences/shared_pref.dart';
import '../../getStartedView.dart';
import 'Account/PayeeManagementView.dart';
import 'Complaint/complaint_view.dart';
import 'Settings/settings_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  var controller = Get.find<HomeController>();
  var profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'User Profile',
        onLeadingPressed: () => Get.back(),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 26.0,
            vertical: 26.0,
          ),
          child: Column(
            children: [
              // SizedBox(
              //   height: 20.h,
              // ),
              Container(
                height: 200.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGray_1.withOpacity(0.85),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showWhatsAppLikeBottomSheet(
                          onCameraTap: profileController.captureFromCamera,
                          onGalleryTap: profileController.pickFromGallery,
                          onDeleteTap: profileController.deleteAvatar,
                          showDeleteOption:
                          profileController.avatarPath.value.isNotEmpty,
                        );
                      },
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/png/Ellipse.png')
                        as ImageProvider,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() => PHAText(
                      textAlign: TextAlign.center,
                      text: controller.user.value.name ?? '',
                      color: AppColors.blackGray,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    )),

                    PHAText(
                      textAlign: TextAlign.center,
                      text: 'Member# ${controller.user.value.memberType?.toUpperCase()}',
                      color: AppColors.lightGray_1,
                      fontSize: 14.sp,
                    ),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: CustomButtonWithIcon(
                        text: 'Profile',
                        icon: Icons.person,
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.white,
                        iconColor: AppColors.white,
                        onTap: () {
                          // Get.to(ProfileSecView());
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 130.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGray_1.withOpacity(0.85),
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36.0, vertical: 20.0),
                  child: Column(
                    children: [
                      CustomButtonWithIcon(
                            text: 'Settings',
                            icon: Icons.settings,
                            backgroundColor: AppColors.primary,
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                            onTap: () {
                              // Get.to(SettingsView());
                            },
                          ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.to(ComplaintView());
                        },
                        child: PHAButton(
                          //topMargin: 6.0,
                          title: 'Complaint',
                          fillColor: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                       Get.to(AccountStatementView());
                    },
                    child: Container(
                      height: 100.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGray_1.withOpacity(0.85),
                            offset: Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_add_rounded,
                              size: 40, color: AppColors.primary),
                          PHAText(
                            textAlign: TextAlign.center,
                            text: 'Account\nStatement',
                            fontSize: 22,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                       Get.to(PayeeManagementView());
                    },
                    child: Container(
                      height: 100.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGray_1.withOpacity(0.85),
                            offset: Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_2_outlined,
                              size: 40, color: AppColors.primary),
                          PHAText(
                            textAlign: TextAlign.center,
                            text: 'Payee\nManagement',
                            fontSize: 22,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              PHAText(
                text: 'PHA Digital Version 1.0.0 ',
                fontSize: 14,
              ),
              PHAText(
                text: 'Terms and Conditions ',
                color: AppColors.primary,
                fontSize: 14,
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

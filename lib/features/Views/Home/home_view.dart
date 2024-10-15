import 'dart:ffi';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Splash_view/get_start_view.dart';
import 'GridViews/helpviews.dart';
import 'GridViews/projects/projects_views.dart';
import 'GridViews/servicesview.dart';
import 'GridViews/sosviews.dart';

class HomeView extends StatelessWidget {
  final Map<String, dynamic> apiData;
  HomeView({required this.apiData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      resizeToAvoidBottomInset: true, // Ensure the view resizes
      backgroundColor: AppColors.AppSecondary,
      appBar: _buildAppBar(
        context,
        apiData['name'] ?? 'User',
      ),
      body: Stack(
        children: [
          // Background Logo
          Positioned.fill(
            child: Container(
              child: Image.asset(
                'assets/png/back.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Overlay
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying all available data dynamically
                    if (apiData['cnic'] != null)
                      _buildInfoCard(
                          'CNIC',
                          apiData['cnic'],
                          'assets/png/icon_cnic_card.svg',
                          AppColors.appWhite,
                          AppColors.CardColor),
                    if (apiData['mobile_no'] != null)
                      _buildInfoCard('Mobile No', apiData['mobile_no'],
                          'assets/png/icon_phone_bold.svg', AppColors.appWhite, AppColors.CardColor),

                    SizedBox(height: 10.h),
                    // Search bar
                    PHATextFormField(
                      title: 'Search Projects',
                      hint: 'Search',
                      prefix: Icon(Icons.search,
                          size: 28, color: AppColors.blackColor),
                    ),
                    SizedBox(height: 10.h),
                    // Properties Summary
                    _buildPropertiesSummary(),

                    // Horizontal ListView instead of GridView
                    SizedBox(
                      height: 150.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // here need to send cnic back to
                            },
                            child: _buildCard(
                                'Property & Payments', Icons.business, () {
                              Get.to(ProjectsViews());
                            }),
                          ),
                          _buildCard('Services', Icons.settings, () {
                            Get.to(ServicesViews());
                          }),
                          _buildCard('Help', Icons.help, () {
                            Get.to(HelpViews());
                          }),
                          _buildCard('SOS', Icons.warning_amber_rounded, () {
                            Get.to(SoSViews());
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPropertiesSummary() {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PHAText(
            text: 'Properties Summary',
            fontSize: 18.sp,
            fontWeight: FontWeight.w800),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SummaryItem(image: 'assets/png/icon_gray_structure.svg', count: '2', type: 'Grey Structure(s)'),
            SummaryItem(image: 'assets/png/icon_apartments.svg', count: '0', type: 'Apartment(s)'),
            SummaryItem(image: 'assets/png/icon_commercial.svg', count: '0', type: 'Commercial(s)'),
          ],
        )
      ],
    ),
  );
}

Widget _buildInfoCard(String label, String value, String image,
    Color cardColor, Color iconColor) {
  return Container(
    height: 60.h,
    width: double.infinity,
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white,
          Color(0xffB8D3E1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5,
          spreadRadius: 1,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            height: 45.h,
            width: 45.h,
            padding: EdgeInsets.all(14),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xff2E81A4)),
            child: SvgPicture.asset(
                image,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PHAText(
                  text: label,
                  textAlign: TextAlign.left,
                  fontSize: 14.sp,
                  color: AppColors.appBlack,
                  fontWeight: FontWeight.w600,
                ),
                PHAText(
                  text: value,
                  textAlign: TextAlign.left,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.appBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

AppBar _buildAppBar(BuildContext context, String name) {
  return AppBar(
    toolbarHeight: 70.h,
    backgroundColor: AppColors.AppSecondary,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          // Navigate to Profile view
        },
        child: Obx(
          () => CircleAvatar(
            radius: 40.r,
            backgroundImage: controller.avatarPath.value.isNotEmpty
                ? FileImage(File(controller.avatarPath.value))
                : AssetImage('assets/png/Ellipse.png') as ImageProvider,
          ),
        ),
      ),
    ),
    title: PHAText(
      text: name,
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
      color: AppColors.AppPrimary,
    ),
    actions: [
      Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.bg_grey,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          highlightColor: AppColors.appBlack,
          icon: Icon(
            Icons.menu,
            color: AppColors.appWhite,
            size: 36,
          ),
          onPressed: () {
            // Get.to(CustomDrawer());
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    ],
  );
}

Widget _buildCard(String title, IconData icon, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
    child: Container(
      height: 90.h,
      width: 150, // Set a width for horizontal cards
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.appWhite, AppColors.CardColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: AppColors.AppPrimary),
            SizedBox(height: 10.h),
            PHAText(
              textAlign: TextAlign.center,
              text: title,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.AppPrimary,
            ),
          ],
        ),
      ),
    ),
  );
}

class SummaryItem extends StatelessWidget {
  final String image;
  final String count;
  final String type;

  SummaryItem({required this.image, required this.count, required this.type});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(child:
          SvgPicture.asset(image),
          borderRadius: BorderRadius.circular(10.0)
        ),
        // Container(width: 88.h, height: 75.h,)
      ],
    );
  }
}

import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/custom_loarder.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/Shared/Controllers.dart/project_controller.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Home/GridViews/projects/projects_views.dart';
import 'package:pharesidence/features/Views/Profile_view/profile_view.dart';
import '../../../Shared/Controllers.dart/project_controller.dart';
import '../Drawer/custom_drawer.dart';
import 'GridViews/helpviews.dart';
import 'GridViews/servicesview.dart';
import 'GridViews/sosviews.dart';

class HomeView extends StatefulWidget {
  final Map<String, dynamic> apiData;
  HomeView({required this.apiData});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //final ProjectsViews = Get.put(ProjectsViewController());

  final ProjectsViewController controller = Get.put(ProjectsViewController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.fetchProjects('3520169791715');
    controller.fetchAdditionalInfo('3520169791715');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.AppSecondary,
      appBar: _buildAppBar(
        context,
        widget.apiData['name'] ?? 'User',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 26.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying all available data dynamically
                    if (widget.apiData['cnic'] != null)
                      _buildInfoCard(
                          'CNIC',
                          widget.apiData['cnic'],
                          'assets/png/icon_cnic_card.svg',
                          AppColors.appWhite,
                          AppColors.CardColor),
                    if (widget.apiData['mobile_no'] != null)
                      _buildInfoCard(
                          'Mobile No',
                          widget.apiData['mobile_no'],
                          'assets/png/icon_phone_bold.svg',
                          AppColors.appWhite,
                          AppColors.CardColor),

                    SizedBox(height: 10.h),
                    // Search bar
                    PHATextFormField(
                      title: 'Search Projects',
                      hint: 'Search',
                      suffix: Icon(Icons.home),
                      prefix: Icon(Icons.search,
                          size: 28, color: AppColors.blackColor),
                    ),
                    SizedBox(height: 10.h),
                    // Properties Summary
                    _buildPropertiesSummary(),

// Implement vertical scroll with ListView and full width for cards
                    SizedBox(
                      height: 400, // Adjust height as needed
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          _buildCard(
                              'Property & Payments', 'assets/svg/home.svg', () {
                            controller
                                .fetchProjects(widget.apiData['cnic'])
                                .then((_) {
                              Get.to(
                                  ProjectsViews(cnic: widget.apiData['cnic']));
                            }).catchError((error) {
                              Get.snackbar(
                                  'Error', 'Failed to fetch projects: $error');
                            });
                          }),
                          _buildCard('Services', 'assets/svg/services.svg', () {
                            Get.to(ServicesViews());
                          }),
                          _buildCard('Help', 'assets/svg/help.svg', () {
                            Get.to(HelpViews());
                          }),
                          _buildCard('SOS', 'assets/svg/sos.svg', () {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SummaryItem(
                image: 'assets/png/icon_gray_structure.svg',
                count: '0',
                type: 'Grey Structure',
                onTap: () {
                  Get.snackbar(
                    'Grey Structure',
                    'Sorry! You don\'t have any Grey Structure property.',
                    icon: Icon(Icons.error, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    borderRadius: 8,
                    margin: EdgeInsets.all(15),
                    duration: Duration(seconds: 5),
                    isDismissible: true,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryItem(
                image: 'assets/png/icon_apartments.svg',
                count: '0',
                type: 'Apartment',
                onTap: () {
                  Get.snackbar(
                    'Apartment',
                    'Sorry! You don\'t have any Apartment property.',
                    icon: Icon(Icons.error, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    borderRadius: 8,
                    margin: EdgeInsets.all(15),
                    duration: Duration(seconds: 5),
                    isDismissible: true,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SummaryItem(
                image: 'assets/png/icon_commercial.svg',
                count: '0',
                type: 'Commercial',
                onTap: () {
                  Get.snackbar(
                    'Commercial',
                    'Sorry! You don\'t have any Commercial property.',
                    icon: Icon(Icons.error, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    borderRadius: 8,
                    margin: EdgeInsets.all(15),
                    duration: Duration(seconds: 5),
                    isDismissible: true,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildInfoCard(String label, String value, String image, Color cardColor,
    Color iconColor) {
  return Container(
    height: 60.h,
    width: double.infinity,
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white,
          Color.fromARGB(255, 68, 173, 225),
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
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
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
          Get.to(ProfileView());
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
      Builder(
        builder: (context) {
          return Container(
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
                Scaffold.of(context).openDrawer();
              },
            ),
          );
        },
      ),
    ],
  );
}

Widget _buildCard(String title, String svgAssetPath, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
    child: Container(
      width: double.infinity, // Full width
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.appWhite, AppColors.CardColor.withOpacity(0.9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.AppPrimary.withOpacity(0.5),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              svgAssetPath,
              width: 50,
              height: 50,
              color: AppColors.AppPrimary.withOpacity(0.85),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.AppPrimary,
                ),
              ),
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
  final VoidCallback onTap; // Callback for tap action

  SummaryItem({
    required this.image,
    required this.count,
    required this.type,
    required this.onTap, // Add onTap as a required parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Assign the onTap callback here
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: SvgPicture.asset(
                  image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Text(
                    count,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            type,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

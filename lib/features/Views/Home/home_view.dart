import 'dart:io';
import 'package:get/get.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
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
      appBar: _buildAppBar(context,apiData['name'] ?? 'User', ), 
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
          SingleChildScrollView( 
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Displaying all available data dynamically
                  if (apiData['cnic'] != null)
                    _buildInfoCard('CNIC', apiData['cnic'], Icons.card_membership, AppColors.appWhite, AppColors.CardColor),
                  if (apiData['mobile_no'] != null)
                    _buildInfoCard('Mobile No', apiData['mobile_no'], Icons.phone, AppColors.appWhite, AppColors.CardColor),
                  
                  SizedBox(height: 10.h),
                  // Search bar
                  PHATextFormField(
                    title: 'Search Projects',
                    hint: 'Search',
                    prefix: Icon(Icons.search, size: 28, color: AppColors.greycolor),
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
                              onTap: (){
                                // here need to send cnic back to 
                              }, 

                          child: _buildCard('Property & Payments', Icons.business, () {
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
            fontWeight: FontWeight.w800
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SummaryItem(count: '2', type: 'Grey Structure(s)'),
              SummaryItem(count: '0', type: 'Apartment(s)'),
              SummaryItem(count: '0', type: 'Commercial(s)'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon, Color cardColor, Color iconColor) {
    return Container(
      height: 60.h,
      width: double.infinity, 
      margin: const EdgeInsets.all(8.0), 
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, size: 30, color: AppColors.appWhite),
            ), 
            SizedBox(width: 20), 
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PHAText(
                    text: label,
                    textAlign: TextAlign.left, 
                    fontSize: 16.sp,
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  PHAText(
                    text: value,
                    textAlign: TextAlign.left, 
                    fontSize: 14.sp, 
                    fontWeight: FontWeight.normal,
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

  AppBar _buildAppBar(BuildContext context,String name) {
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
  final String count;
  final String type;

  SummaryItem({required this.count, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
           Container(
            height: 80.h,
          width: 90.w, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/png/img_background.jpeg'), 
              fit: BoxFit.cover, 
            ),
            borderRadius: BorderRadius.circular(10),
          ),
            
            
            alignment: Alignment.center, 
            child: CircleAvatar(
              backgroundColor: AppColors.CardColor,
              radius: 22.r,
              child: PHAText(
                text: count,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.AppPrimary,
              ),
            ),
          ),
      ],),
        SizedBox(height: 6.h),
        PHAText(
          text: type,
          fontSize: 12.sp,
          color: AppColors.appBlack,
        ),
      ],
    );
  }
}

import 'dart:io';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pharesidence/Generic_Widgets/Widgets/pha_text.dart';
import 'package:pharesidence/exports/exports.dart';
import 'package:pharesidence/features/Views/Home/GridViews/helpviews.dart';
import 'package:pharesidence/features/Views/Home/GridViews/projects/projects_views.dart';
import 'package:pharesidence/features/Views/Home/GridViews/servicesview.dart';
import 'package:pharesidence/features/Views/Home/GridViews/sosviews.dart';

class HomeView extends StatelessWidget {
  final String cnic;
  final String cell;


  HomeView({required this.cnic, required this.cell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.AppSecondary, // Define a background color
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display CNIC and phone number
              PHAText(
                text: 'CNIC: $cnic',
                fontSize: 12.sp,
                color: AppColors.AppPrimary,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8),
              PHAText(
                text: 'Phone: $cell',
                fontSize: 12.sp,
                color: AppColors.AppPrimary,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PHAText(
                    text: 'Category',
                    fontSize: 12.sp,
                    color: AppColors.AppPrimary,
                    fontWeight: FontWeight.bold,
                  ), 
                  SizedBox(width: 10.w,),
                  PHAText(
                    text: 'OWNER',
                    fontSize: 12.sp,
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              // Search bar
              PHATextFormField(
                title: 'Search Projects',
                hint: 'Search',
                prefix: Icon(Icons.search, size: 28, color: AppColors.greycolor),
              ),
              SizedBox(height: 10.h),
             
                Container(
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
                          SummaryItem(count: '2', type: 'Grey Structure(s)'),
                          SummaryItem(count: '0', type: 'Apartment(s)'),
                          SummaryItem(count: '0', type: 'Commercial(s)'),
                        ],
                      )
                    ],
                  ),
                ),
            
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: [
                  _buildCard('Property & Payemnts', Icons.business, (){
                    Get.to(ProjectsViews());
                  }),
                  _buildCard('Services', Icons.settings, () {
                    Get.to(ServicesViews());
                  }),
                  _buildCard('Help', Icons.help,() {
                    Get.to(HelpViews());
                  }),
                  _buildCard('SOS', Icons.warning_amber_rounded,  (){
                    Get.to(SoSViews());
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon,  VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Card(
        
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: onTap, // Call the provided onTap function
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: AppColors.AppPrimary),
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

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor: AppColors.AppSecondary,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            // Navigate to Profile view
            // Get.to(ProfileView());
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
        text: "Mr. Shahid Hussain",
        fontWeight: FontWeight.bold, 
        fontSize: 20.sp,
        color: AppColors.AppPrimary,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColors.AppPrimary,
            size: 36,
          ),
          onPressed: () {
            // Navigate to Updates view
            // Get.to(UpdateView());
          },
        ),
      ],
    );
  }
}




class SummaryItem extends StatelessWidget {
  String? count, type;
  SummaryItem({super.key, this.count, this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.AppPrimary,
          radius: 35,
          child: PHAText(
            text: count ?? '0',
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        PHAText(
          text: type ?? '',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        )
      ],
    );
  }
}
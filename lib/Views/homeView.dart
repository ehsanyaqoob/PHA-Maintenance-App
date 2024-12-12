import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';

class HomeModel {
  String image, title, count;
  VoidCallback onTap;
  HomeModel({required this.image, required this.title, this.count = '0', required this.onTap});
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            AppBackground(),

            // Content Overlay
            Positioned(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: ListView(
                  children: [
                    PHAHomeAppBar(),

                    SizedBox(height: 8.h),

                    Obx(() => InfoCardItem(
                        image: AppAssets.imgCNIC,
                        title: AppConstants.typeYourCNIC,
                        subTitle: controller
                            .formatCNIC(controller.user.value.cnic ?? ''),
                        reverseColor: false)),

                    Obx(() => InfoCardItem(
                        image: AppAssets.imgContact,
                        title: AppConstants.typeYourMobile,
                        subTitle: controller.formatPhoneNumber(
                            controller.user.value.mobileNo ?? ''),
                        reverseColor: true)),

                    SizedBox(height: 10.h),

                    // Search bar
                    PHATextFormField(
                      title: AppConstants.searchProjects,
                      hint: AppConstants.search,
                      suffix: Icon(Icons.home),
                      prefix:
                          Icon(Icons.search, size: 28, color: AppColors.black),
                    ),

                    SizedBox(height: 10.h),

                    PHAText(
                        text: AppConstants.propertySummary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),

                    SizedBox(height: 10.h),

                    Obx(() => Row(
                      children: controller.listOfPropertySummary
                          .map((model) => SummaryItem(model: model))
                          .toList(),
                    )),

                    SizedBox(height: 10.h),

                    Column(
                      children: controller.listOfServices
                          .map((model) => ServicesItem(model: model))
                          .toList(),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

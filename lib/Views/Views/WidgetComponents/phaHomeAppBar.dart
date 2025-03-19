import 'package:get/get.dart';
import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:pharesidence/Views/Views/Profile_view/profile_view.dart';

class PHAHomeAppBar extends StatelessWidget {
  const PHAHomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to Profile view, passing apiData
                Get.to(ProfileView());
              },
              child: CircleAvatar(
                radius: 22.r,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, size: 30.sp, color: AppColors.white),
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  PHAText(
                    text: controller.user.value.name ?? '',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.blackGray,
                  ),
                  PHAText(
                    text: controller.user.value.memberType == 'owner'
                        ? 'Owner'
                        : 'Tenant / کرایہ دار',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ])),
            SizedBox(width:6.w),
            GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                width: 35.h,
                height: 35.h,
                decoration: BoxDecoration(
                    color: AppColors.blackGray,
                    borderRadius: BorderRadius.all(Radius.circular(35.h / 2))),
                child: Icon(
                  Icons.menu,
                  color: AppColors.white,
                  size: 20.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

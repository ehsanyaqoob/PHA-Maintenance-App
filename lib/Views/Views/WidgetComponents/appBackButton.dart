import 'package:pharesidence/Utils/exports/exports.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  String title;
  AppBackButton({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 17,
          left: 0,
          right: 0,
          child: PHAText(
              text: title,
              textAlign: TextAlign.center,
              color: AppColors.blackGray,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp),
        ),
        Positioned(
          top: 12,
          left: 16,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 35.h,
              height: 35.h,
              decoration: BoxDecoration(
                  color: AppColors.blackGray,
                  borderRadius: BorderRadius.all(Radius.circular(35.h/2))
              ),
              child: Icon(Icons.arrow_back, color: AppColors.white, size: 25.h,),
            ),
          ),
        ),
      ],
    );
  }
}

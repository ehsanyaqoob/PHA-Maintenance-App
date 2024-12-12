import 'package:pharesidence/Utils/exports/exports.dart';

class ServicesItem extends StatelessWidget {
  HomeModel model;
  bool reverseColor = false;
  ServicesItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              AppColors.primary.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border:
          Border.all(color: AppColors.primary.withOpacity(0.5), width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.h,
                // padding: EdgeInsets.all(14),
                // decoration: BoxDecoration(
                //     shape: BoxShape.circle, color: AppColors.primary),
                child: SvgPicture.asset(
                  model.image,
                  // colorFilter: ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PHAText(
                      text: model.title,
                      textAlign: TextAlign.left,
                      fontSize: 14.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
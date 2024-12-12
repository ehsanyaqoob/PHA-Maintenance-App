import 'package:pharesidence/Utils/exports/exports.dart';

class InfoCardItem extends StatelessWidget {
  String image, title, subTitle;
  bool reverseColor = false;
  InfoCardItem(
      {super.key,
        required this.image,
        required this.title,
        required this.subTitle,
        required this.reverseColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: !reverseColor
              ? [
            AppColors.white,
            AppColors.primary.withOpacity(0.2),
          ]
              : [
            AppColors.primary.withOpacity(0.2),
            AppColors.white,
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
              height: 45.h,
              width: 45.h,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary),
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
                    text: title,
                    textAlign: TextAlign.left,
                    fontSize: 14.sp,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  PHAText(
                    text: subTitle,
                    textAlign: TextAlign.left,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:pharesidence/Utils/exports/exports.dart';

class AdditionalInfoItem extends StatelessWidget {
  String title, description;
  AdditionalInfoItem(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColors.lightGray_1, width: 1.5))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(width: 8.w),
          Expanded(
            child: PHAText(
                text: title,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.sp),
          ),
          Expanded(
            flex: 1,
            child: PHAText(
                text: description,
                color: AppColors.blackGray,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp),
          )
        ],
      ),
    );
  }
}

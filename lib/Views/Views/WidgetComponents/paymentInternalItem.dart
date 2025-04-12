import 'package:pharesidence/Utils/exports/exports.dart';

class PropertyInternalItem extends StatelessWidget {
  String title, value;
  PropertyInternalItem(
      {super.key,
        required this.title,
        required this.value
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PHAText(
            text: title.toUpperCase(),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          SizedBox(height: 2.h),
          PHAText(
            text: value.toUpperCase(),
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}